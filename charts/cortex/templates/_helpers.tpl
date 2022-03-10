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
Create a default fully qualified memberlist service name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.memberlistname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "memberlist" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "memberlist" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified configmap name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.configname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "config" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "config" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified runtime configmap name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.runtimeconfigname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "runtime-config" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "runtime-config" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cortex.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cortex.labels" -}}
{{ include "cortex.metaLabels" . }}
{{ include "cortex.matchLabels" . }}
{{- end }}

{{/*
Meta labels
*/}}
{{- define "cortex.metaLabels" -}}
helm.sh/chart: {{ include "cortex.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cortex.matchLabels" -}}
app.kubernetes.io/name: {{ include "cortex.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

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
Resolve the actual image tag to use.
*/}}
{{- define "cortex.imageTag" -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag -}}
{{- $tag -}}
{{- end }}

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
Create configuration parameters for memcached configuration
*/}}
{{- define "cortex.memcached" -}}
{{- if and (eq .Values.config.storage.engine "blocks") (index .Values "tags" "blocks-storage-memcached") }}
- "-blocks-storage.bucket-store.index-cache.backend=memcached"
- "-blocks-storage.bucket-store.index-cache.memcached.addresses=dnssrvnoa+_memcache._tcp.{{ template "cortex.fullname" . }}-memcached-index.{{ .Release.Namespace }}.svc:11211"
- "-blocks-storage.bucket-store.chunks-cache.backend=memcached"
- "-blocks-storage.bucket-store.chunks-cache.memcached.addresses=dns+{{ template "cortex.fullname" . }}-memcached-chunks:11211"
- "-blocks-storage.bucket-store.metadata-cache.backend=memcached"
- "-blocks-storage.bucket-store.metadata-cache.memcached.addresses=dns+{{ template "cortex.fullname" . }}-memcached-metadata:11211"
{{- end -}}
{{- if and (ne .Values.config.storage.engine "blocks") .Values.memcached.enabled }}
- -store.chunks-cache.memcached.addresses=dns+{{ template "cortex.fullname" . }}-memcached:11211
{{- end -}}
{{- if and (ne .Values.config.storage.engine "blocks") (index .Values "memcached-index-read" "enabled") }}
- -store.index-cache-read.memcached.addresses=dns+{{ template "cortex.fullname" . }}-memcached-index-read:11211
{{- end -}}
{{- if and (ne .Values.config.storage.engine "blocks") (index .Values "memcached-index-write" "enabled") }}
- -store.index-cache-write.memcached.addresses=dns+{{ template "cortex.fullname" . }}-memcached-index-write:11211
{{- end -}}
{{- end -}}

{{/*
Create configuration for frontend memcached configuration
*/}}
{{- define "cortex.frontend-memcached" -}}
{{- if index .Values "memcached-frontend" "enabled" }}
- "-frontend.memcached.addresses=dns+{{ template "cortex.fullname" . }}-memcached-frontend:11211"
{{- end -}}
{{- end -}}

{{/*
Determine the policy api version
*/}}
{{- define "cortex.pdbVersion" -}}
{{- if or (.Capabilities.APIVersions.Has "policy/v1/PodDisruptionBudget") (semverCompare ">=1.21" .Capabilities.KubeVersion.Version) -}}
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
    name: {{ template "cortex.configname" . }}
  {{- else }}
  secret:
    secretName: {{ template "cortex.fullname" . }}
  {{- end }}
{{- end -}}
