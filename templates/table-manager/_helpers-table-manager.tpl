
{{/*
table-manager fullname
*/}}
{{- define "cortex.tableManagerFullname" -}}
{{ include "cortex.fullname" . }}-table-manager
{{- end }}

{{/*
table-manager common labels
*/}}
{{- define "cortex.tableManagerLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: table-manager
{{- end }}

{{/*
table-manager selector labels
*/}}
{{- define "cortex.tableManagerSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: table-manager
{{- end }}
