# Terraform Ambassador Endpoints

Create the necessary CRDs to serve a service via Ambassador using Terraform.

Each "instance" of this module will create a single `Host`, `Mapping`, optional `TLSContext`
and an optional `TLSContext` for `Mapping` TLS origination. This greatly simplifies the module.

If your service serves multiple hosts, create multiple instances of this module with `for_each`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubernetes-alpha"></a> [kubernetes-alpha](#requirement\_kubernetes-alpha) | >= 0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes-alpha"></a> [kubernetes-alpha](#provider\_kubernetes-alpha) | >= 0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes-alpha_kubernetes_manifest.host](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |
| [kubernetes-alpha_kubernetes_manifest.mapping](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |
| [kubernetes-alpha_kubernetes_manifest.tls_origination](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |
| [kubernetes-alpha_kubernetes_manifest.tlscontext](https://registry.terraform.io/providers/hashicorp/kubernetes-alpha/latest/docs/resources/kubernetes_manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_provider"></a> [acme\_provider](#input\_acme\_provider) | ACME Provider configuration if TLS is enabled | `map` | <pre>{<br>  "authority": "None"<br>}</pre> | no |
| <a name="input_ambassador_id"></a> [ambassador\_id](#input\_ambassador\_id) | Ambassador ID to create CRDs for | `list` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_host_annotations"></a> [host\_annotations](#input\_host\_annotations) | Annotations for host | `map` | `{}` | no |
| <a name="input_host_labels"></a> [host\_labels](#input\_host\_labels) | Labels for host | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| <a name="input_host_spec"></a> [host\_spec](#input\_host\_spec) | Additional specifications for host | `map` | `{}` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname for the endpoint | `any` | n/a | yes |
| <a name="input_insecure_request_policy"></a> [insecure\_request\_policy](#input\_insecure\_request\_policy) | Request policy of insecure requests | `map` | <pre>{<br>  "action": "Redirect",<br>  "additionalPort": 8080<br>}</pre> | no |
| <a name="input_mapping_annotations"></a> [mapping\_annotations](#input\_mapping\_annotations) | Annotations for mapping | `map` | `{}` | no |
| <a name="input_mapping_labels"></a> [mapping\_labels](#input\_mapping\_labels) | Labels for mapping | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| <a name="input_mapping_spec"></a> [mapping\_spec](#input\_mapping\_spec) | Additional specifications for mapping, like resolver | `map` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Base name of CRD resources | `any` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace to create resources in | `string` | `"default"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Path prefix for the mapping | `string` | `"/"` | no |
| <a name="input_service"></a> [service](#input\_service) | Name of the service to map the host to, using the specified resolver | `string` | n/a | yes |
| <a name="input_tls_enabled"></a> [tls\_enabled](#input\_tls\_enabled) | Enable TLS | `bool` | `false` | no |
| <a name="input_tls_original_secret"></a> [tls\_original\_secret](#input\_tls\_original\_secret) | Name of the secret for TLS origination | `string` | `""` | no |
| <a name="input_tls_origination_annotations"></a> [tls\_origination\_annotations](#input\_tls\_origination\_annotations) | Annotations for TLSContext for TLS origination | `map` | `{}` | no |
| <a name="input_tls_origination_enable"></a> [tls\_origination\_enable](#input\_tls\_origination\_enable) | Enable TLS Origination for the Mapping | `bool` | `false` | no |
| <a name="input_tls_origination_labels"></a> [tls\_origination\_labels](#input\_tls\_origination\_labels) | Labels for TLSContext for TLS origination | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| <a name="input_tls_origination_name"></a> [tls\_origination\_name](#input\_tls\_origination\_name) | Name of the TLSContext created for TLS Origination. Defaults to var.name suffixed with -orig | `string` | `""` | no |
| <a name="input_tls_origination_spec"></a> [tls\_origination\_spec](#input\_tls\_origination\_spec) | Additional spec for the TLSContext used in TLS origination | `map` | `{}` | no |
| <a name="input_tls_secret_name"></a> [tls\_secret\_name](#input\_tls\_secret\_name) | TLS Secret name | `any` | `null` | no |
| <a name="input_tlscontext_annotations"></a> [tlscontext\_annotations](#input\_tlscontext\_annotations) | Annotations for tlscontext | `map` | `{}` | no |
| <a name="input_tlscontext_labels"></a> [tlscontext\_labels](#input\_tlscontext\_labels) | Labels for tlscontext | `map` | <pre>{<br>  "app.kubernetes.io/managed-by": "Terraform"<br>}</pre> | no |
| <a name="input_tlscontext_spec"></a> [tlscontext\_spec](#input\_tlscontext\_spec) | Additional specifications for TLSContext | `map` | <pre>{<br>  "alpn_protocols": "h2, http/1.1",<br>  "min_tls_version": "v1.2"<br>}</pre> | no |

## Outputs

No outputs.
