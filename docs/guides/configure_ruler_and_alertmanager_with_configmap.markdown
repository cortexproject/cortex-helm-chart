---
layout: page
title: Configure Ruler and Alertmanager with configmap
parent: Guides
has_children: false
has_toc: false
---
# Configure Ruler and Alertmanager with configmap
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# Preface

Cortex's Ruler and Alertmanager can be setup to use ConfigMaps to provide themselves with a configuration that can be dynamically updated.
We simply put ConfigMaps into the same namespace where cortex is running, and they are automatically detected and mounted as files to the Ruler and/or AlertManager containers.
The containers are also constantly polling for changes to the ConfigMaps. If any changes are found, the configuration file on the container will be updated.

It should be noted that this guide is assuming that multi-tenancy is enabled :
```yaml
auth_enabled: true
```
# Setup

In order to get this working, we must do a couple things.

## Create Ruler ConfigMap

To provide the Ruler with the *rules* to alert on, we must create a ConfigMap with the desired ruleset. How you maintain and deploy the ConfigMap is completely in your control, the only requirement is that the ConfigMap be on the same namespace as the Ruler.

**IMPORTANT** things to note:

- This ruleset is ONLY for tenantfoo (We will explicitly map it to tenantfoo later).
- The section under `tenantfoo.yaml` is validated and interpreted exactly as a [Prometheus alerting rules configuration](https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/) would be. How you configure this is completely up to you.
- [Prometheus recording rules](https://prometheus.io/docs/prometheus/latest/configuration/recording_rules/) are also configured here in the same way as alerting rules.

```yaml
kind: ConfigMap
metadata:
  name: tenantfoo-ruler-config
  namespace: cortex
apiVersion: v1
data:
  tenantfoo.yaml: |-
    groups:
      - name: <group name>
        rules:
          - alert: <alert name>
            expr: <promql expression>
            for: <duration>
            labels:
              severity: <severity>
            annotations:
              description: <description>
          <remainder of alerts...>
```

## Create Alertmanager ConfigMap

To provide the Alertmanager with the information needed to *route* notifications to stakeholders, we must create a ConfigMap with the desired routing rules. How you maintain and deploy the ConfigMap is completely in your control, the only requirement is that the ConfigMap be on the same namespace as the Alertmanager.

**IMPORTANT** things to note:

- These routing rules are ONLY for tenantfoo. The Alertmanager takes the key under `data` (excluding `.yaml`) and uses it as the tenant name for that specific config.
- The section under `tenantfoo.yaml` is validated and interpreted exactly as a [Alertmanager configuration](hhttps://prometheus.io/docs/alerting/latest/configuration/#configuration-file) would be. How you configure this is completely up to you.

```yaml
kind: ConfigMap
metadata:
  name: tenantfoo-alertmanager-config
  namespace: cortex
apiVersion: v1
data:
  tenantfoo.yaml: |
    global:
      resolve_timeout: <duration>
      http_config: {}
      smtp_from: ExamplePerson <exampleperson@example.com>
      smtp_hello: example.com
      smtp_smarthost: example-smtp.example.com
    route:
      receiver: team-X-mails
      group_by: ['alertname']
      group_wait: <duration>
      group_interval: <duration>
      repeat_interval: <duration>
    receivers:
    - name: 'team-X-mails'
      email_configs:
      - to: 'example@example.com'
```

## Helm Chart Configuration

Now that the ConfigMaps are created, we can tinker the helm chart to achieve our goal.

### Configuration for Ruler and Alertmanager Config
Add this to the `values.yaml` under the `config` section as shown.

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
      # where your mounted configmap data will be temporary stored
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

### Configuration for Ruler and Alertmanager
Add this to the `values.yaml`.
Note that when we mount `tenantfoo-ruler-config`, we mount it under a folder which should be named after the tenant it corresponds to. In this situation, since we want `tenantfoo-ruler-config` to be the alerting rules for `tenantfoo`, we mount it under `/data/rules/tenantfoo`.
Also note that for `tenantfoo-alertmanager-config`, we similarily mount it under a folder specific to that tenant. Although it will not use the folder name as the tenant name (it instead uses the key name under `data` in the ConfigMap), it simplifies things if you do so.

```yaml
ruler:
  extraVolumes:
    - configMap:
        defaultMode: 420
        name: tenantfoo-ruler-config
      name: tenantfoo-ruler-config
  extraVolumeMounts:
    - name: tenantfoo-ruler-config
      mountPath: /data/rules/tenantfoo
alertmanager:
  extraVolumes:
    - configMap:
        defaultMode: 420
        name: tenantfoo-alertmanager-config
      name: tenantfoo-alertmanager-config
  extraVolumeMounts:
    - name: tenantfoo-alertmanager-config
      mountPath: /data/tenantfoo
```

# Result

You can now install the helm chart.

You may use the section below to verify the configuration went according to plan.

### Verify Alertmanager

1. Port-forward the alertmanager pod
2. Run `curl -X GET -H "X-Scope-OrgID: <name of tenant>" localhost:8080/api/v1/alerts`
3. Verify the correct configuration shows up

### Verify Ruler

1. Port-forward the ruler pod
2. Run `curl -X GET -H "X-Scope-OrgID: <name of tenant>" localhost:8080/api/v1/rules`
3. Verify the correct configuration shows up

# Moving forward

You can also follow this guide if you don't have multi-tenancy enabled. However, in this case, you will not get alerting/routing rules specific to each tenant.

Defining fine-grained alerting/routing rules per tenant is when you really get to eat the fruits of your labour when deploying multi-tenant alertmanager/ruler. For example, lets say you currently only have routing rules for tenantfoo. If you wanted to add specific routing rules for another tenant, tenantB, you will do the following:

1. Create another set of ConfigMaps for the new tenants, being sure to adhere to the naming policies stated in this guide

2. Add entries under `extraVolumes` and `extraVolumeMounts` for the Ruler and Alertmanager. All while being sure to adhere to the naming policies stated in this guide

3. [Verify the new tenant is configured](#result)