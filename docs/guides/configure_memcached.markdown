---
layout: page
title: Configure memcached
parent: Guides
has_children: false
has_toc: false
---
# Configuring memcached as the caching store
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# Configuring memcached as the caching store

If you want to use [memcached](https://memcached.org/) as a caching store, you first have to deploy it separately (e.g. via a dedicated helm chart). The existing deployments can be referenced by two approaches.

## Referencing memcached stores via values

Here's how to configure preexisting memcached deployment with their dedicated `memcached-*` sections in the chart values:

{% raw %}
```yaml
memcached-frontend:
  # reference pre-existing service here
  serviceName: cortex-memcached-frontend
  containerPort: 11211

memcached-blocks-index:
  serviceName: cortex-memcached-blocks-index
  containerPort: 11211

memcached-blocks:
  serviceName: cortex-memcached-blocks
  containerPort: 11211

memcached-blocks-metadata:
  serviceName: cortex-memcached-blocks-metadata
  containerPort: 11211
```
{% endraw %}

## Referencing via `extraArgs`

You can also omit the `memcached-*` sections entirely and use the `extraArgs` of each cortex component to reference an existing memcached deployment.

Here's an (incomplete) example:

{% raw %}
```yaml
query_frontend:
  extraArgs:
    frontend.memcached.addresses: dns+memcached-frontend.memcached.svc.cluster.local:11211
compactor:
  extraArgs:
    blocks-storage.bucket-store.index-cache.backend: memcached
    blocks-storage.bucket-store.index-cache.memcached.addresses: dns+memcached-blocks-index.memcached.svc.cluster.local:11211
ingester:
  extraArgs:
    blocks-storage.bucket-store.metadata-cache.backend: memcached
    blocks-storage.bucket-store.metadata-cache.memcached.addresses: dns+memcached-blocks-metadata.memcached.svc.cluster.local:11211
```
{% endraw %}
