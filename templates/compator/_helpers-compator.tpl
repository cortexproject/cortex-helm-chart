
{{/*
compator fullname
*/}}
{{- define "cortex.compatorFullname" -}}
{{ include "cortex.fullname" . }}-compator
{{- end }}

{{/*
compator common labels
*/}}
{{- define "cortex.compatorLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: compator
{{- end }}

{{/*
compator selector labels
*/}}
{{- define "cortex.compatorSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: compator
{{- end }}
