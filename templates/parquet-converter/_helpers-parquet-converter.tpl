
{{/*
parquet-converter fullname
*/}}
{{- define "cortex.parquetConverterFullname" -}}
{{ include "cortex.fullname" . }}-parquet-converter
{{- end }}

{{/*
parquet-converter common labels
*/}}
{{- define "cortex.parquetConverterLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: parquet-converter
{{- end }}

{{/*
parquet-converter selector labels
*/}}
{{- define "cortex.parquetConverterSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: parquet-converter
{{- end }}
