{{/*
Create a fully qualified cortex-store-gateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-store-gateway.fullname" -}}
{{- if .Values.store_gateway.fullnameOverride -}}
{{- .Values.store_gateway.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "store-gateway" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "store-gateway" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a headless qualified store-gateway service name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-store-gateway.headlessname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "store-gateway-headless" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "store-gateway-headless" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
cortex-store-gateway common labels
*/}}
{{- define "cortex-store-gateway.labels" -}}
{{ include "cortex-store-gateway.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-store-gateway selector labels
*/}}
{{- define "cortex-store-gateway.matchLabels" -}}
app.kubernetes.io/component: store-gateway
{{ include "cortex.matchLabels" . }}
{{- end -}}
