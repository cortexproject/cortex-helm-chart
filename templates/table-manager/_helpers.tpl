{{/*
Create a fully qualified cortex-table-manager name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-table-manager.fullname" -}}
{{- if .Values.table_manager.fullnameOverride -}}
{{- .Values.table_manager.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "table-manager" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "table-manager" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
cortex-table-manager common labels
*/}}
{{- define "cortex-table-manager.labels" -}}
{{ include "cortex-table-manager.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-table-manager selector labels
*/}}
{{- define "cortex-table-manager.matchLabels" -}}
app.kubernetes.io/component: table-manager
{{ include "cortex.matchLabels" . }}
{{- end -}}
