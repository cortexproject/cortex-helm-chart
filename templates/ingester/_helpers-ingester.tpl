
{{/*
ingester fullname
*/}}
{{- define "cortex.ingesterFullname" -}}
{{ include "cortex.fullname" . }}-ingester
{{- end }}

{{/*
ingester common labels
*/}}
{{- define "cortex.ingesterLabels" -}}
{{ include "cortex.labels" . }}
app.kubernetes.io/component: ingester
{{- end }}

{{/*
ingester selector labels
*/}}
{{- define "cortex.ingesterSelectorLabels" -}}
{{ include "cortex.selectorLabels" . }}
app.kubernetes.io/component: ingester
{{- end }}

{{/*
*/}}
{{- define "cortex.ingesterZoneAwareReplicationMap" -}}
{{- $zoneMap := dict }}
{{- range $zone := .Values.ingester.zoneAwareReplication.zones }}
{{- $_ := set $zone "stsSuffix" (printf "-%s" $zone.name) }}
{{- $zoneMap := set $zoneMap $zone.name $zone }}
{{- end }}
{{- if or (not .Values.ingester.zoneAwareReplication.enabled) (and .Values.ingester.zoneAwareReplication.enabled .Values.ingester.zoneAwareReplication.migration) }}
{{- $defaultZone := dict "stsSuffix" "" "name" "default" "nodeSelector" .Values.ingester.nodeSelector "replicas" .Values.ingester.replicas }}
{{- $zoneMap := set $zoneMap "default" $defaultZone }}
{{- end }}
{{- toYaml $zoneMap }}
{{- end }}
