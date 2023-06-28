<!-- README.md is a generated file. Make any changes in README.md.gotmpl or values.yaml. -->

# cortex

![Version: 2.1.0](https://img.shields.io/badge/Version-2.1.0-informational?style=flat-square) ![AppVersion: v1.15.2](https://img.shields.io/badge/AppVersion-v1.15.2-informational?style=flat-square)

Horizontally scalable, highly available, multi-tenant, long term Prometheus.

**Homepage:** <https://cortexmetrics.io/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Tom Hayward | <thayward@infoblox.com> | <https://github.com/kd7lxl> |
| Niclas Schad | <Niclas.Schad@mail.schwarz> | <https://github.com/nschad> |

## Documentation

Checkout our documentation for the cortex-helm-chart [here](https://cortexproject.github.io/cortex-helm-chart/)

## Dependencies

### Key-Value store

Cortex requires a Key-Value (KV) store to store the ring. It can use traditional KV stores like [Consul](https://www.consul.io/) or [etcd](https://etcd.io/), but it can also build its own KV store on top of memberlist library using a gossip algorithm.

The recommended approach is to use the built-in memberlist as a KV store, where supported.

External KV stores can be installed alongside Cortex using their respective helm charts https://github.com/bitnami/charts/tree/master/bitnami/etcd and https://github.com/hashicorp/consul-k8s/tree/main/charts/consul.

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
| https://charts.bitnami.com/bitnami | memcached-frontend(memcached) | 6.3.12 |
| https://charts.bitnami.com/bitnami | memcached-blocks-index(memcached) | 6.3.12 |
| https://charts.bitnami.com/bitnami | memcached-blocks(memcached) | 6.3.12 |
| https://charts.bitnami.com/bitnami | memcached-blocks-metadata(memcached) | 6.3.12 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertmanager.&ZeroWidthSpace;affinity | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;annotations | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;enabled | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;env | list | `[]` | Extra env variables to pass to the cortex container |
| alertmanager.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log level (debug, info, warn, error) |
| alertmanager.&ZeroWidthSpace;extraContainers | list | `[]` | Additional containers to be added to the cortex pod. |
| alertmanager.&ZeroWidthSpace;extraPorts | list | `[]` | Additional ports to the cortex services. Useful to expose extra container ports. |
| alertmanager.&ZeroWidthSpace;extraVolumeMounts | list | `[]` | Extra volume mounts that will be added to the cortex container |
| alertmanager.&ZeroWidthSpace;extraVolumes | list | `[]` | Additional volumes to the cortex pod. |
| alertmanager.&ZeroWidthSpace;initContainers | list | `[]` | Init containers to be added to the cortex pod. |
| alertmanager.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| alertmanager.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes | list | `["ReadWriteOnce"]` | Alertmanager data Persistent Volume access modes Must match those of existing PV or dynamic provisioner Ref: http://kubernetes.io/docs/user-guide/persistent-volumes/ |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` | Alertmanager data Persistent Volume Claim annotations |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` | If true and alertmanager.statefulSet.enabled is true, Alertmanager will create/use a Persistent Volume Claim If false, use emptyDir |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` | Alertmanager data Persistent Volume size |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;storageClass | string | `nil` | Alertmanager data Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner. |
| alertmanager.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` | Subdirectory of Alertmanager data Persistent Volume to mount Useful if the volume's root directory is not empty |
| alertmanager.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| alertmanager.&ZeroWidthSpace;podDisruptionBudget | object | `{"maxUnavailable":1}` | If not set then a PodDisruptionBudget will not be created |
| alertmanager.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| alertmanager.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| alertmanager.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;replicas | int | `1` |  |
| alertmanager.&ZeroWidthSpace;resources | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;securityContext | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;defaultFolderName | string | `""` | The default folder name, it will create a subfolder under the `folder` and put rules in there instead |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enableUniqueFilenames | bool | `false` | A value of true will produce unique filenames to avoid issues when duplicate data keys exist between ConfigMaps and/or Secrets within the same or multiple Namespaces. |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enabled | bool | `false` | Enable sidecar that collect the configmaps with specified label and stores the included files them into the respective folders |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folder | string | `"/data"` | Folder where the files should be placed. |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folderAnnotation | string | `"k8s-sidecar-target-directory"` | The annotation the sidecar will look for in ConfigMaps and/or Secrets to override the destination folder for files. If the value is a relative path, it will be relative to FOLDER |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;repository | string | `"kiwigrid/k8s-sidecar"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;sha | string | `""` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;tag | string | `"1.19.5"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;imagePullPolicy | string | `"IfNotPresent"` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;label | string | `"cortex_alertmanager"` | Label that should be used for filtering |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;labelValue | string | `""` | The value for the label you want to filter your resources on. Don't set a value to filter by any value |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;resource | string | `"both"` | The resource type that the operator will filter for. Can be configmap, secret or both |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;resources | object | `{}` |  |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;searchNamespace | string | `""` | The Namespace(s) from which resources will be watched. For multiple namespaces, use a comma-separated string like "default,test". If not set or set to ALL, it will watch all Namespaces. |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;skipTlsVerify | bool | `false` | Set to true to skip tls verification for kube api calls |
| alertmanager.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;watchMethod | string | `""` | Determines how kopf-k8s-sidecar will run. If WATCH it will run like a normal operator forever. If LIST it will gather the matching configmaps and secrets currently present, write those files to the destination directory and die |
| alertmanager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| alertmanager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| alertmanager.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| alertmanager.&ZeroWidthSpace;statefulSet.&ZeroWidthSpace;enabled | bool | `false` | If true, use a statefulset instead of a deployment for pod management. This is useful for using a persistent volume for storing silences between restarts. |
| alertmanager.&ZeroWidthSpace;statefulStrategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| alertmanager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| alertmanager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| alertmanager.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| alertmanager.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `60` |  |
| alertmanager.&ZeroWidthSpace;tolerations | list | `[]` | Tolerations for pod assignment ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| alertmanager.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| clusterDomain | string | `"cluster.local"` | Kubernetes cluster DNS domain |
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
| compactor.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| compactor.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| compactor.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| compactor.&ZeroWidthSpace;initContainers | list | `[]` |  |
| compactor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| compactor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| compactor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| compactor.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes | list | `["ReadWriteOnce"]` | compactor data Persistent Volume access modes Must match those of existing PV or dynamic provisioner Ref: http://kubernetes.io/docs/user-guide/persistent-volumes/ |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` | compactor data Persistent Volume Claim annotations |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` | If true compactor will create/use a Persistent Volume Claim If false, use emptyDir |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` |  |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;storageClass | string | `nil` | compactor data Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner. |
| compactor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` | Subdirectory of compactor data Persistent Volume to mount Useful if the volume's root directory is not empty |
| compactor.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| compactor.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| compactor.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| compactor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| compactor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| compactor.&ZeroWidthSpace;replicas | int | `1` |  |
| compactor.&ZeroWidthSpace;resources | object | `{}` |  |
| compactor.&ZeroWidthSpace;securityContext | object | `{}` |  |
| compactor.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| compactor.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| compactor.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| compactor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
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
| compactor.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| config.&ZeroWidthSpace;alertmanager.&ZeroWidthSpace;enable_api | bool | `false` | Enable the experimental alertmanager config api. |
| config.&ZeroWidthSpace;alertmanager.&ZeroWidthSpace;external_url | string | `"/api/prom/alertmanager"` |  |
| config.&ZeroWidthSpace;api.&ZeroWidthSpace;prometheus_http_prefix | string | `"/prometheus"` |  |
| config.&ZeroWidthSpace;api.&ZeroWidthSpace;response_compression_enabled | bool | `true` | Use GZIP compression for API responses. Some endpoints serve large YAML or JSON blobs which can benefit from compression. |
| config.&ZeroWidthSpace;auth_enabled | bool | `false` |  |
| config.&ZeroWidthSpace;blocks_storage.&ZeroWidthSpace;bucket_store.&ZeroWidthSpace;bucket_index.&ZeroWidthSpace;enabled | bool | `true` |  |
| config.&ZeroWidthSpace;blocks_storage.&ZeroWidthSpace;bucket_store.&ZeroWidthSpace;sync_dir | string | `"/data/tsdb-sync"` |  |
| config.&ZeroWidthSpace;blocks_storage.&ZeroWidthSpace;tsdb.&ZeroWidthSpace;dir | string | `"/data/tsdb"` |  |
| config.&ZeroWidthSpace;distributor.&ZeroWidthSpace;pool.&ZeroWidthSpace;health_check_ingesters | bool | `true` |  |
| config.&ZeroWidthSpace;distributor.&ZeroWidthSpace;shard_by_all_labels | bool | `true` | Distribute samples based on all labels, as opposed to solely by user and metric name. |
| config.&ZeroWidthSpace;frontend.&ZeroWidthSpace;log_queries_longer_than | string | `"10s"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;final_sleep | string | `"30s"` | Duration to sleep for before exiting, to ensure metrics are scraped. |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;join_after | string | `"10s"` | We don't want to join immediately, but wait a bit to see other ingesters and their tokens first. It can take a while to have the full picture when using gossip |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;num_tokens | int | `512` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;observe_period | string | `"10s"` | To avoid generating same tokens by multiple ingesters, they can "observe" the ring for a while, after putting their own tokens into it. This is only useful when using gossip, since multiple ingesters joining at the same time can have conflicting tokens if they don't see each other yet. |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;kvstore.&ZeroWidthSpace;store | string | `"memberlist"` |  |
| config.&ZeroWidthSpace;ingester.&ZeroWidthSpace;lifecycler.&ZeroWidthSpace;ring.&ZeroWidthSpace;replication_factor | int | `3` | Ingester replication factor per default is 3 |
| config.&ZeroWidthSpace;ingester_client.&ZeroWidthSpace;grpc_client_config.&ZeroWidthSpace;max_recv_msg_size | int | `10485760` |  |
| config.&ZeroWidthSpace;ingester_client.&ZeroWidthSpace;grpc_client_config.&ZeroWidthSpace;max_send_msg_size | int | `10485760` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;enforce_metric_name | bool | `true` | Enforce that every sample has a metric name |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;max_query_lookback | string | `"0s"` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;reject_old_samples | bool | `true` |  |
| config.&ZeroWidthSpace;limits.&ZeroWidthSpace;reject_old_samples_max_age | string | `"168h"` |  |
| config.&ZeroWidthSpace;memberlist.&ZeroWidthSpace;bind_port | int | `7946` |  |
| config.&ZeroWidthSpace;memberlist.&ZeroWidthSpace;join_members | list | `["{{ include \"cortex.fullname\" $ }}-memberlist"]` | the service name of the memberlist if using memberlist discovery |
| config.&ZeroWidthSpace;querier.&ZeroWidthSpace;active_query_tracker_dir | string | `"/data/active-query-tracker"` |  |
| config.&ZeroWidthSpace;querier.&ZeroWidthSpace;store_gateway_addresses | string | automatic | Comma separated list of store-gateway addresses in DNS Service Discovery format. This option should is set automatically when using the blocks storage and the store-gateway sharding is disabled (when enabled, the store-gateway instances form a ring and addresses are picked from the ring). |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;align_queries_with_step | bool | `true` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;cache_results | bool | `true` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;results_cache.&ZeroWidthSpace;cache.&ZeroWidthSpace;memcached.&ZeroWidthSpace;expiration | string | `"1h"` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;results_cache.&ZeroWidthSpace;cache.&ZeroWidthSpace;memcached_client.&ZeroWidthSpace;timeout | string | `"1s"` |  |
| config.&ZeroWidthSpace;query_range.&ZeroWidthSpace;split_queries_by_interval | string | `"24h"` |  |
| config.&ZeroWidthSpace;ruler.&ZeroWidthSpace;enable_alertmanager_discovery | bool | `false` |  |
| config.&ZeroWidthSpace;ruler.&ZeroWidthSpace;enable_api | bool | `true` | Enable the experimental ruler config api. |
| config.&ZeroWidthSpace;runtime_config.&ZeroWidthSpace;file | string | `"/etc/cortex-runtime-config/runtime_config.yaml"` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_listen_port | int | `9095` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_server_max_concurrent_streams | int | `10000` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_server_max_recv_msg_size | int | `10485760` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;grpc_server_max_send_msg_size | int | `10485760` |  |
| config.&ZeroWidthSpace;server.&ZeroWidthSpace;http_listen_port | int | `8080` |  |
| config.&ZeroWidthSpace;storage | object | `{"engine":"blocks"}` | See https://github.com/cortexproject/cortex/blob/master/docs/configuration/config-file-reference.md#storage_config |
| config.&ZeroWidthSpace;store_gateway | object | `{"sharding_enabled":false}` | https://cortexmetrics.io/docs/configuration/configuration-file/#store_gateway_config |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"distributor"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| distributor.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| distributor.&ZeroWidthSpace;annotations | object | `{}` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` | Creates a HorizontalPodAutoscaler for the distributor pods. |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;extraMetrics | list | `[]` | Optional custom and external metrics for the distributor pods to scale on In order to use this option , define a list of of specific following https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics and https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `2` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetCPUUtilizationPercentage | int | `80` |  |
| distributor.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `0` |  |
| distributor.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| distributor.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| distributor.&ZeroWidthSpace;enabled | bool | `true` |  |
| distributor.&ZeroWidthSpace;env | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| distributor.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| distributor.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| distributor.&ZeroWidthSpace;initContainers | list | `[]` |  |
| distributor.&ZeroWidthSpace;lifecycle | object | `{}` |  |
| distributor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| distributor.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| distributor.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `nil` |  |
| distributor.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| distributor.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| distributor.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| distributor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| distributor.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;replicas | int | `2` |  |
| distributor.&ZeroWidthSpace;resources | object | `{}` |  |
| distributor.&ZeroWidthSpace;securityContext | object | `{}` |  |
| distributor.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| distributor.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| distributor.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| distributor.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| distributor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| distributor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| distributor.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| distributor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| distributor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| distributor.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| distributor.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `60` |  |
| distributor.&ZeroWidthSpace;tolerations | list | `[]` |  |
| distributor.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| externalConfigSecretName | string | `"secret-with-config.yaml"` |  |
| externalConfigVersion | string | `"0"` |  |
| image.&ZeroWidthSpace;pullPolicy | string | `"IfNotPresent"` |  |
| image.&ZeroWidthSpace;pullSecrets | list | `[]` | Optionally specify an array of imagePullSecrets. Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| image.&ZeroWidthSpace;repository | string | `"quay.io/cortexproject/cortex"` |  |
| image.&ZeroWidthSpace;tag | string | `""` | Allows you to override the cortex version in this chart. Use at your own risk. |
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
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;extraMetrics | list | `[]` | Optional custom and external metrics for the ingester pods to scale on In order to use this option , define a list of of specific following https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics and https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `3` |  |
| ingester.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `80` |  |
| ingester.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| ingester.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| ingester.&ZeroWidthSpace;enabled | bool | `true` |  |
| ingester.&ZeroWidthSpace;env | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| ingester.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| ingester.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| ingester.&ZeroWidthSpace;initContainers | list | `[]` |  |
| ingester.&ZeroWidthSpace;lifecycle.&ZeroWidthSpace;preStop | object | `{"httpGet":{"path":"/ingester/shutdown","port":"http-metrics"}}` | The /shutdown preStop hook is recommended as part of the ingester scaledown process, but can be removed to optimize rolling restarts in instances that will never be scaled down. https://cortexmetrics.io/docs/guides/ingesters-scaling-up-and-down/#scaling-down |
| ingester.&ZeroWidthSpace;livenessProbe | object | `{}` | Startup/liveness probes for ingesters are not recommended.  Ref: https://cortexmetrics.io/docs/guides/running-cortex-on-kubernetes/#take-extra-care-with-ingesters |
| ingester.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes | list | `["ReadWriteOnce"]` | Ingester data Persistent Volume access modes Must match those of existing PV or dynamic provisioner Ref: http://kubernetes.io/docs/user-guide/persistent-volumes/ |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` | Ingester data Persistent Volume Claim annotations |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` | If true and ingester.statefulSet.enabled is true, Ingester will create/use a Persistent Volume Claim If false, use emptyDir |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` | Ingester data Persistent Volume size |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;storageClass | string | `nil` | Ingester data Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner. |
| ingester.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` | Subdirectory of Ingester data Persistent Volume to mount Useful if the volume's root directory is not empty |
| ingester.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| ingester.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ingester.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| ingester.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ingester.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ingester.&ZeroWidthSpace;replicas | int | `3` |  |
| ingester.&ZeroWidthSpace;resources | object | `{}` |  |
| ingester.&ZeroWidthSpace;securityContext | object | `{}` |  |
| ingester.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| ingester.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| ingester.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `nil` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| ingester.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| ingester.&ZeroWidthSpace;startupProbe | object | `{}` | Startup/liveness probes for ingesters are not recommended.  Ref: https://cortexmetrics.io/docs/guides/running-cortex-on-kubernetes/#take-extra-care-with-ingesters |
| ingester.&ZeroWidthSpace;statefulSet.&ZeroWidthSpace;enabled | bool | `false` | If true, use a statefulset instead of a deployment for pod management. This is useful when using WAL |
| ingester.&ZeroWidthSpace;statefulSet.&ZeroWidthSpace;podManagementPolicy | string | `"OrderedReady"` | ref: https://cortexmetrics.io/docs/guides/ingesters-scaling-up-and-down/#scaling-down and https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#pod-management-policies for scaledown details |
| ingester.&ZeroWidthSpace;statefulStrategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| ingester.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| ingester.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ingester.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| ingester.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `240` |  |
| ingester.&ZeroWidthSpace;tolerations | list | `[]` |  |
| ingester.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| ingress.&ZeroWidthSpace;annotations | object | `{}` |  |
| ingress.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingress.&ZeroWidthSpace;hosts[0].&ZeroWidthSpace;host | string | `"chart-example.local"` |  |
| ingress.&ZeroWidthSpace;hosts[0].&ZeroWidthSpace;paths[0] | string | `"/"` |  |
| ingress.&ZeroWidthSpace;ingressClass.&ZeroWidthSpace;enabled | bool | `false` |  |
| ingress.&ZeroWidthSpace;ingressClass.&ZeroWidthSpace;name | string | `"nginx"` |  |
| ingress.&ZeroWidthSpace;tls | list | `[]` |  |
| memberlist.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| memberlist.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| memcached-blocks-index.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-blocks-index.&ZeroWidthSpace;enabled | bool | `false` | Enables support for block index caching |
| memcached-blocks-index.&ZeroWidthSpace;extraEnvVars[0] | object | `{"name":"MEMCACHED_CACHE_SIZE","value":"1024"}` | MEMCACHED_CACHE_SIZE is the amount of memory allocated to memcached for object storage |
| memcached-blocks-index.&ZeroWidthSpace;extraEnvVars[1] | object | `{"name":"MEMCACHED_MAX_CONNECTIONS","value":"1024"}` | MEMCACHED_MAX_CONNECTIONS is the maximum number of simultaneous connections to the memcached service |
| memcached-blocks-index.&ZeroWidthSpace;extraEnvVars[2] | object | `{"name":"MEMCACHED_THREADS","value":"4"}` | MEMCACHED_THREADS is the number of threads to use when processing incoming requests. By default, memcached is configured to use 4 concurrent threads. The threading improves the performance of storing and retrieving data in the cache, using a locking system to prevent different threads overwriting or updating the same values. |
| memcached-blocks-index.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-blocks-index.&ZeroWidthSpace;metrics.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-blocks-index.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-blocks-index.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;enabled | bool | `false` | Enables support for block metadata caching |
| memcached-blocks-metadata.&ZeroWidthSpace;extraEnvVars[0] | object | `{"name":"MEMCACHED_CACHE_SIZE","value":"1024"}` | MEMCACHED_CACHE_SIZE is the amount of memory allocated to memcached for object storage |
| memcached-blocks-metadata.&ZeroWidthSpace;extraEnvVars[1] | object | `{"name":"MEMCACHED_MAX_CONNECTIONS","value":"1024"}` | MEMCACHED_MAX_CONNECTIONS is the maximum number of simultaneous connections to the memcached service |
| memcached-blocks-metadata.&ZeroWidthSpace;extraEnvVars[2] | object | `{"name":"MEMCACHED_THREADS","value":"4"}` | MEMCACHED_THREADS is the number of threads to use when processing incoming requests. By default, memcached is configured to use 4 concurrent threads. The threading improves the performance of storing and retrieving data in the cache, using a locking system to prevent different threads overwriting or updating the same values. |
| memcached-blocks-metadata.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;metrics.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-blocks-metadata.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-blocks.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-blocks.&ZeroWidthSpace;enabled | bool | `false` | Enables support for block caching |
| memcached-blocks.&ZeroWidthSpace;extraEnvVars[0] | object | `{"name":"MEMCACHED_CACHE_SIZE","value":"1024"}` | MEMCACHED_CACHE_SIZE is the amount of memory allocated to memcached for object storage |
| memcached-blocks.&ZeroWidthSpace;extraEnvVars[1] | object | `{"name":"MEMCACHED_MAX_CONNECTIONS","value":"1024"}` | MEMCACHED_MAX_CONNECTIONS is the maximum number of simultaneous connections to the memcached service |
| memcached-blocks.&ZeroWidthSpace;extraEnvVars[2] | object | `{"name":"MEMCACHED_THREADS","value":"4"}` | MEMCACHED_THREADS is the number of threads to use when processing incoming requests. By default, memcached is configured to use 4 concurrent threads. The threading improves the performance of storing and retrieving data in the cache, using a locking system to prevent different threads overwriting or updating the same values. |
| memcached-blocks.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-blocks.&ZeroWidthSpace;metrics.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-blocks.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-blocks.&ZeroWidthSpace;resources | object | `{}` |  |
| memcached-frontend.&ZeroWidthSpace;architecture | string | `"high-availability"` |  |
| memcached-frontend.&ZeroWidthSpace;enabled | bool | `false` | Enables support for caching queries in the frontend |
| memcached-frontend.&ZeroWidthSpace;extraEnvVars[0] | object | `{"name":"MEMCACHED_CACHE_SIZE","value":"1024"}` | MEMCACHED_CACHE_SIZE is the amount of memory allocated to memcached for object storage |
| memcached-frontend.&ZeroWidthSpace;extraEnvVars[1] | object | `{"name":"MEMCACHED_MAX_CONNECTIONS","value":"1024"}` | MEMCACHED_MAX_CONNECTIONS is the maximum number of simultaneous connections to the memcached service |
| memcached-frontend.&ZeroWidthSpace;extraEnvVars[2] | object | `{"name":"MEMCACHED_THREADS","value":"4"}` | MEMCACHED_THREADS is the number of threads to use when processing incoming requests. By default, memcached is configured to use 4 concurrent threads. The threading improves the performance of storing and retrieving data in the cache, using a locking system to prevent different threads overwriting or updating the same values. |
| memcached-frontend.&ZeroWidthSpace;metrics.&ZeroWidthSpace;enabled | bool | `true` |  |
| memcached-frontend.&ZeroWidthSpace;metrics.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| memcached-frontend.&ZeroWidthSpace;replicaCount | int | `2` |  |
| memcached-frontend.&ZeroWidthSpace;resources | object | `{}` |  |
| nginx.&ZeroWidthSpace;affinity | object | `{}` |  |
| nginx.&ZeroWidthSpace;annotations | object | `{}` |  |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` | Creates a HorizontalPodAutoscaler for the nginx pods. |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;extraMetrics | list | `[]` | Optional custom and external metrics for the nginx pods to scale on In order to use this option , define a list of of specific following https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics and https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `2` |  |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetCPUUtilizationPercentage | int | `80` |  |
| nginx.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `0` |  |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;auth_orgs | list | `[]` | Optional list of [auth tenants](https://cortexmetrics.io/docs/guides/auth/) to set in the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;basicAuthSecretName | string | `""` | Optional name of basic auth secret. In order to use this option, a secret with htpasswd formatted contents at the key ".htpasswd" must exist. For example:    apiVersion: v1   kind: Secret   metadata:     name: my-secret     namespace: <same as cortex installation>   stringData:     .htpasswd: |       user1:$apr1$/woC1jnP$KAh0SsVn5qeSMjTtn0E9Q0       user2:$apr1$QdR8fNLT$vbCEEzDj7LyqCMyNpSoBh/  Please note that the use of basic auth will not identify organizations the way X-Scope-OrgID does. Thus, the use of basic auth alone will not prevent one tenant from viewing the metrics of another. To ensure tenants are scoped appropriately, explicitly set the `X-Scope-OrgID` header in the nginx config. Example   setHeaders:     X-Scope-OrgID: $remote_user |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;client_max_body_size | string | `"1M"` | ref: http://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;dnsResolver | string | `"kube-dns.kube-system.svc.cluster.local"` |  |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;dnsTTL | string | `"15s"` | Including the valid parameter to the `resolver` directive to re-resolve names every `dnsTTL` seconds/minutes |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;httpSnippet | string | `""` | arbitrary snippet to inject in the http { } section of the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;mainSnippet | string | `""` | arbitrary snippet to inject in the top section of the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;serverSnippet | string | `""` | arbitrary snippet to inject in the server { } section of the nginx config |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;setHeaders | object | `{}` |  |
| nginx.&ZeroWidthSpace;config.&ZeroWidthSpace;verboseLogging | bool | `true` | Enables all access logs from nginx, otherwise ignores 2XX and 3XX status codes |
| nginx.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| nginx.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `false` |  |
| nginx.&ZeroWidthSpace;enabled | bool | `true` |  |
| nginx.&ZeroWidthSpace;env | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| nginx.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| nginx.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| nginx.&ZeroWidthSpace;http_listen_port | int | `80` |  |
| nginx.&ZeroWidthSpace;image.&ZeroWidthSpace;pullPolicy | string | `"IfNotPresent"` |  |
| nginx.&ZeroWidthSpace;image.&ZeroWidthSpace;repository | string | `"nginx"` |  |
| nginx.&ZeroWidthSpace;image.&ZeroWidthSpace;tag | float | `1.23` |  |
| nginx.&ZeroWidthSpace;initContainers | list | `[]` |  |
| nginx.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/healthz"` |  |
| nginx.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| nginx.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `nil` |  |
| nginx.&ZeroWidthSpace;podAnnotations | object | `{}` | Pod Annotations |
| nginx.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| nginx.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| nginx.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/healthz"` |  |
| nginx.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;replicas | int | `2` |  |
| nginx.&ZeroWidthSpace;resources | object | `{}` |  |
| nginx.&ZeroWidthSpace;securityContext | object | `{}` |  |
| nginx.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| nginx.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| nginx.&ZeroWidthSpace;service.&ZeroWidthSpace;type | string | `"ClusterIP"` |  |
| nginx.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| nginx.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| nginx.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/healthz"` |  |
| nginx.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| nginx.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| nginx.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| nginx.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| nginx.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `10` |  |
| nginx.&ZeroWidthSpace;tolerations | list | `[]` |  |
| nginx.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| overrides_exporter.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| overrides_exporter.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"query-scheduler"` |  |
| overrides_exporter.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| overrides_exporter.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| overrides_exporter.&ZeroWidthSpace;annotations | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| overrides_exporter.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| overrides_exporter.&ZeroWidthSpace;enabled | bool | `false` | https://cortexmetrics.io/docs/guides/overrides-exporter/ |
| overrides_exporter.&ZeroWidthSpace;env | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| overrides_exporter.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;initContainers | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;lifecycle | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| overrides_exporter.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| overrides_exporter.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"http-metrics","prometheus.io/scrape":"true"}` | Pod Annotations |
| overrides_exporter.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| overrides_exporter.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| overrides_exporter.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| overrides_exporter.&ZeroWidthSpace;resources | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;securityContext | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| overrides_exporter.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| overrides_exporter.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| overrides_exporter.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| overrides_exporter.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| overrides_exporter.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| overrides_exporter.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| overrides_exporter.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| overrides_exporter.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| overrides_exporter.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| overrides_exporter.&ZeroWidthSpace;tolerations | list | `[]` |  |
| overrides_exporter.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| purger.&ZeroWidthSpace;affinity | object | `{}` |  |
| purger.&ZeroWidthSpace;annotations | object | `{}` |  |
| purger.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| purger.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| purger.&ZeroWidthSpace;enabled | bool | `false` |  |
| purger.&ZeroWidthSpace;env | list | `[]` | Extra env variables to pass to the cortex container |
| purger.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| purger.&ZeroWidthSpace;extraContainers | list | `[]` | Additional containers to be added to the cortex pod. |
| purger.&ZeroWidthSpace;extraPorts | list | `[]` | Additional ports to the cortex services. Useful to expose extra container ports. |
| purger.&ZeroWidthSpace;extraVolumeMounts | list | `[]` | Extra volume mounts that will be added to the cortex container |
| purger.&ZeroWidthSpace;extraVolumes | list | `[]` | Additional volumes to the cortex pod. |
| purger.&ZeroWidthSpace;initContainers | list | `[]` | Init containers to be added to the cortex pod. |
| purger.&ZeroWidthSpace;lifecycle | object | `{}` |  |
| purger.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| purger.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| purger.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| purger.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| purger.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/port" | string | `"8080"` |  |
| purger.&ZeroWidthSpace;podAnnotations.&ZeroWidthSpace;"prometheus.&ZeroWidthSpace;io/scrape" | string | `"true"` |  |
| purger.&ZeroWidthSpace;podLabels | object | `{}` |  |
| purger.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| purger.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| purger.&ZeroWidthSpace;replicas | int | `1` |  |
| purger.&ZeroWidthSpace;resources | object | `{}` |  |
| purger.&ZeroWidthSpace;securityContext | object | `{}` |  |
| purger.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| purger.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| purger.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` |  |
| purger.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| purger.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| purger.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` |  |
| purger.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| purger.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| purger.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| purger.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `60` |  |
| purger.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| purger.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| purger.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| purger.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;initialDelaySeconds | int | `120` |  |
| purger.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;periodSeconds | int | `30` |  |
| purger.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| purger.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `60` |  |
| purger.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"querier"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| querier.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| querier.&ZeroWidthSpace;annotations | object | `{}` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` | Creates a HorizontalPodAutoscaler for the querier pods. |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;extraMetrics | list | `[]` | Optional custom and external metrics for the querier pods to scale on In order to use this option , define a list of of specific following https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics and https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `2` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetCPUUtilizationPercentage | int | `80` |  |
| querier.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `0` |  |
| querier.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| querier.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| querier.&ZeroWidthSpace;enabled | bool | `true` |  |
| querier.&ZeroWidthSpace;env | list | `[]` |  |
| querier.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| querier.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| querier.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| querier.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| querier.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| querier.&ZeroWidthSpace;initContainers | list | `[]` |  |
| querier.&ZeroWidthSpace;lifecycle | object | `{}` |  |
| querier.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| querier.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| querier.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `nil` |  |
| querier.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| querier.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| querier.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| querier.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| querier.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;replicas | int | `2` |  |
| querier.&ZeroWidthSpace;resources | object | `{}` |  |
| querier.&ZeroWidthSpace;securityContext | object | `{}` |  |
| querier.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| querier.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| querier.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| querier.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| querier.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| querier.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| querier.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| querier.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| querier.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| querier.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| querier.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| querier.&ZeroWidthSpace;tolerations | list | `[]` |  |
| querier.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"query-frontend"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| query_frontend.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| query_frontend.&ZeroWidthSpace;annotations | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| query_frontend.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| query_frontend.&ZeroWidthSpace;enabled | bool | `true` |  |
| query_frontend.&ZeroWidthSpace;env | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| query_frontend.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;initContainers | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;lifecycle | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_frontend.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `nil` |  |
| query_frontend.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| query_frontend.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| query_frontend.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| query_frontend.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_frontend.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;replicas | int | `2` |  |
| query_frontend.&ZeroWidthSpace;resources | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;securityContext | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| query_frontend.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_frontend.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_frontend.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| query_frontend.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| query_frontend.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| query_frontend.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| query_frontend.&ZeroWidthSpace;tolerations | list | `[]` |  |
| query_frontend.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;key | string | `"app.kubernetes.io/component"` |  |
| query_scheduler.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;operator | string | `"In"` |  |
| query_scheduler.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;labelSelector.&ZeroWidthSpace;matchExpressions[0].&ZeroWidthSpace;values[0] | string | `"query-scheduler"` |  |
| query_scheduler.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;podAffinityTerm.&ZeroWidthSpace;topologyKey | string | `"kubernetes.io/hostname"` |  |
| query_scheduler.&ZeroWidthSpace;affinity.&ZeroWidthSpace;podAntiAffinity.&ZeroWidthSpace;preferredDuringSchedulingIgnoredDuringExecution[0].&ZeroWidthSpace;weight | int | `100` |  |
| query_scheduler.&ZeroWidthSpace;annotations | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| query_scheduler.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| query_scheduler.&ZeroWidthSpace;enabled | bool | `false` | If true, querier and query-frontend will connect to it (requires Cortex v1.6.0+) https://cortexmetrics.io/docs/operations/scaling-query-frontend/#query-scheduler |
| query_scheduler.&ZeroWidthSpace;env | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| query_scheduler.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;initContainers | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;lifecycle | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_scheduler.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_scheduler.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `nil` |  |
| query_scheduler.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"http-metrics","prometheus.io/scrape":"true"}` | Pod Annotations |
| query_scheduler.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| query_scheduler.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| query_scheduler.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_scheduler.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_scheduler.&ZeroWidthSpace;replicas | int | `2` |  |
| query_scheduler.&ZeroWidthSpace;resources | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;securityContext | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| query_scheduler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| query_scheduler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| query_scheduler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| query_scheduler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| query_scheduler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| query_scheduler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| query_scheduler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| query_scheduler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| query_scheduler.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| query_scheduler.&ZeroWidthSpace;tolerations | list | `[]` |  |
| query_scheduler.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| ruler.&ZeroWidthSpace;affinity | object | `{}` |  |
| ruler.&ZeroWidthSpace;annotations | object | `{}` |  |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` | Creates a HorizontalPodAutoscaler for the ruler. |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;extraMetrics | list | `[]` | Optional custom and external metrics for the ruler pods to scale on In order to use this option , define a list of of specific following https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics and https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `2` |  |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetCPUUtilizationPercentage | int | `80` |  |
| ruler.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `80` |  |
| ruler.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| ruler.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| ruler.&ZeroWidthSpace;directories | object | `{}` | allow configuring rules via configmap. ref: https://cortexproject.github.io/cortex-helm-chart/guides/configure_rules_via_configmap.html |
| ruler.&ZeroWidthSpace;enabled | bool | `true` |  |
| ruler.&ZeroWidthSpace;env | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| ruler.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| ruler.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| ruler.&ZeroWidthSpace;initContainers | list | `[]` |  |
| ruler.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ruler.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| ruler.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| ruler.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ruler.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| ruler.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ruler.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;replicas | int | `1` |  |
| ruler.&ZeroWidthSpace;resources | object | `{}` |  |
| ruler.&ZeroWidthSpace;securityContext | object | `{}` |  |
| ruler.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| ruler.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| ruler.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
| ruler.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;relabelings | list | `[]` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;defaultFolderName | string | `""` | The default folder name, it will create a subfolder under the `folder` and put rules in there instead |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enableUniqueFilenames | bool | `false` | A value of true will produce unique filenames to avoid issues when duplicate data keys exist between ConfigMaps and/or Secrets within the same or multiple Namespaces. |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;enabled | bool | `false` | Enable sidecar that collect the configmaps with specified label and stores the included files them into the respective folders |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folder | string | `"/data/rules"` | Folder where the files should be placed. |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;folderAnnotation | string | `"k8s-sidecar-target-directory"` | The annotation the sidecar will look for in ConfigMaps and/or Secrets to override the destination folder for files. If the value is a relative path, it will be relative to FOLDER |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;repository | string | `"kiwigrid/k8s-sidecar"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;sha | string | `""` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;image.&ZeroWidthSpace;tag | string | `"1.19.5"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;imagePullPolicy | string | `"IfNotPresent"` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;label | string | `"cortex_rules"` | label that the configmaps with rules are marked with |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;labelValue | string | `""` | The value for the label you want to filter your resources on. Don't set a value to filter by any value |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;resource | string | `"both"` | The resource type that the operator will filter for. Can be configmap, secret or both |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;resources | object | `{}` |  |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;searchNamespace | string | `""` | The Namespace(s) from which resources will be watched. For multiple namespaces, use a comma-separated string like "default,test". If not set or set to ALL, it will watch all Namespaces. |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;skipTlsVerify | bool | `false` | Set to true to skip tls verification for kube api calls |
| ruler.&ZeroWidthSpace;sidecar.&ZeroWidthSpace;watchMethod | string | `""` | Determines how kopf-k8s-sidecar will run. If WATCH it will run like a normal operator forever. If LIST it will gather the matching configmaps and secrets currently present, write those files to the destination directory and die |
| ruler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;failureThreshold | int | `10` |  |
| ruler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| ruler.&ZeroWidthSpace;startupProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| ruler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxSurge | int | `0` |  |
| ruler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;rollingUpdate.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| ruler.&ZeroWidthSpace;strategy.&ZeroWidthSpace;type | string | `"RollingUpdate"` |  |
| ruler.&ZeroWidthSpace;terminationGracePeriodSeconds | int | `180` |  |
| ruler.&ZeroWidthSpace;tolerations | list | `[]` |  |
| ruler.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| ruler.&ZeroWidthSpace;validation.&ZeroWidthSpace;enabled | bool | `true` | Checks that the ruler is compatible with horizontal scaling, as documented in https://cortexmetrics.io/docs/guides/ruler-sharding/. You may need to disable this if your config is compatible, but not understood by the validator. |
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
| store_gateway.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;behavior | object | `{}` | Ref: https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-configurable-scaling-behavior |
| store_gateway.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;enabled | bool | `false` |  |
| store_gateway.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;extraMetrics | list | `[]` | Optional custom and external metrics for the store gateway pods to scale on In order to use this option , define a list of of specific following https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-multiple-metrics-and-custom-metrics and https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/#autoscaling-on-metrics-not-related-to-kubernetes-objects |
| store_gateway.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;maxReplicas | int | `30` |  |
| store_gateway.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;minReplicas | int | `3` |  |
| store_gateway.&ZeroWidthSpace;autoscaling.&ZeroWidthSpace;targetMemoryUtilizationPercentage | int | `80` |  |
| store_gateway.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;enabled | bool | `true` |  |
| store_gateway.&ZeroWidthSpace;containerSecurityContext.&ZeroWidthSpace;readOnlyRootFilesystem | bool | `true` |  |
| store_gateway.&ZeroWidthSpace;enabled | bool | `true` |  |
| store_gateway.&ZeroWidthSpace;env | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraArgs | object | `{}` | Additional Cortex container arguments, e.g. log.level (debug, info, warn, error) |
| store_gateway.&ZeroWidthSpace;extraContainers | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraPorts | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraVolumeMounts | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;extraVolumes | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;initContainers | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| store_gateway.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| store_gateway.&ZeroWidthSpace;livenessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;scheme | string | `"HTTP"` |  |
| store_gateway.&ZeroWidthSpace;nodeSelector | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;accessModes | list | `["ReadWriteOnce"]` | Store-gateway data Persistent Volume access modes Must match those of existing PV or dynamic provisioner Ref: http://kubernetes.io/docs/user-guide/persistent-volumes/ |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;annotations | object | `{}` | Store-gateway data Persistent Volume Claim annotations |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;enabled | bool | `true` | If true Store-gateway will create/use a Persistent Volume Claim If false, use emptyDir |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;size | string | `"2Gi"` | Store-gateway data Persistent Volume size |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;storageClass | string | `nil` | Store-gateway data Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is set, choosing the default provisioner. |
| store_gateway.&ZeroWidthSpace;persistentVolume.&ZeroWidthSpace;subPath | string | `""` | Subdirectory of Store-gateway data Persistent Volume to mount Useful if the volume's root directory is not empty |
| store_gateway.&ZeroWidthSpace;podAnnotations | object | `{"prometheus.io/port":"8080","prometheus.io/scrape":"true"}` | Pod Annotations |
| store_gateway.&ZeroWidthSpace;podDisruptionBudget.&ZeroWidthSpace;maxUnavailable | int | `1` |  |
| store_gateway.&ZeroWidthSpace;podLabels | object | `{}` | Pod Labels |
| store_gateway.&ZeroWidthSpace;podManagementPolicy | string | `"OrderedReady"` | https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#pod-management-policies |
| store_gateway.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;path | string | `"/ready"` |  |
| store_gateway.&ZeroWidthSpace;readinessProbe.&ZeroWidthSpace;httpGet.&ZeroWidthSpace;port | string | `"http-metrics"` |  |
| store_gateway.&ZeroWidthSpace;replicas | int | `1` |  |
| store_gateway.&ZeroWidthSpace;resources | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;securityContext | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;service.&ZeroWidthSpace;annotations | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;service.&ZeroWidthSpace;labels | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;serviceAccount.&ZeroWidthSpace;name | string | `""` | "" disables the individual serviceAccount and uses the global serviceAccount for that component |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;additionalLabels | object | `{}` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;enabled | bool | `false` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;extraEndpointSpec | object | `{}` | Additional endpoint configuration https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;metricRelabelings | list | `[]` |  |
| store_gateway.&ZeroWidthSpace;serviceMonitor.&ZeroWidthSpace;podTargetLabels | list | `[]` |  |
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
| store_gateway.&ZeroWidthSpace;topologySpreadConstraints | list | `[]` |  |
| useConfigMap | bool | `false` |  |
| useExternalConfig | bool | `false` |  |

