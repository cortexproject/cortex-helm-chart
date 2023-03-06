
{{/*
purger fullname
*/}}
{{- define "cortex.purgerFullname" -}}
{{ include "cortex.fullname" . }}-purger
{{- end }}

{{/*
purger common labels
*/}}
{{- define "cortex.purgerLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: purger
{{- end }}

{{/*
purger selector labels
*/}}
{{- define "cortex.purgerSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: purger
{{- end }}
