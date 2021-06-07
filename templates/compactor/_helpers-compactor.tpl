
{{/*
compactor fullname
*/}}
{{- define "cortex.compactorFullname" -}}
{{ include "cortex.fullname" . }}-compactor
{{- end }}

{{/*
compactor common labels
*/}}
{{- define "cortex.compactorLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: compactor
{{- end }}

{{/*
compactor selector labels
*/}}
{{- define "cortex.compactorSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: compactor
{{- end }}
