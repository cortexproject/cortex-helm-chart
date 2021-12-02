---
layout: page
title: Configure with configmap
parent: Guides
has_children: true
has_toc: false
---
# Configuring using configmap

By default, cortex configuration is managed using a `Secret`. To use a `ConfigMap` instead, set `useConfigMap`:

{% raw %}
```yaml
useConfigMap: true
```
{% endraw %}

Note: if `useConfigMap` is enabled, sensitive values should be stored in separate secrets, then referenced in the config [using environment variables](https://cortexmetrics.io/docs/configuration/configuration-file/#use-environment-variables-in-the-configuration). Use `extraVolumes`, `extraVolumeMounts`, `extraEnvs`, and `extraArgs` to add environment variables from secrets.
