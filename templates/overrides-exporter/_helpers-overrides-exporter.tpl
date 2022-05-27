
{{/*
overrides-exporter fullname
*/}}
{{- define "cortex.overridesExporterFullname" -}}
{{ include "cortex.fullname" . }}-overrides-exporter
{{- end }}

{{/*
overrides-exporter common labels
*/}}
{{- define "cortex.overridesExporterLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: overrides-exporter
{{- end }}

{{/*
overrides-exporter selector labels
*/}}
{{- define "cortex.overridesExporterSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: overrides-exporter
{{- end }}
