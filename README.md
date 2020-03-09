# Introduction

Repository for the [Cortex](https://github.com/cortexproject/cortex) Helm chart.
Follow the instructions below to install/upgrade Cortex in your Kubernetes cluster
after cloning this repository.

## Installation

Cortex can be installed in your Kubernetes cluster using the following command:

```bash
  helm install cortex --name cortex --namespace cortex <path-to-cortex-helm-chart>
```

or if you have custom options or values you want to override:

```bash
  helm install cortex --name cortex --namespace cortex -f my-cortex-values.yaml <path-to-cortex-helm-chart>
```

As part of this chart many different pods and services are installed which all
have varying resource requirements. Please make sure that you have sufficient
resources (CPU/memory) available in your cluster before installing Cortex Helm
chart.

Additionally, the default chart installation expects Cortex pods to be deployed
on nodes with taints "dedicated=cortex" and memcached pods on nodes with taints
"dedicated=cortex-memcached". Additonally, Cortex pods have node affinity for
nodes which match the expression "dedicated=cortex" and mamcached pods have
affinity for "dedicated=cortex-memcached" nodes.

## Upgrades

To upgrade Cortex use the following command:

```bash
  helm upgrade cortex -f my-cortex-values.yaml <path-to-cortex-helm-chart>
```

