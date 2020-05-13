{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cd4pe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cd4pe.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cd4pe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cd4pe.labels" -}}
helm.sh/chart: {{ include "cd4pe.chart" . }}
{{ include "cd4pe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cd4pe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cd4pe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
  {{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the postgresql hostname
*/}}
{{- define "cd4pe.dbHost" -}}
  {{- printf "%s" (include "postgresql.fullname" .) -}}
{{- end -}}

{{/*
Return the postgresql port
*/}}
{{- define "cd4pe.dbPort" -}}
  {{- printf "5432" -}}
{{- end -}}

{{/*
Return the postgresql database name
*/}}
{{- define "cd4pe.dbName" -}}
  {{- printf "%s" .Values.postgresql.postgresqlDatabase -}}
{{- end -}}

{{/*
Return the postgresql user
*/}}
{{- define "cd4pe.dbUser" -}}
  {{- printf "%s" .Values.postgresql.postgresqlUsername -}}
{{- end -}}

{{/*
Return the postgresql secret name
*/}}
{{- define "cd4pe.dbSecretName" -}}
  {{- printf "%s" (include "postgresql.fullname" .) -}}
{{- end -}}