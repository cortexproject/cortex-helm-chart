---
layout: page
title: Memberlist
parent: Guides
has_children: true
has_toc: false
nav_order: 2
---
# Setup

The cortex-helm-chart recommends using memberlist as the kvstore (not available yet for the ha-tracker kvstore). Cortex components deployed with the cortex-helm-chart will automatically join the gossip ring. More Information on why memberlist might be a good idea can be found [here](https://grafana.com/blog/2020/03/25/how-were-using-gossip-to-improve-cortex-and-loki-availability/)

For example:

```yaml
[...]
kvstore:
    store: "memberlist"
```
