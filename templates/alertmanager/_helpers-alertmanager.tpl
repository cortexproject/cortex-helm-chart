
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

{{/*
alertmanager cluster peer list
*/}}
{{- define "cortex.alertmanagerClusterPeerList" -}}
{{- $clusterPort := regexReplaceAll ".+[:]" (default "0.0.0.0:9094" .Values.config.alertmanager.cluster_bind_address) "" -}}
{{- $alertClusterPeerList := dict "peers" (list) -}}
{{- $cortexFullName := include "cortex.fullname" . -}}
{{- $alertmanagerFullName := include "cortex.alertmanagerFullname" . -}}
{{- range $n := until (.Values.alertmanager.replicas | int) }}
    {{- $noop := printf "%s-alertmanager-%d.%s-headless.%s.svc.%s:%s" $cortexFullName $n $alertmanagerFullName $.Release.Namespace $.Values.clusterDomain $clusterPort | append $alertClusterPeerList.peers | set $alertClusterPeerList "peers" -}}
{{- end -}}
{{- join "," $alertClusterPeerList.peers -}}
{{- end }}