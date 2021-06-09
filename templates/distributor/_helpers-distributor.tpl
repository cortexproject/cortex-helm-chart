
{{/*
distributor fullname
*/}}
{{- define "cortex.distributorFullname" -}}
{{ include "cortex.fullname" . }}-distributor
{{- end }}

{{/*
distributor common labels
*/}}
{{- define "cortex.distributorLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: distributor
{{- end }}

{{/*
distributor selector labels
*/}}
{{- define "cortex.distributorSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: distributor
{{- end }}
