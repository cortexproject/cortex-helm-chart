{{/*
Create a fully qualified cortex-ruler name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex-ruler.fullname" -}}
{{- if .Values.ruler.fullnameOverride -}}
{{- .Values.ruler.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name "ruler" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name "ruler" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
cortex-ruler common labels
*/}}
{{- define "cortex-ruler.labels" -}}
{{ include "cortex-ruler.matchLabels" . }}
{{ include "cortex.metaLabels" . }}
{{- end -}}

{{/*
cortex-ruler selector labels
*/}}
{{- define "cortex-ruler.matchLabels" -}}
app.kubernetes.io/component: ruler
{{ include "cortex.matchLabels" . }}
{{- end -}}

{{/*
format rules dir
*/}}
{{- define "cortex-ruler.dirName" -}}
rules-{{ . | replace "_" "-" | trimSuffix "-" }}
{{- end }}
