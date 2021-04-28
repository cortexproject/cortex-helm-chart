
{{/*
querier fullname
*/}}
{{- define "cortex.querierFullname" -}}
{{ include "cortex.fullname" . }}-querier
{{- end }}

{{/*
querier common labels
*/}}
{{- define "cortex.querierLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: querier
{{- end }}

{{/*
querier selector labels
*/}}
{{- define "cortex.querierSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: querier
{{- end }}
