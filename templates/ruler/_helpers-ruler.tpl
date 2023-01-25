
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

{{/*
ruler config validation
Ref: https://cortexmetrics.io/docs/guides/ruler-sharding/
*/}}
{{- define "cortex.rulerValidation" -}}
{{- with .Values.ruler -}}
  {{- if .validation.enabled -}}
    {{- if or (gt (int .replicas) 1) .autoscaling.enabled -}}
      {{- with $.Values.config.ruler -}}
        {{- if not .enable_sharding -}}
          {{- fail "must enable_sharding to scale the ruler" -}}
        {{- end }}
        {{- if not ((.ring | default dict).kvstore | default dict).store -}}
          {{- fail "must configure kvstore to scale the ruler" -}}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
{{- end }}
