---
layout: page
title: Migrate to zone-aware ingesters
parent: Guides
has_children: false
has_toc: false
---

This migration guide shows how to migrate to zone-aware ingesters without downtime or data loss.
The general process is the following: New stateful sets are created, the write traffic is routed to them, the read traffic is routed to them, the old stateful set is disabled.
The chart makes use of the [rollout-operator](https://github.com/grafana/rollout-operator) to coordinate rollouts of the stateful sets. This will automatically set the update strategy to `OnDelete`.

Make sure to set the following settings before starting the migration:
- Ingesters are deployed as a stateful set (deployment is currently not supported)
- Autoscaling is disabled (autoscaling is not supported for zone-aware ingesters)
- `podManagementPolicy` is "OrderedReady" (default), not "Parallel" (OrderedReady creates pods consecutively when scaling up or down)
- `frontend_address` is set in the ruler config (make the ruler read from the queriers, not directly from the ingesters. Otherwise, recording and alerting rules may not be evaluated correctly during migration)

Always continue the next step only when all pods are back to "ready".

1. Set `ingester.zoneAwareReplication.enabled=true`, `ingester.zoneAwareReplication.migration.enabled=true`, `ingester.zoneAwareReplication.zones` to the desired zones but with `replicas=0`. Set `rollout_operator.enabled=true`. Upgrade the chart.

1. In `ingester.zoneAwareReplication.zones`, set `replicas` to the desired replicas for **the first** zone, the install the Helm chart. Scaling up instead of creating directly the desired replicas is required to ensure that the replicas are created consecutively.

1. Repeat the process for the other zones.

1. If you have shuffle-sharding enabled, turn it off for querier by setting `querier.extraArgs` to `-distributor.sharding-strategy=default`. This is required because otherwise, the new ingester instances will not be considered by the queriers. Warning: This may increase resource usage.

1. Enable zone-awareness on the write path by setting `ingester.zoneAwareReplication.migration.writePath=true` and install the Helm chart. This makes the distributors ship data to the new ingesters while the queriers still use all ingesters. Wait for `querier.query_store_after` so that all data that would be fetched by the queriers is on the new ingesters.
   This also disables the distributors from writing to the old ingesters.

1. Enable zone-awareness on the read path by setting `ingester.zoneAwareReplication.migration.readPath=true` and install the Helm chart. This makes the queriers use the new ingesters.
   This also disables the queriers from reading from the old ingesters.

1. Set `ingester.replicas` to 0. This will scale down the stateful set, one replica at a time, so that the ring remains healthy.

1. Remove all values below `ingester.zoneAwareReplication.migration`. This will delete the old stateful set.

1. If you have previously disabled shuffle-sharding, wait `-querier.shuffle-sharding-ingesters-lookback-period` before removing `querier.extraArgs`.

If you want to benefit from faster rollouts, set `ingester.zoneAwareReplication.maxUnavailable` to the number of replicas per zone and set `podManagementPolicy` to "Parallel". This will require recreating the stateful sets (use `kubectl delete sts <...> --cascade=orphan` to keep the pods).
