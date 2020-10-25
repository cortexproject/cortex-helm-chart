# Changelog

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
