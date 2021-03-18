{{/*
Create a fully qualified nginx name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-nginx.fullname" -}}
{{- if .Values.nginx.fullnameOverride -}}
{{- .Values.nginx.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "nginx" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "nginx" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
cortex-nginx common labels
*/}}
{{- define "cortex-nginx.labels" -}}
{{ include "cortex-nginx.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-nginx selector labels
*/}}
{{- define "cortex-nginx.matchLabels" -}}
app.kubernetes.io/component: nginx
{{ include "cortex.matchLabels" . }}
{{- end -}}
