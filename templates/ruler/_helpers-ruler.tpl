
{{/*
ruler fullname
*/}}
{{- define "cortex.rulerFullname" -}}
{{ include "cortex.fullname" . }}-ruler
{{- end }}

{{/*
ruler common labels
*/}}
{{- define "cortex.rulerLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
ruler selector labels
*/}}
{{- define "cortex.rulerSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: ruler
{{- end }}

{{/*
format rules dir
*/}}
{{- define "cortex.rulerRulesDirName" -}}
rules-{{ . | replace "_" "-" | trimSuffix "-" }}
{{- end }}
