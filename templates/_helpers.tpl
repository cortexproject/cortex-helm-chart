{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cortex.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cortex.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cortex.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account
*/}}
{{- define "cortex.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "cortex.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the app name of cortex clients. Defaults to the same logic as "cortex.fullname", and default client expects "prometheus".
*/}}
{{- define "client.name" -}}
{{- if .Values.client.name -}}
{{- .Values.client.name -}}
{{- else if .Values.client.fullnameOverride -}}
{{- .Values.client.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "prometheus" .Values.client.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Common labels
*/}}
{{- define "cortex.labels" -}}
helm.sh/chart: {{ include "cortex.chart" . }}
{{ include "cortex.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cortex.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cortex.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create configuration parameters for memcached configuration
*/}}
{{- define "cortex.memcached" -}}
{{- if index .Values "memcached-blocks-index" "enabled" }}
- "-blocks-storage.bucket-store.index-cache.backend=memcached"
- "-blocks-storage.bucket-store.index-cache.memcached.addresses=dns+{{ .Release.Name }}-memcached-blocks-index.{{ .Release.Namespace }}.svc.{{ .Values.clusterDomain }}:11211"
{{- end -}}
{{- if index .Values "memcached-blocks" "enabled" }}
- "-blocks-storage.bucket-store.chunks-cache.backend=memcached"
- "-blocks-storage.bucket-store.chunks-cache.memcached.addresses=dns+{{ .Release.Name }}-memcached-blocks.{{ .Release.Namespace }}.svc.{{ .Values.clusterDomain }}:11211"
{{- end -}}
{{- if index .Values "memcached-blocks-metadata" "enabled" }}
- "-blocks-storage.bucket-store.metadata-cache.backend=memcached"
- "-blocks-storage.bucket-store.metadata-cache.memcached.addresses=dns+{{ .Release.Name }}-memcached-blocks-metadata.{{ .Release.Namespace }}.svc.{{ .Values.clusterDomain }}:11211"
{{- end -}}
{{- end -}}

{{/*
Create configuration for frontend memcached configuration
*/}}
{{- define "cortex.frontend-memcached" -}}
{{- if index .Values "memcached-frontend" "enabled" }}
- "-frontend.memcached.addresses=dns+{{ .Release.Name }}-memcached-frontend.{{ .Release.Namespace }}.svc.{{ .Values.clusterDomain }}:11211"
{{- end -}}
{{- end -}}

{{/*
Determine the policy api version
*/}}
{{- define "cortex.pdbVersion" -}}
{{- if or (.Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget") (semverCompare ">=1.21-0" .Capabilities.KubeVersion.Version) -}}
policy/v1
{{- else -}}
policy/v1beta1
{{- end -}}
{{- end -}}

{{/*
Get checksum of config secret or configMap
*/}}
{{- define "cortex.configChecksum" -}}
{{- if .Values.useExternalConfig -}}
{{- .Values.externalConfigVersion -}}
{{- else if .Values.useConfigMap -}}
{{- include (print $.Template.BasePath "/configmap.yaml") . | sha256sum -}}
{{- else -}}
{{- include (print $.Template.BasePath "/secret.yaml") . | sha256sum -}}
{{- end -}}
{{- end -}}

{{/*
Get volume of config secret of configMap
*/}}
{{- define "cortex.configVolume" -}}
- name: config
  {{- if .Values.useExternalConfig }}
  secret:
    secretName: {{ .Values.externalConfigSecretName }}
  {{- else if .Values.useConfigMap }}
  configMap:
    name: {{ template "cortex.fullname" . }}-config
  {{- else }}
  secret:
    secretName: {{ template "cortex.fullname" . }}
  {{- end }}
{{- end -}}

{{/*
Get cortex hpa version by k8s version
*/}}
{{- define "cortex.hpaVersion" -}}
{{- if or (.Capabilities.APIVersions.Has "autoscaling/v2/HorizontalPodAutoscaler") (semverCompare ">=1.23-0" .Capabilities.KubeVersion.Version) -}}
autoscaling/v2
{{- else -}}
autoscaling/v2beta2
{{- end -}}
{{- end -}}
