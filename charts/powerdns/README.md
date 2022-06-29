# powerdns

![Version: 5.0.1](https://img.shields.io/badge/Version-5.0.1-informational?style=flat-square) ![AppVersion: v4.6.1](https://img.shields.io/badge/AppVersion-v4.6.1-informational?style=flat-square)

PowerDNS is a DNS server, written in C++ and licensed under the GPL. It runs on most Unix derivatives. PowerDNS features a large number of different backends ranging from simple BIND style zonefiles to relational databases and load balancing/failover algorithms. A DNS recursor is provided as a separate program.

**This chart has been forked from https://github.com/k8s-at-home/charts as it is no longer maintained by the origional authors**

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/jarretlavallee/helm-charts/issues/new)**

## Source Code

* <http://www.github.com/PowerDNS/>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 10.5.1 |
| https://charts.bitnami.com/bitnami | postgresql | 10.16.2 |

## TL;DR

```console
helm repo add jarretlavallee https://jarretlavallee.github.io/helm-charts/
helm repo update
helm install powerdns jarretlavallee/powerdns
```

## Installing the Chart

To install the chart with the release name `powerdns`

```console
helm install powerdns jarretlavallee/powerdns
```

## Uninstalling the Chart

To uninstall the `powerdns` deployment

```console
helm uninstall powerdns
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common/values.yaml) from the [common library](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install powerdns \
  --set env.TZ="America/New York" \
    jarretlavallee/powerdns
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install powerdns jarretlavallee/powerdns -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/romracer/docker-powerdns"` |  |
| image.tag | string | `"4.6.1"` |  |
| imagePullSecrets | list | `[]` |  |
| mariadb | object | `{"architecture":"standalone","auth":{"database":"pdns","password":"pdns-pass","rootPassword":"pdnsrootpass","username":"pdns"},"enabled":false,"primary":{"persistence":{"enabled":false}}}` |  ... for more options see https://github.com/bitnami/charts/tree/master/bitnami/mariadb |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql | object | `{"enabled":true,"persistence":{"enabled":false},"postgresqlDatabase":"pdns","postgresqlPassword":"pdnspass","postgresqlPostgresPassword":"pdnsadminpass","postgresqlUsername":"pdns"}` |  ... for more options see https://github.com/bitnami/charts/tree/master/bitnami/postgresql |
| powerdns.additionalEnv | list | `[]` |  |
| powerdns.config | object | `{default-soa-content: "ns1.@ hostmaster.@ 0 10801 3601 604801 1201"}` |  |
| powerdns.dnssec | bool | `true` |  |
| powerdns.domain | string | `"mydomain.local"` |  |
| powerdns.mysql.database | string | `"pdns"` |  |
| powerdns.mysql.password | string | `"pdnspass"` |  |
| powerdns.mysql.username | string | `"pdns"` |  |
| powerdns.postgres.database | string | `"pdns"` |  |
| powerdns.postgres.password | string | `"pdnspass"` |  |
| powerdns.postgres.username | string | `"pdns"` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.initialDelaySeconds | int | `30` |  |
| probes.liveness.timeoutSeconds | int | `10` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.initialDelaySeconds | int | `30` |  |
| probes.readiness.timeoutSeconds | int | `10` |  |
| probes.startup.enabled | bool | `false` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.periodSeconds | int | `10` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.externalTrafficPolicy | string | `""` |  |
| service.port | int | `53` |  |
| service.type | string | `"ClusterIP"` |  |
| service.annotations | object | `{}` | Default service annotations |
| service.tcp.annotations | object | `{}` |  |
| service.udp.annotations | object | `{}` |  |
| service.webserver.annotations | object | `{}` |  |
| service.webserver.port | int | `8081` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  If not set and create is true, a name is generated using the fullname template |
| strategyType | string | `"Recreate"` |  |
| tolerations | list | `[]` |  |

## Changelog

### Version 5.0.1

- Forked from [k8s-at-home](https://github.com/k8s-at-home/charts) for new ownership.
- Changed the image repository to ghcr.io/romracer/docker-powerdns
- Increased the application version to 4.6.1
- Added `default-soa-content` to the default config
- Added individual annotations for the services
- Added a port configuration for the webserver service

### Version 4.1.2

#### Added

N/A

#### Changed

* Upgraded `mariadb` chart dependency to version 10.5.1

#### Fixed

N/A

### Older versions

A historical overview of changes can be found on [ArtifactHUB](https://artifacthub.io/packages/helm/k8s-at-home/powerdns?modal=changelog)

## Support

- See the [Docs](https://docs.k8s-at-home.com/our-helm-charts/getting-started/)
- Open an [issue](https://github.com/k8s-at-home/charts/issues/new/choose)
- Ask a [question](https://github.com/k8s-at-home/organization/discussions)
- Join our [Discord](https://discord.gg/sTMX7Vh) community

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
