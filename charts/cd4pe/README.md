# Puppet CD4PE Helm Chart

CD4PE with PostgreSQL for a deployment in a lab. This is not suited for production and has not been tested.

[CD4PE](https://puppet.com/docs/continuous-delivery/latest/cd_user_guide.html) is a Puppet Enterprise extension that allows for continuous delivery of Puppet code.

## TL;DR;

Supported for Helm v3

\#TODO add installation instructions.

```bash
helm install cd4pe
```

## Introduction

This chart bootstraps a lab instance of [CD4PE](hhttps://puppet.com/docs/continuous-delivery/latest/cd_user_guide.html) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. It does not include any Puppet Enterprise installation or build hardware.

## Prerequisites

-   Kubernetes 1.8+
-   PV provisioner for persistence.

## Installing the Chart

To install the chart with the release name `my-release`:

\#TODO add installation instructions.

```bash
helm install --name my-release
```

The command deploys CD4PE on the Kubernetes cluster with the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Delete the Chart

To delete the `my-release` deployment:

```bash
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the CD4PE chart and their default values.

| Parameter                          | Description                                                             | Default                                                                                                                             |
| ---------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `analytics`                        | To enable or disable the CD4PE anayltics                                | `"false"`                                                                                                                           |
| `dbHost`                           | Hostname of the PostgreSQL server                                       | This can be used to enable an external PostgreSQL instance. It defaults to using the postgresql chart with the `postgresql` options |
| `dbPort`                           | Port of the PostgreSQL server                                           | This can be used to enable an external PostgreSQL instance. It defaults to using the postgresql chart with the `postgresql` options |
| `dbName`                           | Database name on the PostgreSQL server                                  | This can be used to enable an external PostgreSQL instance. It defaults to using the postgresql chart with the `postgresql` options |
| `dbUser`                           | Database user on the PostgreSQL server                                  | This can be used to enable an external PostgreSQL instance. It defaults to using the postgresql chart with the `postgresql` options |
| `dbPasswordSecret`                 | Secret containing the password of the `dbUser`                          | This can be used to enable an external PostgreSQL instance. It defaults to using the postgresql chart with the `postgresql` options |
| `dbPasswordSecretKey`              | Secret key name containing the password of the `dbUser`                 | This can be used to enable an external PostgreSQL instance. It defaults to using the postgresql chart with the `postgresql` options |
| `uniqueId`                         | The PFI Secret Key used in CD4PE                                        | A random 16 character string base64 encoded                                                                                         |
| `uniqueIdSecret`                   | The Secret containing the PFI Secret Key                                | `nil` Overrides `uniqueId`                                                                                                          |
| `uniqueIdSecretKey`                | The Secret key name containing the PFI Secret Key                       | `nil` Overrides `uniqueId`                                                                                                          |
| `secret.annotations`               | Annotations that are applied to the secret generated to hold `uniqueId` | `['helm.sh/hook: pre-install', 'helm.sh/hook-delete-policy: before-hook-creation']`                                                 |
| `service.type`                     | The service type                                                        | `ClusterIP`                                                                                                                         |
| `service.loadBalancerIP`           | An optional loadBalancerIP                                              | `nil`                                                                                                                               |
| `service.loadBalancerSourceRanges` | Optional loadBalancerSourceRanges                                       | `nil`                                                                                                                               |
| `service.annotations`              | Annotations for the service                                             | `{}`                                                                                                                                |
| `service.ports`                    | Ports for the service                                                   | See the `values.yaml`. Default includes `80`,`443`,`8000`, and `7000`                                                               |
| `ingress.enabled`                  | To add an ingress                                                       | `false`                                                                                                                             |
| `ingress.annotations`              | Annotations for the ingress                                             | `{}`                                                                                                                                |
| `ingress.hosts`                    | Ingress host options                                                    | `[{hosts: chart-example.local, paths: []}]`                                                                                         |
| `ingress.tls`                      | Ingress TLS options                                                     | `[]`                                                                                                                                |
| `persistence.enabled`              | To enable persistent volumes for cd4pe                                  | `true`                                                                                                                              |
| `persistence.existingClaim`        | An existing pvc to use                                                  | `nil`                                                                                                                               |
| `persistence.storageClass`         | The storage class to use for the pvc                                    | `nil`                                                                                                                               |
| `persistence.mountPath`            | The mountpath of the pvc in the cd4pe container                         | `/disk`                                                                                                                             |
| `persistence.annotations`          | PVC annotations                                                         | `{}`                                                                                                                                |
| `persistence.accessMode`           | The access mode for the pvc                                             | `ReadWriteOnce`                                                                                                                     |
| `persistence.size`                 | The size of the pvc                                                     | `10Gi`                                                                                                                              |
| `postgresql.image.tag`             | The image tag to use for PostgreSQL                                     | `9.6`                                                                                                                               |
| `postgresql.postgresqlDatabase`    | The database name to create and use for cd4pe                           | `cd4pe`                                                                                                                             |
| `postgresql.postgresqlUsername`    | The user name to use to access PostgreSQL                               | `cd4pe`                                                                                                                             |
| `postgresql.postgresqlPassword`    | The password to use to access PostgreSQL                                | A random 10 character string                                                                                                        |

The above parameters map to the env variables defined in each container. For more information please refer to each image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

\#TODO add installation instructions.

```bash
helm install --name CD4PE-release \
  --set service.type=LoadBalancer
```

The above command sets the  by CD4PE service to LoadBalancer, so all of the services will be on the same external IP.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```bash
helm install --name my-release -f values.yaml
```

## Persistence

Persistent Volume Claims are used to keep the data across deployments. Two persistent volume can be created, one for the PostgreSQL database and one for the local CD4PE object store.
