
{{/*
auth-gateway fullname
*/}}
{{- define "cortex.authGatewayFullname" -}}
{{ include "cortex.fullname" . }}-auth-gateway
{{- end }}

{{/*
auth-gateway common labels
*/}}
{{- define "cortex.authGatewayLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: auth-gateway
{{- end }}

{{/*
auth-gateway selector labels
*/}}
{{- define "cortex.authGatewaySelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: auth-gateway
{{- end }}
