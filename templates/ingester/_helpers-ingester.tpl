
{{/*
ingester fullname
*/}}
{{- define "cortex.ingesterFullname" -}}
{{ include "cortex.fullname" . }}-ingester
{{- end }}

{{/*
ingester common labels
*/}}
{{- define "cortex.ingesterLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: ingester
{{- end }}

{{/*
ingester selector labels
*/}}
{{- define "cortex.ingesterSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: ingester
{{- end }}
