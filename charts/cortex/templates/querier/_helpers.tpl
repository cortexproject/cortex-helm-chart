{{/*
Create a fully qualified querier name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-querier.fullname" -}}
{{- if .Values.querier.fullnameOverride -}}
{{- .Values.querier.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "querier" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "querier" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
cortex-querier common labels
*/}}
{{- define "cortex-querier.labels" -}}
{{ include "cortex-querier.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-querier selector labels
*/}}
{{- define "cortex-querier.matchLabels" -}}
app.kubernetes.io/component: querier
{{ include "cortex.matchLabels" . }}
{{- end -}}
