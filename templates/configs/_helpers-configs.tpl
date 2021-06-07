
{{/*
configs fullname
*/}}
{{- define "cortex.configsFullname" -}}
{{ include "cortex.fullname" . }}-configs
{{- end }}

{{/*
configs common labels
*/}}
{{- define "cortex.configsLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: configs
{{- end }}

{{/*
configs selector labels
*/}}
{{- define "cortex.configsSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: configs
{{- end }}
