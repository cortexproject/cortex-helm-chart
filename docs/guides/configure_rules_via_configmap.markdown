---
layout: page
title: Configure rules via configmap
parent: Guides
has_children: true
has_toc: false
nav_order: 3
---
# Configure rules via configmap

In your cortex-helm-chart you can now specify a static configuration of ruler rules. 

```yaml
ruler:
  directories:
    tenant_foo:
      rules1.txt: |
        groups:
          - name: should_fire
            rules:
              - alert: HighPercentageError
                expr: |
                  sum(rate({app="foo", env="production"} |= "error" [5m])) by (job)
                    /
                  sum(rate({app="foo", env="production"}[5m])) by (job)
                    > 0.05
                for: 10m
                labels:
                  severity: warning
                annotations:
                  summary: High error rate
```