---
layout: page
title: Getting started with block storage
parent: Guides
has_children: true
has_toc: false
nav_order: 1
---
# Getting Started

A quick example configuration on how to get started with block storage can be found here

```yaml
# This file provides helm values to configure Cortex for blocks storage on AWS S3.
# Be sure to edit region, endpoint, and bucket_name for your environment.
config:
  alertmanager_storage:
    s3:
      bucket_name: # your bucket name
      region: us-east-1
      endpoint: s3.us-east-1.amazonaws.com
  storage:
    engine: blocks
  blocks_storage:
    backend: s3
    s3:
      bucket_name: # your bucket name
      region: us-east-1
      # -- The S3 bucket endpoint. It could be an AWS S3 endpoint listed at
      # https://docs.aws.amazon.com/general/latest/gr/s3.html or the address of an
      # S3-compatible service in hostname:port format.
      endpoint: s3.us-east-1.amazonaws.com
    bucket_store:
      sync_dir: "/data"
    tsdb:
      dir: "/data"
  querier:
    # -- Comma separated list of store-gateway addresses in DNS Service Discovery
    # format. This option should be set when using the blocks storage and the
    # store-gateway sharding is disabled (when enabled, the store-gateway instances
    # form a ring and addresses are picked from the ring).
    store_gateway_addresses: dns+cortex-store-gateway-headless.cortex.svc:9095
  ruler_storage:
    s3:
      bucket_name: # your bucket name
      region: us-east-1
      endpoint: s3.us-east-1.amazonaws.com
```
