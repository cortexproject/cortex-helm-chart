
{{/*
store-gateway fullname
*/}}
{{- define "cortex.storeGatewayFullname" -}}
{{ include "cortex.fullname" . }}-store-gateway
{{- end }}

{{/*
store-gateway common labels
*/}}
{{- define "cortex.storeGatewayLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}

{{/*
store-gateway selector labels
*/}}
{{- define "cortex.storeGatewaySelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: store-gateway
{{- end }}
