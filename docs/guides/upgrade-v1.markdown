---
layout: page
title: Upgrading to chart version v1.0.0
parent: Guides
has_children: false
has_toc: false
---
# Upgrading to chart version v1.0.0
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# Upgrading to chart version v1.0.0

cortex-helm-chart v1.0.0 introduced a number of breaking changes in an attempt to provide better defaults for new users. Care should be taken when upgrading so that the new defaults are not inherited unexpectedly. Many of the new defaults are safe and simple to apply with an upgrade, but some require special procedures to migrate to, and some may not match your desired configuration.

This guide covers a few topics, but is not exhaustive. Please review the [release notes](https://github.com/cortexproject/cortex-helm-chart/releases/tag/v1.0.0) and [diff](https://github.com/cortexproject/cortex-helm-chart/compare/v0.6.0...v1.0.0) before upgrading to ensure you haven't missed anything important to your installation. You may want to use a tool like [helm-diff](https://github.com/databus23/helm-diff) to see what changes will be applied.

## Migrating to Memberlist

The default kvstore changed from `consul` to `memberlist`. Migrating from one kvstore to another requires either downtime or a multi-stage process.

### Downtime

If you are okay with downtime, the simplest way to migrate kvstores is to scale down all cortex components, then `helm upgrade --reset-values` to cortex-helm-chart v1.x.x to apply the new default kvstore, `memberlist`. Keep in mind this will apply all the new defaults, so ensure any values you would like to preserve that are unrelated to the kvstore are overridden with `-f` and your custom values file or `--set`.

### Multi KV

Cortex provides a configuration called Multi KV to migrate from one kvstore to another without downtime. Please read the doc on Multi KV before continuing this guide: https://cortexmetrics.io/docs/configuration/arguments/#multi-kv

Assuming you have an existing installation of cortex-helm-chart v0.6.0, here is an example of how to convert it to `memberlist`.
#### Stage 1 - mirror to both kvstores

_Be sure to augment this command with any other options you used for the initial installation._
```
helm upgrade cortex cortex-helm/cortex --version 0.6.0 -f kvstore-mirror.yaml
```

kvstore-mirror.yaml:
```yaml
config:
  alertmanager:
    sharding_ring:
      kvstore: &kvstore
        store: multi
        multi:
          primary: consul
          secondary: memberlist
          mirror_enabled: true
  compactor:
    sharding_ring:
      kvstore: *kvstore
  distributor:
    ring:
      kvstore: *kvstore
  ingester:
    lifecycler:
      ring:
        kvstore: *kvstore
  store_gateway:
    sharding_ring:
      kvstore: *kvstore
```

#### Stage 2 - use runtime config to make memberlist the primary

_Be sure to augment this command with any other options you used for the initial installation._
```
helm upgrade cortex cortex-helm/cortex --version 0.6.0 -f kvstore-mirror.yaml -f kvstore-runtime.yaml
```

kvstore-runtime.yaml:
```yaml
runtimeconfigmap:
  runtime_config:
    multi_kv_config:
      mirror_enabled: false
      primary: memberlist
```

#### Stage 3 - disable consul

_Be sure to augment this command with any other options you used for the initial installation._
```
helm upgrade cortex cortex-helm/cortex --version 0.6.0 -f kvstore-memberlist.yaml
```

kvstore-memberlist.yaml:
```yaml
config:
  alertmanager:
    sharding_ring:
      kvstore: &kvstore
        store: memberlist
  compactor:
    sharding_ring:
      kvstore: *kvstore
  distributor:
    ring:
      kvstore: *kvstore
  ingester:
    lifecycler:
      ring:
        kvstore: *kvstore
  store_gateway:
    sharding_ring:
      kvstore: *kvstore
```

## Migrate from chucks to block storage

https://cortexmetrics.io/docs/blocks-storage/migrate-cortex-cluster-from-chunks-to-blocks/
