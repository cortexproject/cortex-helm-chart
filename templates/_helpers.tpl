{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Create the cortex arguments for table config
*/}}
{{- define "cortex.tableargs" -}}
{{ range $name, $cfg := .Values.dynamodb.tableConfigs -}}
- -dynamodb.{{ $name }}-table.prefix={{ $cfg.prefix }}
- -dynamodb.{{ $name }}-table.tag={{ $cfg.tag }}
- -dynamodb.{{ $name }}-table.from={{ $cfg.from }}
- -dynamodb.{{ $name }}-table.period={{ $cfg.period }}
{{ end -}}
- -dynamodb.v6-schema-from={{.Values.dynamodb.v6SchemaFrom}}
- -dynamodb.v9-schema-from={{.Values.dynamodb.v9SchemaFrom}}
- -dynamodb.use-periodic-tables
{{- end -}}

{{/* Pre-calculate name used in memcached subchart */}}
{{- define "cortex.memcachedArgs" -}}
- -memcached.hostname={{ .Release.Name }}-memcached.{{ .Release.Namespace }}.svc.cluster.local
- -memcached.timeout=100ms
- -memcached.service=memcache # Service port name
- -memcached.timeout=500ms
{{- end -}}

{{- define "cortex.storeIndexMemcachedArgs" -}}
- -store.index-cache-write.memcached.hostname={{ .Release.Name }}-memcached-index-write.{{ .Release.Namespace }}.svc.cluster.local
- -store.index-cache-write.memcached.service=memcache # Service port name
- -store.index-cache-write.memcached.timeout=500ms
- -store.index-cache-read.memcached.hostname={{ .Release.Name }}-memcached-index-read.{{ .Release.Namespace }}.svc.cluster.local
- -store.index-cache-read.memcached.service=memcache # Service port name
- -store.index-cache-read.memcached.timeout=500ms
{{- end -}}
