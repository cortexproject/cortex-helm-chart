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

Correctly configuring memcached for your needs is a very delicate  task. But courtesy of [@thobianchi](https://github.com/thobianchi) this might be a good start.

{% raw %}
```yaml
index_cache:
  backend: memcached
  memcached:
    addresses: 'dns+{{ include "cortex.fullname" $ }}-memcached-blocks-index:11211'
    timeout: 300ms
    max_idle_connections: 750
    max_async_concurrency: 100
    max_async_buffer_size: 10000000
    max_get_multi_concurrency: 750
    max_get_multi_batch_size: 1000
    max_item_size: 16777216
chunks_cache:
  backend: memcached
  memcached:
    addresses: 'dns+{{ include "cortex.fullname" $ }}-memcached-blocks:11211'
    timeout: 300ms
    max_idle_connections: 750
    max_async_concurrency: 100
    max_async_buffer_size: 10000000
    max_get_multi_concurrency: 750
    max_get_multi_batch_size: 1000
    max_item_size: 33554432
metadata_cache:
  backend: memcached
  memcached:
    addresses: 'dns+{{ include "cortex.fullname" $ }}-blocks-metadata:11211'
    timeout: 300ms
    max_idle_connections: 750
    max_async_concurrency: 100
    max_async_buffer_size: 10000000
    max_get_multi_concurrency: 750
    max_get_multi_batch_size: 1000
    max_item_size: 16777216
```
{% endraw %}
