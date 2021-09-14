---
layout: page
title: Configure rules via sidecar
parent: Guides
has_children: true
has_toc: false
nav_order: 4
---
# Rules and AlertManager configuration
Cortex can be configured to use a sidecar container in the Ruler and AlertManager to dynamically discover rules and AlertManager config/templates that are declared as ConfigMaps to allow easy and extensible configuration that avoids having to store state in the Cortex system itself (via config service, etc).
Put ConfigMaps into the specified namespace, and they are automatically detected and added as files to the Ruler and/or AlertManager containers, both of which are polling for changes on the filesystem and will make the new configurations go live dynamically.
This feature is disabled by default. Here is a simple example:

```yaml
ruler:
  sidecar:
    enabled: true
    searchNamespace: cortex-rules

alertmanager:
  sidecar:
    enabled: true
    searchNamespace: cortex-alertmanager
```
And here are the related configuration values in AlertManager and Ruler:
```yaml
config:
  alertmanager:
    data_dir: /data/
    storage:
      type : local
      local:
        path: /data
  ruler:
    rule_path: /data/rules
    storage:
      type : local
      local:
        directory: /tmp/rules
```
In AlertManager, the data_dir and local storage directory should be the same.
In the Ruler, there needs to be two separate volumes. One is read-only and serves as the location shared with the sidecar that contains all of the rules that were derived from configmaps (/tmp/rules). The other is read-write and used by the Ruler itself for its own management of rules, etc (/data).
Example ConfigMap containing a rule:
```yaml
kind: ConfigMap
metadata:
  annotations:
    k8s-sidecar-target-directory: /tmp/rules/fake
  labels:
    # Label cortex_rules must exist unless overridden by ruler.sidecar.label
    cortex_rules: "1"
  name: rules-cortex-9f99md47tc
  namespace: cortex-rules
apiVersion: v1
data:
  fake.yaml: |-
    groups:
      - name: fake-system-metrics
        rules:
          - alert: HighCPUusage
            expr: avg(100 - rate(node_cpu_seconds_total{instance=~"qag1ge1l.+",mode="idle"}[5m]) * 100) by (instance) > 100
            for: 3m
            labels:
              severity: warning
            annotations:
              description: Metrics from {{ $labels.job }} on {{ $labels.instance }} show CPU > 90% for 3m.
              title: Node {{ $labels.instance }} has high CPU usage

```
Example ConfigMap containing an alertmanager-config:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  annotations:
    k8s-sidecar-target-directory: /data/fake
  labels:
    cortex_alertmanager: "1"
  name: alertmanager-example-config
data:
  fake.yaml: |-
    global:
      resolve_timeout: 5m
      http_config: {}
      smtp_hello: localhost
      smtp_require_tls: true
    route:
      receiver: team-X-mails
      group_by:
      - alertname
      routes:
      - receiver: "null"
        match:
          alertname: Watchdog
      group_wait: 30s
      group_interval: 5m
      repeat_interval: 12h
    receivers:
    - name: 'team-X-mails'
      email_configs:
      - to: 'team-X+alerts@example.org'
```