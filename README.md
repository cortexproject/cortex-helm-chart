<!-- README.md is a generated file. Make any changes in README.md.gotmpl or values.yaml. -->

# cortex

![Version: 0.7.0](https://img.shields.io/badge/Version-0.7.0-informational?style=flat-square) ![AppVersion: v1.10.0](https://img.shields.io/badge/AppVersion-v1.10.0-informational?style=flat-square)

Horizontally scalable, highly available, multi-tenant, long term Prometheus.

**Homepage:** <https://cortexmetrics.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Tom Hayward | thayward@infoblox.com | https://github.com/kd7lxl |
| Niclas Schad | Niclas.Schad@plusserver.com | https://github.com/ShuzZzle |

## Documentation

Checkout our documentation for the cortex-helm-chart [here](https://cortexproject.github.io/cortex-helm-chart/)

## Dependencies

### Key-Value store

Cortex requires a Key-Value (KV) store to store the ring. It can use traditional KV stores like [Consul](https://www.consul.io/) or [etcd](https://etcd.io/), but it can also build its own KV store on top of memberlist library using a gossip algorithm.

The recommended approach is to use the built-in memberlist as a KV store, where supported.

External KV stores can be installed alongside Cortex using their respective helm charts https://github.com/bitnami/charts/tree/master/bitnami/etcd and https://github.com/helm/charts/tree/master/stable/consul.

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
Note that it might be necessary to use `--reset-values` since some default values in the values.yaml might have changed or were removed.

Source code can be found [here](https://cortexmetrics.io/)

## Requirements

Kubernetes: `^1.19.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | memcached(memcached) | 5.15.4 |
| https://charts.bitnami.com/bitnami | memcached-index-read(memcached) | 5.15.4 |
| https://charts.bitnami.com/bitnami | memcached-index-write(memcached) | 5.15.4 |
| https://charts.bitnami.com/bitnami | memcached-frontend(memcached) | 5.15.4 |
| https://charts.bitnami.com/bitnami | memcached-blocks-index(memcached) | 5.15.4 |
| https://charts.bitnami.com/bitnami | memcached-blocks(memcached) | 5.15.4 |
| https://charts.bitnami.com/bitnami | memcached-blocks-metadata(memcached) | 5.15.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.&ZeroWidthSpace;affinity | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;annotations | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;enabled | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;env | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;initContainers | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| alertmanager.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes[0] | string | `"ReadWriteOnce"` |  |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` |  |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` |  |
| alertmanager.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| alertmanager.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| alertmanager.&ZeroWidthSpace;podLabels | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| alertmanager.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;replicas | int | `1` |  |
| alertmanager.&ZeroWidthSpace;resources | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;securityContext | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;defaultFolderName | string | `nil` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enableUniqueFilenames | bool | `false` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enabled | bool | `false` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folder | string | `"/data"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folderAnnotation | string | `nil` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;repository | string | `"quay.io/kiwigrid/k8s-sidecar"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;sha | string | `""` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;tag | string | `"1.10.7"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;imagePullPolicy | string | `"IfNotPresent"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;label | string | `"cortex_alertmanager"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;labelValue | string | `nil` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;resources | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;searchNamespace | string | `nil` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;securityContext.&ZeroWidthSpace;runAsUser | int | `0` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;watchMethod | string | `nil` |  |
| alertmanager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| alertmanager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| alertmanager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;statefulSet.&ZeroWidthSpace;enabled | bool | `false` |  |
| alertmanager.&ZeroWidthSpace;statefulStrategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| alertmanager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| alertmanager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| alertmanager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| alertmanager.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `60` |  |
| alertmanager.&ZeroWidthSpace;tolerations | list | `[]` |  |
| clusterDomain | string | `"cluster.local"` |  |
| compactor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| compactor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| compactor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"compactor"` |  |
| compactor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| compactor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| compactor.&ZeroWidthSpace;annotations | object | `{}` |  |
| compactor.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| compactor.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| compactor.&ZeroWidthSpace;enabled | bool | `true` |  |
| compactor.&ZeroWidthSpace;env | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| compactor.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| compactor.&ZeroWidthSpace;initContainers | list | `[]` |  |
| compactor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| compactor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| compactor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| compactor.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes[0] | string | `"ReadWriteOnce"` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` |  |
| compactor.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| compactor.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| compactor.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| compactor.&ZeroWidthSpace;podLabels | object | `{}` |  |
| compactor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| compactor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| compactor.&ZeroWidthSpace;replicas | int | `1` |  |
| compactor.&ZeroWidthSpace;resources | object | `{}` |  |
| compactor.&ZeroWidthSpace;securityContext | object | `{}` |  |
| compactor.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| compactor.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| compactor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `60` |  |
| compactor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| compactor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| compactor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| compactor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;initialDelaySeconds | int | `120` |  |
| compactor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;periodSeconds | int | `30` |  |
| compactor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| compactor.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `240` |  |
| compactor.&ZeroWidthSpace;tolerations | list | `[]` |  |
| config.&ZeroWidthSpace;alertmanager.&ZeroWidthSpace;enable_api | bool | `false` | Enable the experimental alertmanager config api. |
| config.&ZeroWidthSpace;alertmanager.&ZeroWidthSpace;external_url | string | `"/api/prom/alertmanager"` |  |
| config.&ZeroWidthSpace;alertmanager.&ZeroWidthSpace;storage | object | `{}` | Type of backend to use to store alertmanager configs. Supported values are: "configdb", "gcs", "s3", "local". refer to: https://cortexmetrics.io/docs/configuration/configuration-file/#alertmanager_config |
| config.&ZeroWidthSpace;api.&ZeroWidthSpace;prometheus_http_prefix | string | `"/prometheus"` |  |
| config.&ZeroWidthSpace;api.&ZeroWidthSpace;response_compression_enabled | bool | `true` |  |
| config.&ZeroWidthSpace;auth_enabled | bool | `false` |  |
| config.&ZeroWidthSpace;chunk_store.&ZeroWidthSpace;chunk_cache_config.&ZeroWidthSpace;memcached.&ZeroWidthSpace;expiration | string | `"1h"` |  |
| config.&ZeroWidthSpace;chunk_store.&ZeroWidthSpace;chunk_cache_config.&ZeroWidthSpace;memcached_client.&ZeroWidthSpace;timeout | string | `"1s"` |  |
| config.&ZeroWidthSpace;distributor.&ZeroWidthSpace;pool.&ZeroWidthSpace;health_check_ingesters | bool | `true` |  |
| config.&ZeroWidthSpace;distributor.&ZeroWidthSpace;shard_by_all_labels | bool | `true` |  |
| config.&ZeroWidthSpace;frontend.&ZeroWidthSpace;log_queries_longer_than | string | `"10s"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;final_sleep | string | `"0s"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;join_after | string | `"0s"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;num_tokens | int | `512` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;kvstore.&ZeroWidthSpace;consul.&ZeroWidthSpace;consistent_reads | bool | `true` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;kvstore.&ZeroWidthSpace;consul.&ZeroWidthSpace;host | string | `"consul:8500"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;kvstore.&ZeroWidthSpace;consul.&ZeroWidthSpace;http_client_timeout | string | `"20s"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;kvstore.&ZeroWidthSpace;prefix | string | `"collectors/"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;kvstore.&ZeroWidthSpace;store | string | `"consul"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;replication_factor | int | `3` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;max_transfer_retries | int | `0` |  |
| config.&ZeroWidthSpace;ingester_client.&ZeroWidthSpace;grpc_client_config.&ZeroWidthSpace;max_recv_msg_size | int | `104857600` |  |
| config.&ZeroWidthSpace;ingester_client.&ZeroWidthSpace;grpc_client_config.&ZeroWidthSpace;max_send_msg_size | int | `104857600` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;enforce_metric_name | bool | `false` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;max_query_lookback | string | `"0s"` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;reject_old_samples | bool | `true` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;reject_old_samples_max_age | string | `"168h"` |  |
| config.&ZeroWidthSpace;memberlist.&ZeroWidthSpace;bind_port | int | `7946` |  |
| config.&ZeroWidthSpace;memberlist.&ZeroWidthSpace;join_members | list | `[]` | the service name of the memberlist if using memberlist discovery |
| config.&ZeroWidthSpace;querier.&ZeroWidthSpace;active_query_tracker_dir | string | `"/data/cortex/querier"` |  |
| config.&ZeroWidthSpace;querier.&ZeroWidthSpace;query_ingesters_within | string | `"12h"` |  |
| config.&ZeroWidthSpace;querier.&ZeroWidthSpace;store_gateway_addresses | string | automatic | Comma separated list of store-gateway addresses in DNS Service Discovery format. This option should is set automatically when using the blocks storage and the store-gateway sharding is disabled (when enabled, the store-gateway instances form a ring and addresses are picked from the ring). |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;align_queries_with_step | bool | `true` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;cache_results | bool | `true` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;results_cache.&ZeroWidthSpace;cache.&ZeroWidthSpace;memcached.&ZeroWidthSpace;expiration | string | `"1h"` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;results_cache.&ZeroWidthSpace;cache.&ZeroWidthSpace;memcached_client.&ZeroWidthSpace;timeout | string | `"1s"` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;split_queries_by_interval | string | `"24h"` |  |
| config.&ZeroWidthSpace;ruler.&ZeroWidthSpace;enable_alertmanager_discovery | bool | `false` |  |
| config.&ZeroWidthSpace;ruler.&ZeroWidthSpace;enable_api | bool | `false` | Enable the experimental ruler config api. |
| config.&ZeroWidthSpace;ruler.&ZeroWidthSpace;storage | object | `{}` | Method to use for backend rule storage (configdb, azure, gcs, s3, swift, local) refer to https://cortexmetrics.io/docs/configuration/configuration-file/#ruler_config |
| config.&ZeroWidthSpace;runtime_config.&ZeroWidthSpace;file | string | `"/etc/cortex-runtime-config/runtime_config.yaml"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;chunks.&ZeroWidthSpace;period | string | `"168h"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;chunks.&ZeroWidthSpace;prefix | string | `"chunks_"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;from | string | `"2020-11-01"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;index.&ZeroWidthSpace;period | string | `"168h"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;index.&ZeroWidthSpace;prefix | string | `"index_"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;object_store | string | `"cassandra"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;schema | string | `"v10"` |  |
| config.&ZeroWidthSpace;schema.&ZeroWidthSpace;configs[0].&ZeroWidthSpace;store | string | `"cassandra"` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_listen_port | int | `9095` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_server_max_concurrent_streams | int | `1000` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_server_max_recv_msg_size | int | `104857600` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_server_max_send_msg_size | int | `104857600` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;http_listen_port | int | `8080` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;azure.&ZeroWidthSpace;account_key | string | `nil` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;azure.&ZeroWidthSpace;account_name | string | `nil` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;azure.&ZeroWidthSpace;container_name | string | `nil` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;cassandra.&ZeroWidthSpace;addresses | string | `nil` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;cassandra.&ZeroWidthSpace;auth | bool | `true` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;cassandra.&ZeroWidthSpace;keyspace | string | `"cortex"` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;cassandra.&ZeroWidthSpace;password | string | `nil` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;cassandra.&ZeroWidthSpace;username | string | `nil` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;engine | string | `"chunks"` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;index_queries_cache_config.&ZeroWidthSpace;memcached.&ZeroWidthSpace;expiration | string | `"1h"` |  |
| config.&ZeroWidthSpace;storage.&ZeroWidthSpace;index_queries_cache_config.&ZeroWidthSpace;memcached_client.&ZeroWidthSpace;timeout | string | `"1s"` |  |
| config.&ZeroWidthSpace;store_gateway | object | `{}` | https://cortexmetrics.io/docs/configuration/configuration-file/#store_gateway_config |
| config.&ZeroWidthSpace;table_manager.&ZeroWidthSpace;retention_deletes_enabled | bool | `false` |  |
| config.&ZeroWidthSpace;table_manager.&ZeroWidthSpace;retention_period | string | `"0s"` |  |
| configs.&ZeroWidthSpace;affinity | object | `{}` |  |
| configs.&ZeroWidthSpace;annotations | object | `{}` |  |
| configs.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| configs.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| configs.&ZeroWidthSpace;enabled | bool | `false` |  |
| configs.&ZeroWidthSpace;env | list | `[]` |  |
| configs.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| configs.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| configs.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| configs.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| configs.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| configs.&ZeroWidthSpace;initContainers | list | `[]` |  |
| configs.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| configs.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| configs.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| configs.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| configs.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| configs.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| configs.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| configs.&ZeroWidthSpace;podLabels | object | `{}` |  |
| configs.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| configs.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| configs.&ZeroWidthSpace;replicas | int | `1` |  |
| configs.&ZeroWidthSpace;resources | object | `{}` |  |
| configs.&ZeroWidthSpace;securityContext | object | `{}` |  |
| configs.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| configs.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| configs.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| configs.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| configs.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| configs.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| configs.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| configs.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| configs.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| configs.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| configs.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| configs.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| configs.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| configs.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| configs.&ZeroWidthSpace;tolerations | list | `[]` |  |
| configsdb_postgresql.&ZeroWidthSpace;auth.&ZeroWidthSpace;existing_secret.&ZeroWidthSpace;key | string | `nil` |  |
| configsdb_postgresql.&ZeroWidthSpace;auth.&ZeroWidthSpace;existing_secret.&ZeroWidthSpace;name | string | `nil` |  |
| configsdb_postgresql.&ZeroWidthSpace;auth.&ZeroWidthSpace;password | string | `nil` |  |
| configsdb_postgresql.&ZeroWidthSpace;enabled | bool | `false` |  |
| configsdb_postgresql.&ZeroWidthSpace;uri | string | `nil` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"distributor"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| distributor.&ZeroWidthSpace;annotations | object | `{}` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` | Creates a HorizontalPodAutoscaler for the distributor pods. |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `2` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetCPUUtilizationPercentage | int | `80` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `0` |  |
| distributor.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| distributor.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| distributor.&ZeroWidthSpace;env | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| distributor.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| distributor.&ZeroWidthSpace;initContainers | list | `[]` |  |
| distributor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| distributor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| distributor.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| distributor.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| distributor.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| distributor.&ZeroWidthSpace;podLabels | object | `{}` |  |
| distributor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| distributor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;replicas | int | `2` |  |
| distributor.&ZeroWidthSpace;resources | object | `{}` |  |
| distributor.&ZeroWidthSpace;securityContext | object | `{}` |  |
| distributor.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| distributor.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| distributor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| distributor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| distributor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| distributor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| distributor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| distributor.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `60` |  |
| distributor.&ZeroWidthSpace;tolerations | list | `[]` |  |
| externalConfigSecretName | string | `"secret-with-config.yaml"` |  |
| externalConfigVersion | string | `"0"` |  |
| image.&ZeroWidthSpace;pullPolicy | string | `"IfNotPresent"` |  |
| image.&ZeroWidthSpace;repository | string | `"quay.io/cortexproject/cortex"` |  |
| image.&ZeroWidthSpace;tag | string | `"v1.10.0"` |  |
| ingester.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| ingester.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| ingester.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"ingester"` |  |
| ingester.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| ingester.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| ingester.&ZeroWidthSpace;annotations | object | `{}` |  |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior.&ZeroWidthSpace;scaleDown.&ZeroWidthSpace;policies | list | `[{"periodSeconds":1800,"type":"Pods","value":1}]` | see https://cortexmetrics.io/docs/guides/ingesters-scaling-up-and-down/#scaling-down for scaledown details |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior.&ZeroWidthSpace;scaleDown.&ZeroWidthSpace;stabilizationWindowSeconds | int | `3600` | uses metrics from the past 1h to make scaleDown decisions |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior.&ZeroWidthSpace;scaleUp.&ZeroWidthSpace;policies | list | `[{"periodSeconds":1800,"type":"Pods","value":1}]` | This default scaleup policy allows adding 1 pod every 30 minutes. Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `3` |  |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `80` |  |
| ingester.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| ingester.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| ingester.&ZeroWidthSpace;env | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| ingester.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| ingester.&ZeroWidthSpace;initContainers | list | `[]` |  |
| ingester.&ZeroWidthSpace;lifecycle.&ZeroWidthSpace;preStop | object | `{"httpGet":{"path":"/ingester/shutdown","port":"http-metrics"}}` | The /shutdown preStop hook is recommended as part of the ingester scaledown process, but can be removed to optimize rolling restarts in instances that will never be scaled down or when using chunks storage with WAL disabled. https://cortexmetrics.io/docs/guides/ingesters-scaling-up-and-down/#scaling-down |
| ingester.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ingester.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ingester.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| ingester.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| ingester.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes[0] | string | `"ReadWriteOnce"` |  |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` |  |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` |  |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` |  |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` |  |
| ingester.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| ingester.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| ingester.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ingester.&ZeroWidthSpace;podLabels | object | `{}` |  |
| ingester.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ingester.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ingester.&ZeroWidthSpace;replicas | int | `3` |  |
| ingester.&ZeroWidthSpace;resources | object | `{}` |  |
| ingester.&ZeroWidthSpace;securityContext | object | `{}` |  |
| ingester.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| ingester.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| ingester.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `60` |  |
| ingester.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ingester.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ingester.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| ingester.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;initialDelaySeconds | int | `120` |  |
| ingester.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;periodSeconds | int | `30` |  |
| ingester.&ZeroWidthSpace;statefulSet.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingester.&ZeroWidthSpace;statefulStrategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| ingester.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| ingester.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ingester.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| ingester.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `240` |  |
| ingester.&ZeroWidthSpace;tolerations | list | `[]` |  |
| ingress.&ZeroWidthSpace;annotations | string | `nil` |  |
| ingress.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingress.&ZeroWidthSpace;hosts[0].&ZeroWidthSpace;host | string | `"chart-example.local"` |  |
| ingress.&ZeroWidthSpace;hosts[0].&ZeroWidthSpace;paths[0] | string | `"/"` |  |
| ingress.&ZeroWidthSpace;tls | list | `[]` |  |
| memcached-blocks-index.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-blocks-index.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached-blocks-index.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached-blocks-index.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached-blocks-index.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-blocks-index.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-blocks-index.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-blocks.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-blocks.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached-blocks.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached-blocks.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached-blocks.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-blocks.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-blocks.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-frontend.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-frontend.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-frontend.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached-frontend.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached-frontend.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached-frontend.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-frontend.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-frontend.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-index-read.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-index-read.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-index-read.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached-index-read.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached-index-read.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached-index-read.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-index-read.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-index-read.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-index-write.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-index-write.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-index-write.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached-index-write.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached-index-write.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached-index-write.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-index-write.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-index-write.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached.&ZeroWidthSpace;memcached.&ZeroWidthSpace;extraArgs[0] | string | `"-I 32m"` |  |
| memcached.&ZeroWidthSpace;memcached.&ZeroWidthSpace;maxItemMemory | int | `3840` |  |
| memcached.&ZeroWidthSpace;memcached.&ZeroWidthSpace;threads | int | `32` |  |
| memcached.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached.&ZeroWidthSpace;pdbMinAvailable | int | `1` |  |
| memcached.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached.&ZeroWidthSpace;resources | object | `{}` |  |
| nginx.&ZeroWidthSpace;affinity | object | `{}` |  |
| nginx.&ZeroWidthSpace;annotations | object | `{}` |  |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;auth_orgs | list | `[]` | (optional) List of [auth tenants](https://cortexmetrics.io/docs/guides/auth/) to set in the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;basicAuthSecretName | string | `""` | (optional) Name of basic auth secret. In order to use this option, a secret with htpasswd formatted contents at the key ".htpasswd" must exist. For example:   apiVersion: v1   kind: Secret   metadata:     name: my-secret     namespace: <same as cortex installation>   stringData:     .htpasswd: |       user1:$apr1$/woC1jnP$KAh0SsVn5qeSMjTtn0E9Q0       user2:$apr1$QdR8fNLT$vbCEEzDj7LyqCMyNpSoBh/ Please note that the use of basic auth will not identify organizations the way X-Scope-OrgID does. Thus, the use of basic auth alone will not prevent one tenant from viewing the metrics of another. To ensure tenants are scoped appropriately, explicitly set the `X-Scope-OrgID` header in the nginx config. Example   setHeaders:     X-Scope-Org-Id: $remote_user |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;client_max_body_size | string | `"1M"` |  |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;dnsResolver | string | `"kube-dns.kube-system.svc.cluster.local"` |  |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;httpSnippet | string | `""` | arbitrary snippet to inject in the http { } section of the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;mainSnippet | string | `""` | arbitrary snippet to inject in the top section of the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;serverSnippet | string | `""` | arbitrary snippet to inject in the server { } section of the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;setHeaders | object | `{}` |  |
| nginx.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| nginx.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `false` |  |
| nginx.&ZeroWidthSpace;enabled | bool | `true` |  |
| nginx.&ZeroWidthSpace;env | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| nginx.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| nginx.&ZeroWidthSpace;http_listen_port | int | `80` |  |
| nginx.&ZeroWidthSpace;image.&ZeroWidthSpace;pullPolicy | string | `"IfNotPresent"` |  |
| nginx.&ZeroWidthSpace;image.&ZeroWidthSpace;repository | string | `"nginx"` |  |
| nginx.&ZeroWidthSpace;image.&ZeroWidthSpace;tag | float | `1.21` |  |
| nginx.&ZeroWidthSpace;initContainers | list | `[]` |  |
| nginx.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/healthz"` |  |
| nginx.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| nginx.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| nginx.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `""` |  |
| nginx.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| nginx.&ZeroWidthSpace;podLabels | object | `{}` |  |
| nginx.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/healthz"` |  |
| nginx.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;replicas | int | `2` |  |
| nginx.&ZeroWidthSpace;resources | object | `{}` |  |
| nginx.&ZeroWidthSpace;securityContext | object | `{}` |  |
| nginx.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| nginx.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| nginx.&ZeroWidthSpace;service.&ZeroWidthSpace;type | string | `"ClusterIP"` |  |
| nginx.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| nginx.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| nginx.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| nginx.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| nginx.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| nginx.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| nginx.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/healthz"` |  |
| nginx.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| nginx.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| nginx.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| nginx.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `10` |  |
| nginx.&ZeroWidthSpace;tolerations | list | `[]` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"querier"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| querier.&ZeroWidthSpace;annotations | object | `{}` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` | Creates a HorizontalPodAutoscaler for the querier pods. |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `2` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetCPUUtilizationPercentage | int | `80` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `0` |  |
| querier.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| querier.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| querier.&ZeroWidthSpace;env | list | `[]` |  |
| querier.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| querier.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| querier.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| querier.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| querier.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| querier.&ZeroWidthSpace;initContainers | list | `[]` |  |
| querier.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| querier.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| querier.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| querier.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| querier.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| querier.&ZeroWidthSpace;podLabels | object | `{}` |  |
| querier.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| querier.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;replicas | int | `2` |  |
| querier.&ZeroWidthSpace;resources | object | `{}` |  |
| querier.&ZeroWidthSpace;securityContext | object | `{}` |  |
| querier.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| querier.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| querier.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| querier.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| querier.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| querier.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| querier.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| querier.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| querier.&ZeroWidthSpace;tolerations | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"query-frontend"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| query_frontend.&ZeroWidthSpace;annotations | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| query_frontend.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| query_frontend.&ZeroWidthSpace;env | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;initContainers | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_frontend.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| query_frontend.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| query_frontend.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| query_frontend.&ZeroWidthSpace;podLabels | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_frontend.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;replicas | int | `2` |  |
| query_frontend.&ZeroWidthSpace;resources | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;securityContext | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| query_frontend.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_frontend.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| query_frontend.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| query_frontend.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| query_frontend.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| query_frontend.&ZeroWidthSpace;tolerations | list | `[]` |  |
| ruler.&ZeroWidthSpace;affinity | object | `{}` |  |
| ruler.&ZeroWidthSpace;annotations | object | `{}` |  |
| ruler.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| ruler.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| ruler.&ZeroWidthSpace;directories | object | `{}` |  |
| ruler.&ZeroWidthSpace;enabled | bool | `true` |  |
| ruler.&ZeroWidthSpace;env | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| ruler.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| ruler.&ZeroWidthSpace;initContainers | list | `[]` |  |
| ruler.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ruler.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| ruler.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| ruler.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| ruler.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ruler.&ZeroWidthSpace;podLabels | object | `{}` |  |
| ruler.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ruler.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;replicas | int | `1` |  |
| ruler.&ZeroWidthSpace;resources | object | `{}` |  |
| ruler.&ZeroWidthSpace;securityContext | object | `{}` |  |
| ruler.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| ruler.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;defaultFolderName | string | `nil` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enableUniqueFilenames | bool | `false` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enabled | bool | `false` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folder | string | `"/tmp/rules"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folderAnnotation | string | `nil` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;repository | string | `"quay.io/kiwigrid/k8s-sidecar"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;sha | string | `""` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;tag | string | `"1.10.7"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;imagePullPolicy | string | `"IfNotPresent"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;label | string | `"cortex_rules"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;labelValue | string | `nil` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;resources | object | `{}` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;searchNamespace | string | `nil` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;securityContext.&ZeroWidthSpace;runAsUser | int | `0` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;watchMethod | string | `nil` |  |
| ruler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| ruler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ruler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| ruler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ruler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| ruler.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| ruler.&ZeroWidthSpace;tolerations | list | `[]` |  |
| runtimeconfigmap.&ZeroWidthSpace;annotations | object | `{}` |  |
| runtimeconfigmap.&ZeroWidthSpace;create | bool | `true` | If true, a configmap for the `runtime_config` will be created. If false, the configmap _must_ exist already on the cluster or pods will fail to create. |
| runtimeconfigmap.&ZeroWidthSpace;runtime_config | object | `{}` | https://cortexmetrics.io/docs/configuration/arguments/#runtime-configuration-file |
| serviceAccount.&ZeroWidthSpace;annotations | object | `{}` |  |
| serviceAccount.&ZeroWidthSpace;automountServiceAccountToken | bool | `true` |  |
| serviceAccount.&ZeroWidthSpace;create | bool | `true` |  |
| serviceAccount.&ZeroWidthSpace;name | string | `nil` |  |
| store_gateway.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| store_gateway.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| store_gateway.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"store-gateway"` |  |
| store_gateway.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| store_gateway.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| store_gateway.&ZeroWidthSpace;annotations | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| store_gateway.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| store_gateway.&ZeroWidthSpace;env | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;initContainers | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| store_gateway.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| store_gateway.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| store_gateway.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes[0] | string | `"ReadWriteOnce"` |  |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` |  |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` |  |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` |  |
| store_gateway.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| store_gateway.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| store_gateway.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| store_gateway.&ZeroWidthSpace;podLabels | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| store_gateway.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| store_gateway.&ZeroWidthSpace;replicas | int | `1` |  |
| store_gateway.&ZeroWidthSpace;resources | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;securityContext | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `60` |  |
| store_gateway.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| store_gateway.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| store_gateway.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| store_gateway.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;initialDelaySeconds | int | `120` |  |
| store_gateway.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;periodSeconds | int | `30` |  |
| store_gateway.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| store_gateway.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `240` |  |
| store_gateway.&ZeroWidthSpace;tolerations | list | `[]` |  |
| table_manager.&ZeroWidthSpace;affinity | object | `{}` |  |
| table_manager.&ZeroWidthSpace;annotations | object | `{}` |  |
| table_manager.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| table_manager.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| table_manager.&ZeroWidthSpace;env | list | `[]` |  |
| table_manager.&ZeroWidthSpace;extraArgs | object | `{}` |  |
| table_manager.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| table_manager.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| table_manager.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| table_manager.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| table_manager.&ZeroWidthSpace;initContainers | list | `[]` |  |
| table_manager.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| table_manager.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| table_manager.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| table_manager.&ZeroWidthSpace;persistence.&ZeroWidthSpace;subPath | string | `nil` |  |
| table_manager.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"http-metrics"` |  |
| table_manager.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| table_manager.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| table_manager.&ZeroWidthSpace;podLabels | object | `{}` |  |
| table_manager.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| table_manager.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| table_manager.&ZeroWidthSpace;replicas | int | `1` |  |
| table_manager.&ZeroWidthSpace;resources | object | `{}` |  |
| table_manager.&ZeroWidthSpace;securityContext | object | `{}` |  |
| table_manager.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| table_manager.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| table_manager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| table_manager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| table_manager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| table_manager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| table_manager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| table_manager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| table_manager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| table_manager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| table_manager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| table_manager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| table_manager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| table_manager.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| table_manager.&ZeroWidthSpace;tolerations | list | `[]` |  |
| tags.&ZeroWidthSpace;blocks-storage-memcached | bool | `false` |  |
| useExternalConfig | bool | `false` |  |

