
{{/*
monolith fullname
*/}}
{{- define "cortex.monolithFullname" -}}
{{ include "cortex.fullname" . }}-monolith
{{- end }}

{{/*
monolith common labels
*/}}
{{- define "cortex.monolithLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: monolith
{{- end }}

{{/*
monolith selector labels
*/}}
{{- define "cortex.monolithSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: monolith
{{- end }}
