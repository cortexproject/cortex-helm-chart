# Introduction

Repository for the [Cortex](https://github.com/cortexproject/cortex) Helm chart.
Follow the instructions below to install/upgrade Cortex in your Kubernetes cluster
after cloning this repository.

## Dependencies

### Key-Value store

Cortex requires an externally provided key-value store, such as [etcd](https://etcd.io/) or [Consul](https://www.consul.io/).

Both services can be installed alongside Cortex, for example using helm charts available [here](https://github.com/bitnami/charts/tree/master/bitnami/etcd) and [here](https://github.com/helm/charts/tree/master/stable/consul).

### Storage

Cortex requires a storage backend to store metrics and indexes.
See [cortex documentation](https://cortexmetrics.io/docs/) for details on storage types and documentation

## Installation

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```bash
  helm repo add cortex-helm https://cortexproject.github.io/cortex-helm-chart
```

Cortex can now be installed with the following command:

```bash
  helm install cortex --namespace cortex cortex-helm/cortex
```

If you have custom options or values you want to override:

```bash
  helm install cortex --namespace cortex -f my-cortex-values.yaml cortex-helm/cortex
```

Specific versions of the chart can be installed using the `--version` option, with the default being the latest release.
What versions are available for installation can be listed with the following command:

```bash
  helm search repo cortex-helm
```

As part of this chart many different pods and services are installed which all
have varying resource requirements. Please make sure that you have sufficient
resources (CPU/memory) available in your cluster before installing Cortex Helm
chart.


## Upgrades

To upgrade Cortex use the following command:

```bash
  helm upgrade cortex -f my-cortex-values.yaml cortex-helm/cortex
```

Source code can be found [here](https://cortexmetrics.io/)

## Chart Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://kubernetes-charts.storage.googleapis.com/ | memcached | 3.2.3 |
| https://kubernetes-charts.storage.googleapis.com/ | memcached | 3.2.3 |
| https://kubernetes-charts.storage.googleapis.com/ | memcached | 3.2.3 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.affinity | object | `{}` |  |
| alertmanager.annotations | object | `{}` |  |
| alertmanager.env | list | `[]` |  |
| alertmanager.extraArgs | object | `{}` |  |
| alertmanager.extraContainers | list | `[]` |  |
| alertmanager.extraPorts | list | `[]` |  |
| alertmanager.extraVolumeMounts | list | `[]` |  |
| alertmanager.extraVolumes | list | `[]` |  |
| alertmanager.initContainers | list | `[]` |  |
| alertmanager.livenessProbe.httpGet.path | string | `"/ready"` |  |
| alertmanager.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| alertmanager.livenessProbe.initialDelaySeconds | int | `45` |  |
| alertmanager.nodeSelector | object | `{}` |  |
| alertmanager.persistence.subPath | string | `nil` |  |
| alertmanager.persistentVolume.accessModes[0] | string | `"ReadWriteOnce"` |  |
| alertmanager.persistentVolume.annotations | object | `{}` |  |
| alertmanager.persistentVolume.enabled | bool | `true` |  |
| alertmanager.persistentVolume.size | string | `"2Gi"` |  |
| alertmanager.persistentVolume.subPath | string | `""` |  |
| alertmanager.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| alertmanager.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| alertmanager.podDisruptionBudget | object | `{}` |  |
| alertmanager.podLabels | object | `{}` |  |
| alertmanager.readinessProbe.httpGet.path | string | `"/ready"` |  |
| alertmanager.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| alertmanager.readinessProbe.initialDelaySeconds | int | `45` |  |
| alertmanager.replicas | int | `1` |  |
| alertmanager.resources.limits.cpu | string | `"200m"` |  |
| alertmanager.resources.limits.memory | string | `"256Mi"` |  |
| alertmanager.resources.requests.cpu | string | `"10m"` |  |
| alertmanager.resources.requests.memory | string | `"32Mi"` |  |
| alertmanager.securityContext | object | `{}` |  |
| alertmanager.service.annotations | object | `{}` |  |
| alertmanager.service.labels | object | `{}` |  |
| alertmanager.statefulSet.enabled | bool | `false` |  |
| alertmanager.statefulStrategy.type | string | `"RollingUpdate"` |  |
| alertmanager.strategy.rollingUpdate.maxSurge | int | `0` |  |
| alertmanager.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| alertmanager.strategy.type | string | `"RollingUpdate"` |  |
| alertmanager.terminationGracePeriodSeconds | int | `60` |  |
| alertmanager.tolerations | list | `[]` |  |
| clusterDomain | string | `"cluster.local"` |  |
| compactor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"target"` |  |
| compactor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| compactor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"compactor"` |  |
| compactor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| compactor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| compactor.annotations | object | `{}` |  |
| compactor.enabled | bool | `true` |  |
| compactor.env | list | `[]` |  |
| compactor.extraArgs | object | `{}` |  |
| compactor.extraContainers | list | `[]` |  |
| compactor.extraPorts | list | `[]` |  |
| compactor.extraVolumeMounts | list | `[]` |  |
| compactor.extraVolumes | list | `[]` |  |
| compactor.initContainers | list | `[]` |  |
| compactor.livenessProbe.failureThreshold | int | `20` |  |
| compactor.livenessProbe.httpGet.path | string | `"/ready"` |  |
| compactor.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| compactor.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| compactor.livenessProbe.initialDelaySeconds | int | `180` |  |
| compactor.livenessProbe.periodSeconds | int | `30` |  |
| compactor.livenessProbe.successThreshold | int | `1` |  |
| compactor.livenessProbe.timeoutSeconds | int | `1` |  |
| compactor.nodeSelector | object | `{}` |  |
| compactor.persistentVolume.accessModes[0] | string | `"ReadWriteOnce"` |  |
| compactor.persistentVolume.annotations | object | `{}` |  |
| compactor.persistentVolume.enabled | bool | `true` |  |
| compactor.persistentVolume.size | string | `"2Gi"` |  |
| compactor.persistentVolume.subPath | string | `""` |  |
| compactor.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| compactor.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| compactor.podDisruptionBudget | object | `{}` |  |
| compactor.podLabels | object | `{}` |  |
| compactor.readinessProbe.httpGet.path | string | `"/ready"` |  |
| compactor.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| compactor.readinessProbe.initialDelaySeconds | int | `60` |  |
| compactor.replicas | int | `1` |  |
| compactor.resources.limits.cpu | int | `1` |  |
| compactor.resources.limits.memory | string | `"1Gi"` |  |
| compactor.resources.requests.cpu | string | `"100m"` |  |
| compactor.resources.requests.memory | string | `"512Mi"` |  |
| compactor.securityContext | object | `{}` |  |
| compactor.service.annotations | object | `{}` |  |
| compactor.service.labels | object | `{}` |  |
| compactor.strategy.type | string | `"RollingUpdate"` |  |
| compactor.terminationGracePeriodSeconds | int | `240` |  |
| compactor.tolerations | list | `[]` |  |
| config.alertmanager.external_url | string | `"/api/prom/alertmanager"` |  |
| config.auth_enabled | bool | `false` |  |
| config.chunk_store.chunk_cache_config.memcached.expiration | string | `"1h"` |  |
| config.chunk_store.chunk_cache_config.memcached_client.timeout | string | `"1s"` |  |
| config.chunk_store.max_look_back_period | string | `"0s"` |  |
| config.distributor.pool.health_check_ingesters | bool | `true` |  |
| config.distributor.shard_by_all_labels | bool | `true` |  |
| config.frontend.compress_responses | bool | `true` |  |
| config.frontend.log_queries_longer_than | string | `"10s"` |  |
| config.ingester.lifecycler.final_sleep | string | `"0s"` |  |
| config.ingester.lifecycler.join_after | string | `"0s"` |  |
| config.ingester.lifecycler.num_tokens | int | `512` |  |
| config.ingester.lifecycler.ring.kvstore.consul.consistent_reads | bool | `true` |  |
| config.ingester.lifecycler.ring.kvstore.consul.host | string | `"consul:8500"` |  |
| config.ingester.lifecycler.ring.kvstore.consul.http_client_timeout | string | `"20s"` |  |
| config.ingester.lifecycler.ring.kvstore.prefix | string | `"collectors/"` |  |
| config.ingester.lifecycler.ring.kvstore.store | string | `"consul"` |  |
| config.ingester.lifecycler.ring.replication_factor | int | `1` |  |
| config.ingester.max_transfer_retries | int | `0` |  |
| config.ingester_client.grpc_client_config.max_recv_msg_size | int | `104857600` |  |
| config.ingester_client.grpc_client_config.max_send_msg_size | int | `104857600` |  |
| config.ingester_client.grpc_client_config.use_gzip_compression | bool | `true` |  |
| config.limits.enforce_metric_name | bool | `false` |  |
| config.limits.reject_old_samples | bool | `true` |  |
| config.limits.reject_old_samples_max_age | string | `"168h"` |  |
| config.querier.active_query_tracker_dir | string | `"/data/cortex/querier"` |  |
| config.querier.query_ingesters_within | string | `"12h"` |  |
| config.query_range.align_queries_with_step | bool | `true` |  |
| config.query_range.cache_results | bool | `true` |  |
| config.query_range.results_cache.cache.memcached.expiration | string | `"1h"` |  |
| config.query_range.results_cache.cache.memcached_client.timeout | string | `"1s"` |  |
| config.query_range.split_queries_by_interval | string | `"24h"` |  |
| config.ruler.enable_alertmanager_discovery | bool | `false` |  |
| config.schema.configs[0].from | string | `"2019-07-29"` |  |
| config.schema.configs[0].index.period | string | `"168h"` |  |
| config.schema.configs[0].index.prefix | string | `"index_"` |  |
| config.schema.configs[0].object_store | string | `"cassandra"` |  |
| config.schema.configs[0].schema | string | `"v10"` |  |
| config.schema.configs[0].store | string | `"cassandra"` |  |
| config.server.grpc_listen_port | int | `9095` |  |
| config.server.grpc_server_max_concurrent_streams | int | `1000` |  |
| config.server.grpc_server_max_recv_msg_size | int | `104857600` |  |
| config.server.grpc_server_max_send_msg_size | int | `104857600` |  |
| config.server.http_listen_port | int | `8080` |  |
| config.storage.azure.account_key | string | `nil` |  |
| config.storage.azure.account_name | string | `nil` |  |
| config.storage.azure.container_name | string | `nil` |  |
| config.storage.cassandra.addresses | string | `nil` |  |
| config.storage.cassandra.auth | bool | `true` |  |
| config.storage.cassandra.keyspace | string | `"cortex"` |  |
| config.storage.cassandra.password | string | `nil` |  |
| config.storage.cassandra.username | string | `nil` |  |
| config.storage.engine | string | `"chunks"` |  |
| config.storage.index_queries_cache_config.memcached.expiration | string | `"1h"` |  |
| config.storage.index_queries_cache_config.memcached_client.timeout | string | `"1s"` |  |
| config.table_manager.retention_deletes_enabled | bool | `false` |  |
| config.table_manager.retention_period | string | `"0s"` |  |
| configs.affinity | object | `{}` |  |
| configs.annotations | object | `{}` |  |
| configs.env | list | `[]` |  |
| configs.extraArgs | object | `{}` |  |
| configs.extraContainers | list | `[]` |  |
| configs.extraPorts | list | `[]` |  |
| configs.extraVolumeMounts | list | `[]` |  |
| configs.extraVolumes | list | `[]` |  |
| configs.initContainers | list | `[]` |  |
| configs.livenessProbe.httpGet.path | string | `"/ready"` |  |
| configs.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| configs.livenessProbe.initialDelaySeconds | int | `45` |  |
| configs.nodeSelector | object | `{}` |  |
| configs.persistence.subPath | string | `nil` |  |
| configs.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| configs.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| configs.podDisruptionBudget | object | `{}` |  |
| configs.podLabels | object | `{}` |  |
| configs.readinessProbe.httpGet.path | string | `"/ready"` |  |
| configs.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| configs.readinessProbe.initialDelaySeconds | int | `45` |  |
| configs.replicas | int | `1` |  |
| configs.resources.limits.cpu | int | `1` |  |
| configs.resources.limits.memory | string | `"1Gi"` |  |
| configs.resources.requests.cpu | string | `"10m"` |  |
| configs.resources.requests.memory | string | `"32Mi"` |  |
| configs.securityContext | object | `{}` |  |
| configs.service.annotations | object | `{}` |  |
| configs.service.labels | object | `{}` |  |
| configs.strategy.rollingUpdate.maxSurge | int | `0` |  |
| configs.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| configs.strategy.type | string | `"RollingUpdate"` |  |
| configs.terminationGracePeriodSeconds | int | `180` |  |
| configs.tolerations | list | `[]` |  |
| configsdb_postgresql.auth.existing_secret.key | string | `nil` |  |
| configsdb_postgresql.auth.existing_secret.name | string | `nil` |  |
| configsdb_postgresql.auth.password | string | `nil` |  |
| configsdb_postgresql.enabled | bool | `false` |  |
| configsdb_postgresql.uri | string | `nil` |  |
| distributor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"target"` |  |
| distributor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| distributor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"distributor"` |  |
| distributor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| distributor.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| distributor.annotations | object | `{}` |  |
| distributor.env | list | `[]` |  |
| distributor.extraArgs | object | `{}` |  |
| distributor.extraContainers | list | `[]` |  |
| distributor.extraPorts | list | `[]` |  |
| distributor.extraVolumeMounts | list | `[]` |  |
| distributor.extraVolumes | list | `[]` |  |
| distributor.initContainers | list | `[]` |  |
| distributor.livenessProbe.httpGet.path | string | `"/ready"` |  |
| distributor.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| distributor.livenessProbe.initialDelaySeconds | int | `45` |  |
| distributor.nodeSelector | object | `{}` |  |
| distributor.persistence.subPath | string | `nil` |  |
| distributor.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| distributor.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| distributor.podDisruptionBudget | object | `{}` |  |
| distributor.podLabels | object | `{}` |  |
| distributor.readinessProbe.httpGet.path | string | `"/ready"` |  |
| distributor.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| distributor.readinessProbe.initialDelaySeconds | int | `45` |  |
| distributor.replicas | int | `2` |  |
| distributor.resources.limits.cpu | int | `1` |  |
| distributor.resources.limits.memory | string | `"1Gi"` |  |
| distributor.resources.requests.cpu | string | `"100m"` |  |
| distributor.resources.requests.memory | string | `"512Mi"` |  |
| distributor.securityContext | object | `{}` |  |
| distributor.service.annotations | object | `{}` |  |
| distributor.service.labels | object | `{}` |  |
| distributor.strategy.rollingUpdate.maxSurge | int | `0` |  |
| distributor.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| distributor.strategy.type | string | `"RollingUpdate"` |  |
| distributor.terminationGracePeriodSeconds | int | `60` |  |
| distributor.tolerations | list | `[]` |  |
| externalConfigSecretName | string | `"secret-with-config.yaml"` |  |
| externalConfigVersion | string | `"0"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"quay.io/cortexproject/cortex"` |  |
| image.tag | string | `"v1.1.0"` |  |
| ingester.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"target"` |  |
| ingester.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| ingester.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"ingester"` |  |
| ingester.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| ingester.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| ingester.annotations | object | `{}` |  |
| ingester.env | list | `[]` |  |
| ingester.extraArgs | object | `{}` |  |
| ingester.extraContainers | list | `[]` |  |
| ingester.extraPorts | list | `[]` |  |
| ingester.extraVolumeMounts | list | `[]` |  |
| ingester.extraVolumes | list | `[]` |  |
| ingester.initContainers | list | `[]` |  |
| ingester.livenessProbe.failureThreshold | int | `20` |  |
| ingester.livenessProbe.httpGet.path | string | `"/ready"` |  |
| ingester.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| ingester.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| ingester.livenessProbe.initialDelaySeconds | int | `180` |  |
| ingester.livenessProbe.periodSeconds | int | `30` |  |
| ingester.livenessProbe.successThreshold | int | `1` |  |
| ingester.livenessProbe.timeoutSeconds | int | `1` |  |
| ingester.nodeSelector | object | `{}` |  |
| ingester.persistence.subPath | string | `nil` |  |
| ingester.persistentVolume.accessModes[0] | string | `"ReadWriteOnce"` |  |
| ingester.persistentVolume.annotations | object | `{}` |  |
| ingester.persistentVolume.enabled | bool | `true` |  |
| ingester.persistentVolume.size | string | `"2Gi"` |  |
| ingester.persistentVolume.subPath | string | `""` |  |
| ingester.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| ingester.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| ingester.podDisruptionBudget | object | `{}` |  |
| ingester.podLabels | object | `{}` |  |
| ingester.readinessProbe.httpGet.path | string | `"/ready"` |  |
| ingester.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| ingester.readinessProbe.initialDelaySeconds | int | `60` |  |
| ingester.replicas | int | `3` |  |
| ingester.resources.limits.cpu | int | `1` |  |
| ingester.resources.limits.memory | string | `"1Gi"` |  |
| ingester.resources.requests.cpu | string | `"100m"` |  |
| ingester.resources.requests.memory | string | `"512Mi"` |  |
| ingester.securityContext | object | `{}` |  |
| ingester.service.annotations | object | `{}` |  |
| ingester.service.labels | object | `{}` |  |
| ingester.statefulSet.enabled | bool | `false` |  |
| ingester.statefulStrategy.type | string | `"RollingUpdate"` |  |
| ingester.strategy.rollingUpdate.maxSurge | int | `0` |  |
| ingester.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| ingester.strategy.type | string | `"RollingUpdate"` |  |
| ingester.terminationGracePeriodSeconds | int | `240` |  |
| ingester.tolerations | list | `[]` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0] | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| memcached-index-read.enabled | bool | `false` |  |
| memcached-index-read.memcached.extraArgs[0] | string | `"-I 32m"` |  |
| memcached-index-read.memcached.maxItemMemory | int | `3840` |  |
| memcached-index-read.memcached.threads | int | `32` |  |
| memcached-index-read.metrics.enabled | bool | `true` |  |
| memcached-index-read.replicaCount | int | `2` |  |
| memcached-index-read.resources.limits.cpu | int | `1` |  |
| memcached-index-read.resources.limits.memory | string | `"4Gi"` |  |
| memcached-index-read.resources.requests.cpu | string | `"10m"` |  |
| memcached-index-read.resources.requests.memory | string | `"1Gi"` |  |
| memcached-index-write.enabled | bool | `false` |  |
| memcached-index-write.memcached.extraArgs[0] | string | `"-I 32m"` |  |
| memcached-index-write.memcached.maxItemMemory | int | `3840` |  |
| memcached-index-write.memcached.threads | int | `32` |  |
| memcached-index-write.metrics.enabled | bool | `true` |  |
| memcached-index-write.replicaCount | int | `2` |  |
| memcached-index-write.resources.limits.cpu | int | `1` |  |
| memcached-index-write.resources.limits.memory | string | `"4Gi"` |  |
| memcached-index-write.resources.requests.cpu | string | `"10m"` |  |
| memcached-index-write.resources.requests.memory | string | `"1Gi"` |  |
| memcached.enabled | bool | `false` |  |
| memcached.memcached.extraArgs[0] | string | `"-I 32m"` |  |
| memcached.memcached.maxItemMemory | int | `3840` |  |
| memcached.memcached.threads | int | `32` |  |
| memcached.metrics.enabled | bool | `true` |  |
| memcached.pdbMinAvailable | int | `1` |  |
| memcached.replicaCount | int | `2` |  |
| memcached.resources.limits.cpu | int | `1` |  |
| memcached.resources.limits.memory | string | `"4Gi"` |  |
| memcached.resources.requests.cpu | string | `"10m"` |  |
| memcached.resources.requests.memory | string | `"1Gi"` |  |
| nginx.affinity | object | `{}` |  |
| nginx.annotations | object | `{}` |  |
| nginx.config.dnsResolver | string | `"kube-dns.kube-system.svc.cluster.local"` |  |
| nginx.enabled | bool | `true` |  |
| nginx.env | list | `[]` |  |
| nginx.extraArgs | object | `{}` |  |
| nginx.extraContainers | list | `[]` |  |
| nginx.extraPorts | list | `[]` |  |
| nginx.extraVolumeMounts | list | `[]` |  |
| nginx.extraVolumes | list | `[]` |  |
| nginx.http_listen_port | int | `80` |  |
| nginx.image.pullPolicy | string | `"IfNotPresent"` |  |
| nginx.image.repository | string | `"nginx"` |  |
| nginx.image.tag | float | `1.17` |  |
| nginx.initContainers | list | `[]` |  |
| nginx.livenessProbe.httpGet.path | string | `"/healthz"` |  |
| nginx.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| nginx.livenessProbe.initialDelaySeconds | int | `10` |  |
| nginx.nodeSelector | object | `{}` |  |
| nginx.persistence.subPath | string | `nil` |  |
| nginx.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| nginx.podAnnotations."prometheus.io/scrape" | string | `""` |  |
| nginx.podDisruptionBudget | object | `{}` |  |
| nginx.podLabels | object | `{}` |  |
| nginx.readinessProbe.httpGet.path | string | `"/healthz"` |  |
| nginx.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| nginx.readinessProbe.initialDelaySeconds | int | `10` |  |
| nginx.replicas | int | `2` |  |
| nginx.resources.limits.cpu | string | `"100m"` |  |
| nginx.resources.limits.memory | string | `"128Mi"` |  |
| nginx.resources.requests.cpu | string | `"10m"` |  |
| nginx.resources.requests.memory | string | `"16Mi"` |  |
| nginx.securityContext | object | `{}` |  |
| nginx.service.annotations | object | `{}` |  |
| nginx.service.labels | object | `{}` |  |
| nginx.strategy.rollingUpdate.maxSurge | int | `0` |  |
| nginx.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| nginx.strategy.type | string | `"RollingUpdate"` |  |
| nginx.terminationGracePeriodSeconds | int | `10` |  |
| nginx.tolerations | list | `[]` |  |
| querier.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"target"` |  |
| querier.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| querier.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"querier"` |  |
| querier.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| querier.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| querier.annotations | object | `{}` |  |
| querier.env | list | `[]` |  |
| querier.extraArgs | object | `{}` |  |
| querier.extraContainers | list | `[]` |  |
| querier.extraPorts | list | `[]` |  |
| querier.extraVolumeMounts | list | `[]` |  |
| querier.extraVolumes | list | `[]` |  |
| querier.initContainers | list | `[]` |  |
| querier.livenessProbe.httpGet.path | string | `"/ready"` |  |
| querier.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| querier.livenessProbe.initialDelaySeconds | int | `45` |  |
| querier.nodeSelector | object | `{}` |  |
| querier.persistence.subPath | string | `nil` |  |
| querier.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| querier.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| querier.podDisruptionBudget | object | `{}` |  |
| querier.podLabels | object | `{}` |  |
| querier.readinessProbe.httpGet.path | string | `"/ready"` |  |
| querier.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| querier.readinessProbe.initialDelaySeconds | int | `45` |  |
| querier.replicas | int | `2` |  |
| querier.resources.limits.cpu | int | `1` |  |
| querier.resources.limits.memory | string | `"1Gi"` |  |
| querier.resources.requests.cpu | string | `"50m"` |  |
| querier.resources.requests.memory | string | `"128Mi"` |  |
| querier.securityContext | object | `{}` |  |
| querier.service.annotations | object | `{}` |  |
| querier.service.labels | object | `{}` |  |
| querier.strategy.rollingUpdate.maxSurge | int | `0` |  |
| querier.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| querier.strategy.type | string | `"RollingUpdate"` |  |
| querier.terminationGracePeriodSeconds | int | `180` |  |
| querier.tolerations | list | `[]` |  |
| query_frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"target"` |  |
| query_frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| query_frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"query-frontend"` |  |
| query_frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| query_frontend.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| query_frontend.annotations | object | `{}` |  |
| query_frontend.env | list | `[]` |  |
| query_frontend.extraArgs | object | `{}` |  |
| query_frontend.extraContainers | list | `[]` |  |
| query_frontend.extraPorts | list | `[]` |  |
| query_frontend.extraVolumeMounts | list | `[]` |  |
| query_frontend.extraVolumes | list | `[]` |  |
| query_frontend.initContainers | list | `[]` |  |
| query_frontend.livenessProbe.httpGet.path | string | `"/ready"` |  |
| query_frontend.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| query_frontend.livenessProbe.initialDelaySeconds | int | `45` |  |
| query_frontend.nodeSelector | object | `{}` |  |
| query_frontend.persistence.subPath | string | `nil` |  |
| query_frontend.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| query_frontend.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| query_frontend.podDisruptionBudget | object | `{}` |  |
| query_frontend.podLabels | object | `{}` |  |
| query_frontend.readinessProbe.httpGet.path | string | `"/ready"` |  |
| query_frontend.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| query_frontend.readinessProbe.initialDelaySeconds | int | `45` |  |
| query_frontend.replicas | int | `2` |  |
| query_frontend.resources.limits.cpu | int | `1` |  |
| query_frontend.resources.limits.memory | string | `"256Mi"` |  |
| query_frontend.resources.requests.cpu | string | `"10m"` |  |
| query_frontend.resources.requests.memory | string | `"32Mi"` |  |
| query_frontend.securityContext | object | `{}` |  |
| query_frontend.service.annotations | object | `{}` |  |
| query_frontend.service.labels | object | `{}` |  |
| query_frontend.strategy.rollingUpdate.maxSurge | int | `0` |  |
| query_frontend.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| query_frontend.strategy.type | string | `"RollingUpdate"` |  |
| query_frontend.terminationGracePeriodSeconds | int | `180` |  |
| query_frontend.tolerations | list | `[]` |  |
| rbac.create | bool | `true` |  |
| rbac.pspEnabled | bool | `true` |  |
| ruler.affinity | object | `{}` |  |
| ruler.annotations | object | `{}` |  |
| ruler.env | list | `[]` |  |
| ruler.extraArgs | object | `{}` |  |
| ruler.extraContainers | list | `[]` |  |
| ruler.extraPorts | list | `[]` |  |
| ruler.extraVolumeMounts | list | `[]` |  |
| ruler.extraVolumes | list | `[]` |  |
| ruler.initContainers | list | `[]` |  |
| ruler.livenessProbe.httpGet.path | string | `"/ready"` |  |
| ruler.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| ruler.livenessProbe.initialDelaySeconds | int | `45` |  |
| ruler.nodeSelector | object | `{}` |  |
| ruler.persistence.subPath | string | `nil` |  |
| ruler.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| ruler.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| ruler.podDisruptionBudget | object | `{}` |  |
| ruler.podLabels | object | `{}` |  |
| ruler.readinessProbe.httpGet.path | string | `"/ready"` |  |
| ruler.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| ruler.readinessProbe.initialDelaySeconds | int | `45` |  |
| ruler.replicas | int | `1` |  |
| ruler.resources.limits.cpu | string | `"200m"` |  |
| ruler.resources.limits.memory | string | `"256Mi"` |  |
| ruler.resources.requests.cpu | string | `"10m"` |  |
| ruler.resources.requests.memory | string | `"32Mi"` |  |
| ruler.securityContext | object | `{}` |  |
| ruler.service.annotations | object | `{}` |  |
| ruler.service.labels | object | `{}` |  |
| ruler.strategy.rollingUpdate.maxSurge | int | `0` |  |
| ruler.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| ruler.strategy.type | string | `"RollingUpdate"` |  |
| ruler.terminationGracePeriodSeconds | int | `180` |  |
| ruler.tolerations | list | `[]` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| store_gateway.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].key | string | `"target"` |  |
| store_gateway.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].operator | string | `"In"` |  |
| store_gateway.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.labelSelector.matchExpressions[0].values[0] | string | `"store-gateway"` |  |
| store_gateway.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].podAffinityTerm.topologyKey | string | `"kubernetes.io/hostname"` |  |
| store_gateway.affinity.podAntiAffinity.preferredDuringSchedulingIgnoredDuringExecution[0].weight | int | `100` |  |
| store_gateway.annotations | object | `{}` |  |
| store_gateway.env | list | `[]` |  |
| store_gateway.extraArgs | object | `{}` |  |
| store_gateway.extraContainers | list | `[]` |  |
| store_gateway.extraPorts | list | `[]` |  |
| store_gateway.extraVolumeMounts | list | `[]` |  |
| store_gateway.extraVolumes | list | `[]` |  |
| store_gateway.initContainers | list | `[]` |  |
| store_gateway.livenessProbe.failureThreshold | int | `20` |  |
| store_gateway.livenessProbe.httpGet.path | string | `"/ready"` |  |
| store_gateway.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| store_gateway.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| store_gateway.livenessProbe.initialDelaySeconds | int | `180` |  |
| store_gateway.livenessProbe.periodSeconds | int | `30` |  |
| store_gateway.livenessProbe.successThreshold | int | `1` |  |
| store_gateway.livenessProbe.timeoutSeconds | int | `1` |  |
| store_gateway.nodeSelector | object | `{}` |  |
| store_gateway.persistentVolume.accessModes[0] | string | `"ReadWriteOnce"` |  |
| store_gateway.persistentVolume.annotations | object | `{}` |  |
| store_gateway.persistentVolume.enabled | bool | `true` |  |
| store_gateway.persistentVolume.size | string | `"2Gi"` |  |
| store_gateway.persistentVolume.subPath | string | `""` |  |
| store_gateway.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| store_gateway.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| store_gateway.podDisruptionBudget | object | `{}` |  |
| store_gateway.podLabels | object | `{}` |  |
| store_gateway.readinessProbe.httpGet.path | string | `"/ready"` |  |
| store_gateway.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| store_gateway.readinessProbe.initialDelaySeconds | int | `60` |  |
| store_gateway.replicas | int | `1` |  |
| store_gateway.resources.limits.cpu | int | `1` |  |
| store_gateway.resources.limits.memory | string | `"1Gi"` |  |
| store_gateway.resources.requests.cpu | string | `"100m"` |  |
| store_gateway.resources.requests.memory | string | `"512Mi"` |  |
| store_gateway.securityContext | object | `{}` |  |
| store_gateway.service.annotations | object | `{}` |  |
| store_gateway.service.labels | object | `{}` |  |
| store_gateway.strategy.type | string | `"RollingUpdate"` |  |
| store_gateway.terminationGracePeriodSeconds | int | `240` |  |
| store_gateway.tolerations | list | `[]` |  |
| table_manager.affinity | object | `{}` |  |
| table_manager.annotations | object | `{}` |  |
| table_manager.env | list | `[]` |  |
| table_manager.extraArgs | object | `{}` |  |
| table_manager.extraContainers | list | `[]` |  |
| table_manager.extraPorts | list | `[]` |  |
| table_manager.extraVolumeMounts | list | `[]` |  |
| table_manager.extraVolumes | list | `[]` |  |
| table_manager.initContainers | list | `[]` |  |
| table_manager.livenessProbe.httpGet.path | string | `"/ready"` |  |
| table_manager.livenessProbe.httpGet.port | string | `"http-metrics"` |  |
| table_manager.livenessProbe.initialDelaySeconds | int | `45` |  |
| table_manager.nodeSelector | object | `{}` |  |
| table_manager.persistence.subPath | string | `nil` |  |
| table_manager.podAnnotations."prometheus.io/port" | string | `"http-metrics"` |  |
| table_manager.podAnnotations."prometheus.io/scrape" | string | `"true"` |  |
| table_manager.podDisruptionBudget | object | `{}` |  |
| table_manager.podLabels | object | `{}` |  |
| table_manager.readinessProbe.httpGet.path | string | `"/ready"` |  |
| table_manager.readinessProbe.httpGet.port | string | `"http-metrics"` |  |
| table_manager.readinessProbe.initialDelaySeconds | int | `45` |  |
| table_manager.replicas | int | `1` |  |
| table_manager.resources.limits.cpu | int | `1` |  |
| table_manager.resources.limits.memory | string | `"1Gi"` |  |
| table_manager.resources.requests.cpu | string | `"10m"` |  |
| table_manager.resources.requests.memory | string | `"32Mi"` |  |
| table_manager.securityContext | object | `{}` |  |
| table_manager.service.annotations | object | `{}` |  |
| table_manager.service.labels | object | `{}` |  |
| table_manager.strategy.rollingUpdate.maxSurge | int | `0` |  |
| table_manager.strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| table_manager.strategy.type | string | `"RollingUpdate"` |  |
| table_manager.terminationGracePeriodSeconds | int | `180` |  |
| table_manager.tolerations | list | `[]` |  |
| useExternalConfig | bool | `false` |  |
