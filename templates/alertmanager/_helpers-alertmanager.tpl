
{{/*
alertmanager fullname
*/}}
{{- define "cortex.alertmanagerFullname" -}}
{{ include "cortex.fullname" . }}-alertmanager
{{- end }}

{{/*
alertmanager common labels
*/}}
{{- define "cortex.alertmanagerLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: alertmanager
{{- end }}

{{/*
alertmanager selector labels
*/}}
{{- define "cortex.alertmanagerSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: alertmanager
{{- end }}
