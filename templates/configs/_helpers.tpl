{{/*
Create a fully qualified cortex-configs name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-configs.fullname" -}}
{{- if .Values.configs.fullnameOverride -}}
{{- .Values.configs.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "configs" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "configs" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
cortex-configs common labels
*/}}
{{- define "cortex-configs.labels" -}}
{{ include "cortex-configs.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-configs selector labels
*/}}
{{- define "cortex-configs.matchLabels" -}}
app.kubernetes.io/component: configs
{{ include "cortex.matchLabels" . }}
{{- end -}}
