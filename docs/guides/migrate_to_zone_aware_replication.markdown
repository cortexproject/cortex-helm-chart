---
layout: page
title: Migrate to zone-aware replication
parent: Guides
has_children: false
has_toc: false
---

# Migrate to zone-aware replication
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Overview

This migration guide shows how to migrate to zone-aware replication without downtime or data loss.
With zone-aware replication, each replica of incoming samples is distributed across ingesters in different zones. This means that loss of a full zone is possible without downtime.

The general migration process is the following: New stateful sets are created, the write traffic is routed to them, the read traffic is routed to them, the old stateful set is disabled.
During the migration, it is ensured that at most one ingester is unavailable at the time, and that an ingester's data is always written to persistent storage before it is shut down.

The chart makes use of the [rollout-operator](https://github.com/grafana/rollout-operator) to coordinate rollouts of the stateful sets. This will automatically set the stateful set's update strategy to `OnDelete`.

## Prerequisites

Make sure to set the following settings before starting the migration:
- Ingesters are deployed as a stateful set (deployment is currently not supported)
- Autoscaling is disabled (autoscaling is not supported for zone-aware ingesters)
- `podManagementPolicy` is "OrderedReady" (default), not "Parallel" (OrderedReady creates pods consecutively when scaling up or down)
- `frontend_address` is set in the ruler config (make the ruler read from the queriers, not directly from the ingesters. Otherwise, recording and alerting rules may not be evaluated correctly during migration)
- The replication factor and the number of zones are at least 3 and the replication factor is not larger than the number of zones

## Migration steps

**Important**: Always continue the next step only when all pods are in the ready state.

1. Before starting the migration, you should ensure that the querier uses all ingesters during the migration. This means that shuffle sharding should be disabled and sharding by all labels should be enabled.
   It is sufficient to set these settings on the querier using `querier.extraArgs`. Set `distributor.sharding-strategy` to `default` and `distributor.shard-by-all-labels` to `"true"` there.
   Warning: This may increase resource usage of the queriers.

1. Set `ingester.zoneAwareReplication.enabled=true`, `ingester.zoneAwareReplication.migration.enabled=true`, `ingester.zoneAwareReplication.zones` to the desired zones but with `replicas=0`. Set `rollout_operator.enabled=true`. Upgrade the chart.
   ```yaml
   ingester:
     zoneAwareReplication:
       enabled: true
       migration:
         enabled: true
       zones:
       - name: zone-a
         replicas: 0
         nodeSelector:
           topology.kubernetes.io/zone: zone-a
       - name: zone-b
         replicas: 0
         nodeSelector:
           topology.kubernetes.io/zone: zone-b
       - name: zone-c
         replicas: 0
         nodeSelector:
           topology.kubernetes.io/zone: zone-c
   ```
   The stateful sets will be scaled up in the next steps and not created at once to ensure that at most one ingester is unavailable at a time.

1. In `ingester.zoneAwareReplication.zones`, set `replicas` to the desired replicas for **the first** zone, the install the Helm chart. 

1. Repeat the process for the other zones.

1. Enable zone-awareness on the write path by setting `ingester.zoneAwareReplication.migration.writePath=true` and install the Helm chart. This makes the distributors ship data to the new ingesters while the queriers still use all ingesters. Wait for `querier.query_store_after` so that the data that is still on the old ingesters can be queried from the object storage. If `query_store_after` is unset, wait at least `3 x bucket_store.sync_interval` (default 3x15m).
   This also disables the distributors from writing to the old ingesters.

1. Enable zone-awareness on the read path by setting `ingester.zoneAwareReplication.migration.readPath=true` and install the Helm chart. This makes the queriers use the new ingesters.
   This also disables the queriers from reading from the old ingesters.

1. Set `ingester.replicas` to 0. This will scale down the stateful set, one replica at a time, so that the ring remains healthy.

1. Remove all values below `ingester.zoneAwareReplication.migration`. This will delete the old stateful set.

1. If you have set any querier arguments in the first step, wait `-querier.shuffle-sharding-ingesters-lookback-period` before removing `querier.extraArgs`.

## Faster rollouts

With zone-awareness enabled, it is possible to roll all ingesters in a zone simultaneously.
If you want to benefit from these faster rollouts, set `ingester.zoneAwareReplication.maxUnavailable` to the number of replicas per zone and set `ingester.statefulSet.podManagementPolicy` to "Parallel". This will require recreating the stateful sets. Use `kubectl delete sts <...> --cascade=orphan` to delete only the stateful set, not the pods.
