{{/*
Create a fully qualified cortex-compactor name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-compactor.fullname" -}}
{{- if .Values.compactor.fullnameOverride -}}
{{- .Values.compactor.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "compactor" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "compactor" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
cortex-compactor common labels
*/}}
{{- define "cortex-compactor.labels" -}}
{{ include "cortex-compactor.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-compactor selector labels
*/}}
{{- define "cortex-compactor.matchLabels" -}}
app.kubernetes.io/component: compactor
{{ include "cortex.matchLabels" . }}
{{- end -}}
