# Changelog

## master / unreleased
* [CHANGE] Removed dnssrvnoa resolution from block memcached (probably oversight) and moved back to simple dns resolution #164
* [ENHANCEMENT] Enable/Disable security & container security context #158
* [BUGFIX] Fixed the default label used in pod affinity expression #162
* [BUGFIX] Fix label and annotation overrides for services (thanks @kwangil-ha) #164

* [FEATURE] Support dynamic configuration of Ruler and AlertManager using sidecar #150
## 0.5.0 / 2021-06-08

* [CHANGE] **Labels has been updated to latest best practices**. This means that **you cannot do a rolling update from an older version of this chart**. Either change the labels of your existing deployment by hand to make the transition as seamless as possible or uninstall the old release and install the new release with a short downtime. #144
* [CHANGE] Minimum Kubernetes Version of this Chart is now 1.19 #144
* [CHANGE] A new dedicated service is now available for the memberlist. Check `config.memberlist.join_members` in the default `values.yaml` for more information. #144
* [CHANGE] Ingress is now disabled by default. You can re-enable it by setting `ingress.enabled` to `true` #144
* [CHANGE] Configs is now disabled by default. You can re-enable it by setting `configs.enabled` to `true` #144
* [CHANGE] PodDisruptionBudget is now enabled by default for all microservices once you have more than 1 replicas #144
* [ENHANCEMENT] startupProbe has been added to all Pods and the default values for `livenessProbe` and `readinessProbe` has been adjusted #144
* [ENHANCEMENT] You can now disable the alertmanager and ruler deployment by setting `ruler.enabled` or `alertmanager.enabled` to `false` #144
* [ENHANCEMENT] Rules for the ruler can now be provisioned via values. Check `ruler.directories` in the default `values.yaml` for more information. #144
* [ENHANCEMENT] Expose `client_max_body_size` config for nginx max request body size #137
* [ENHANCEMENT] Adding option to add custom headers (ex. X-Scope-OrgID) to NGINX from values.yaml (key `nginx.config.setHeaders`). #127
* [ENHANCEMENT] Headless service for distributor to allow GRPC load balancing #148
* [BUGFIX] Fixed `priorityClassName` in alertmanager deployment configuration. #155
* [BUGFIX] Replacing deprecated (in Cortex 1.9) configuration with appropriate replacements (max_look_back_period -> max_query_lookback & compress_responses -> response_compression_enabled). #154
* [BUGFIX] Added missing ServiceMonitors `additionalLabels` placeholders in `values.yaml`. #146

## 0.4.1 / 2021-03-22

* [BUGFIX] Fix dependencies in charts dir to reflect recent update in 0.4.0 #139

## 0.4.0 / 2021-03-01

* [CHANGE] Resource requests and limits have been removed from the values.yaml file. The default resources assigned will be based on the particular k8s cluster configuration, if they are not overridden. #112
* [CHANGE] Change memcached chart references from deprecated stable repo to bitnami source. #124
* [BUGFIX] Corrected structural issues found in ingress resource yaml for kube versions 1.19+. #112

## 0.3.0 / 2021-01-21

* [ENHANCEMENT] Expose new HTTP API paths for remote-write and Query frontend to nginx #103
* [ENHANCEMENT] Compactor service is no longer created if compactor is disabled. #82
* [ENHANCEMENT] Headless service for alert manager is only enabled when the alert manager is deployed as a stateful set. #91
* [ENHANCEMENT] Improved memcached configuration template, with support for both chunks & block storage caches. #92
* [ENHANCEMENT] Update apiVersion: networking.k8s.io/v1beta1 -> networking.k8s.io/v1 for Kubernetes versions 1.19+  #94
* [ENHANCEMENT] Service Monitors and Compactor Service #68, #80
* [ENHANCEMENT] Updated default replication factor to match documentation #102
* [BUGFIX] Update repository URL for memcache dependency charts. #96
* [BUGFIX] nginx config using non-default clusterDomain #78
* [BUGFIX] Add cluster DNS domain value #63
* [BUGFIX] Fix grpc port for querier #71

## 0.2.0 / 2020-10-25

* [FEATURE] Add support for Blocks storage backend of Cortex. #52
* [ENHANCEMENT] Adding dnsResolver option to nginx.config. #28
* [ENHANCEMENT] Supporting externally managed Cortex Config. #31
* [ENHANCEMENT] Enabling NGINX deployment to be optional. #32
* [ENHANCEMENT] Adding option to deploy ingester as StatefulSet. #46
* [ENHANCEMENT] Adding ability to run alertmanager as StatefulSet. #54
* [ENHANCEMENT] Updating README.MD with values.yaml defaults, adding alertmanager paths to nginx. #57
* [BUGFIX] Updating query frontend headless service to publish its address when not ready, to fix issue with queriers not becoming ready due to not finding any frontend addresses. #34
* [BUGFIX] Fixed invalid config template. #40
* [BUGFIX] Correct & add consistent target labels on components. #48
* [BUGFIX] Fix values file duplicate config.storage section of Cortex config. #51
* [BUGFIX] Add GRPC ports to store gateway pods and service. #52
* [BUGFIX] Fix service ports, fix ruler endpoint for configs and alertmanager. #55
