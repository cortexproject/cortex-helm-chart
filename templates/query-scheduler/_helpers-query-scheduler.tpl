
{{/*
query-scheduler fullname
*/}}
{{- define "cortex.querySchedulerFullname" -}}
{{ include "cortex.fullname" . }}-query-scheduler
{{- end }}

{{/*
query-scheduler common labels
*/}}
{{- define "cortex.querySchedulerLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: query-scheduler
{{- end }}

{{/*
query-scheduler selector labels
*/}}
{{- define "cortex.querySchedulerSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: query-scheduler
{{- end }}
