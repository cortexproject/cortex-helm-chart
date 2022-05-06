---
layout: page
title: Configure rules via sidecar
parent: Guides
has_children: false
has_toc: false
---
# Configure rules via sidecar
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# Rules and AlertManager configuration
Cortex can be configured to use a sidecar container in the Ruler and AlertManager to dynamically discover rules and AlertManager config/templates that are declared as ConfigMaps to allow easy and extensible configuration that avoids having to store state in the Cortex system itself (via config service, etc).
Put ConfigMaps into the specified namespace, and they are automatically detected and added as files to the Ruler and/or AlertManager containers, both of which are polling for changes on the filesystem and will make the new configurations go live dynamically.
This feature is disabled by default. Here is a simple example:

Please note that this is only supported with the **local** backend. Otherwise cortex will overwrite what the operator[^1] puts in the folder with what is in s3/gcs/azure/swift. Cortex does not 2-way sync the files. Also please be aware of the following:
- local alertmanager config storage is read-only (cortex API is severely limited to read-only requests)
- local alertmanager storage does not support state persistency (however your configurations are saved in etcd via kubernetes)
- local ruler storage does not support RuleGroups
- local ruler storage does not support namespaces

[^1]: Also referenced here as the sidecar. Effectively the sidecar is an image which is an kubernetes operator.

## Helm values config

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
  ruler:
    enable_api: true
    # already set-up temporary emptyDir volume. Cortex will parse rules from /data/rules
    # and copy them here for prometheus rule evaluation
    rule_path: /rules

  ruler_storage:
    backend: "local"
    local:
      # temporary volume of type emptyDir
      directory: /data/rules

  alertmanager:
    enable_api: true
    # temporary volume if not using stateful alertmanagers
    data_dir: /data

  alertmanager_storage:
    backend: "local"
    local:
      # temporary volume if not using stateful alertmanagers
      path: /data
```

## Creating alerting/recording rules and alertmanager configs

In AlertManager, the `data_dir` and local storage directory should be the same.
In the Ruler, there need to be two separate volumes. One is used by Cortex for evaluating alerting and recording rules (/rules) and should be temporary. The other is used by the user (YOU) to temporarily store your alerting and recording rules (/data/rules).
Example ConfigMap containing an alerting rule:

{% raw %}
```yaml
kind: ConfigMap
metadata:
  annotations:
    # Override destination folder so we can save the config under /data/rules/<TENANT>/tenantfoo.yaml
    k8s-sidecar-target-directory: /data/rules/tenantfoo
  labels:
    # Label cortex_rules must exist unless overridden by ruler.sidecar.label
    cortex_rules: "1"
  name: rules-cortex-9f99md47tc
  namespace: cortex-rules
apiVersion: v1
data:
  tenantfoo.yaml: |-
    groups:
      - name: tenantfoo-system-metrics
        rules:
          - alert: HighCPUUsage
            expr: avg(100 - rate(node_cpu_seconds_total{instance=~"qag1ge1l.+",mode="idle"}[5m]) * 100) by (instance) > 100
            for: 3m
            labels:
              severity: warning
            annotations:
              description: Metrics from {{ $labels.job }} on {{ $labels.instance }} show CPU > 90% for 3m.
              title: Node {{ $labels.instance }} has high CPU usage

```
{% endraw %}

Example ConfigMap containing an alertmanager-config:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  annotations:
    k8s-sidecar-target-directory: /data/tenantfoo
  labels:
    cortex_alertmanager: "1"
  name: alertmanager-example-config
data:
  tenantfoo.yaml: |-
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