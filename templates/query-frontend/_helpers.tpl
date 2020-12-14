{{/*
Create a fully qualified query-frontend name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-query-frontend.fullname" -}}
{{- if .Values.query_frontend.fullnameOverride -}}
{{- .Values.query_frontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "query-frontend" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "query-frontend" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a headless qualified query-frontend service name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-query-frontend.headlessname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "query-frontend-headless" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "query-frontend-headless" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
cortex-query-frontend common labels
*/}}
{{- define "cortex-query-frontend.labels" -}}
{{ include "cortex-query-frontend.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-query-frontend selector labels
*/}}
{{- define "cortex-query-frontend.matchLabels" -}}
app.kubernetes.io/component: query-frontend
{{ include "cortex.matchLabels" . }}
{{- end -}}
