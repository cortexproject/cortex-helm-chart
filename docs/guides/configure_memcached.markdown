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

If you want to use [memcached](https://memcached.org/) as a caching store, you first have to deploy it separately (e.g. via separate helm chart). The existing deployments can be referenced in the `values.yaml` so that they are used as caching stores.

Here's how to configure the memcached's via the values:

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
