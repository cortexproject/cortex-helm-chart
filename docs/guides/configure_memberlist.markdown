---
layout: page
title: Configure memberlist
parent: Guides
has_children: false
has_toc: false
---
# Configure memberlist
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# Setup

The cortex-helm-chart recommends using memberlist as the kvstore (not available yet for the ha-tracker kvstore). Cortex components deployed with the cortex-helm-chart will automatically join the gossip ring. More Information on why memberlist might be a good idea can be found [here](https://grafana.com/blog/2020/03/25/how-were-using-gossip-to-improve-cortex-and-loki-availability/)

For example:

```yaml
[...]
kvstore:
    store: "memberlist"
```
