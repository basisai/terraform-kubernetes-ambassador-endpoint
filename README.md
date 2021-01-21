# Terraform Ambassador Endpoints

Create the necessary CRDs to serve a service via Ambassador using Terraform.

Each "instance" of this module will create a single `Host`, `Mapping`, optional `TLSContext`
and an optional `TLSContext` for `Mapping` TLS origination. This greatly simplifies the module.

If your service serves multiple hosts, create multiple instances of this module with `for_each`.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| kubernetes-alpha | >= 0.2 |

## Providers

| Name | Version |
|------|---------|
| kubernetes-alpha | >= 0.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acme\_provider | ACME Provider configuration if TLS is enabled | `map` | <pre>{<br>  "authority": "None"<br>}</pre> | no |
| ambassador\_id | Ambassador ID to create CRDs for | `list` | <pre>[<br>  "default"<br>]</pre> | no |
| host\_annotations | Annotations for host | `map` | `{}` | no |
| host\_labels | Labels for host | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| hostname | Hostname for the endpoint | `any` | n/a | yes |
| insecure\_request\_policy | Request policy of insecure requests | `map` | <pre>{<br>  "action": "Redirect",<br>  "additionalPort": 8080<br>}</pre> | no |
| mapping\_annotations | Annotations for mapping | `map` | `{}` | no |
| mapping\_labels | Labels for mapping | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| mapping\_spec | Additional specifications for mapping, like resolver | `map` | `{}` | no |
| name | Base name of CRD resources | `any` | n/a | yes |
| namespace | Namespace to create resources in | `string` | `"default"` | no |
| prefix | Path prefix for the mapping | `string` | `"/"` | no |
| service | Name of the service to map the host to, using the specified resolver | `string` | n/a | yes |
| tls\_enabled | Enable TLS | `bool` | `false` | no |
| tls\_original\_secret | Name of the secret for TLS origination | `string` | `""` | no |
| tls\_origination\_annotations | Annotations for TLSContext for TLS origination | `map` | `{}` | no |
| tls\_origination\_enable | Enable TLS Origination for the Mapping | `bool` | `false` | no |
| tls\_origination\_labels | Labels for TLSContext for TLS origination | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| tls\_origination\_spec | Additional spec for the TLSContext used in TLS origination | `map` | `{}` | no |
| tls\_secret\_name | TLS Secret name | `any` | `null` | no |
| tlscontext\_annotations | Annotations for tlscontext | `map` | `{}` | no |
| tlscontext\_labels | Labels for tlscontext | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| tlscontext\_spec | Additional specifications for TLSContext | `map` | <pre>{<br>  "alpn_protocols": "h2, http/1.1",<br>  "min_tls_version": "v1.2"<br>}</pre> | no |

## Outputs

No output.
