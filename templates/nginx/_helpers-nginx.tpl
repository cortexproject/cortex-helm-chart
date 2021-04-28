
{{/*
nginx fullname
*/}}
{{- define "cortex.nginxFullname" -}}
{{ include "cortex.fullname" . }}-nginx
{{- end }}

{{/*
nginx common labels
*/}}
{{- define "cortex.nginxLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: nginx
{{- end }}

{{/*
nginx selector labels
*/}}
{{- define "cortex.nginxSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: nginx
{{- end }}
