
{{/*
query-frontend fullname
*/}}
{{- define "cortex.queryFrontendFullname" -}}
{{ include "cortex.fullname" . }}-query-frontend
{{- end }}

{{/*
query-frontend common labels
*/}}
{{- define "cortex.queryFrontendLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}

{{/*
query-frontend selector labels
*/}}
{{- define "cortex.queryFrontendSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: query-frontend
{{- end }}
