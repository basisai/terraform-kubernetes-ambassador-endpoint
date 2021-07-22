variable "name" {
  description = "Base name of CRD resources"
}

variable "namespace" {
  description = "Namespace to create resources in"
  default     = "default"
}

variable "ambassador_id" {
  description = "Ambassador ID to create CRDs for"
  default     = ["default"]
}

variable "hostname" {
  description = "Hostname for the endpoint"
}

variable "host_annotations" {
  description = "Annotations for host"
  default     = {}
}

variable "host_labels" {
  description = "Labels for host"
  default = {
    "app.kubernetes.io/managed-by" = "Terraform"
  }
}

variable "host_spec" {
  description = "Additional specifications for host"
  default     = {}
}

variable "mapping_annotations" {
  description = "Annotations for mapping"
  default     = {}
}

variable "mapping_labels" {
  description = "Labels for mapping"
  default = {
    "app.kubernetes.io/managed-by" = "Terraform"
  }
}

#########################
# TLS Settings
#########################
variable "tls_enabled" {
  description = "Enable TLS"
  default     = false
}

variable "acme_provider" {
  description = "ACME Provider configuration if TLS is enabled"
  default = {
    authority = "None"
  }
}

variable "tls_secret_name" {
  description = "TLS Secret name"
  default     = null
}

variable "insecure_request_policy" {
  description = "Request policy of insecure requests"
  default = {
    action         = "Redirect"
    additionalPort = 8080
  }
}

variable "tlscontext_annotations" {
  description = "Annotations for tlscontext"
  default     = {}
}

variable "tlscontext_labels" {
  description = "Labels for tlscontext"
  default = {
    "app.kubernetes.io/managed-by" = "Terraform"
  }
}

variable "tlscontext_spec" {
  description = "Additional specifications for TLSContext"
  default = {
    min_tls_version = "v1.2"
    alpn_protocols  = "h2, http/1.1"
  }
}

#########################
# Mapping Settings
#########################
variable "service" {
  description = "Name of the service to map the host to, using the specified resolver"
  type        = string
}

variable "prefix" {
  description = "Path prefix for the mapping"
  default     = "/"
}

variable "mapping_spec" {
  description = "Additional specifications for mapping, like resolver"
  default     = {}
}

#########################
# TLS Origination
#########################
variable "tls_origination_enable" {
  description = "Enable TLS Origination for the Mapping"
  default     = false
}

variable "tls_origination_name" {
  description = "Name of the TLSContext created for TLS Origination. Defaults to var.name suffixed with -orig"
  type        = string
  default     = ""
}

variable "tls_original_secret" {
  description = "Name of the secret for TLS origination"
  default     = ""
}

variable "tls_origination_annotations" {
  description = "Annotations for TLSContext for TLS origination"
  default     = {}
}

variable "tls_origination_labels" {
  description = "Labels for TLSContext for TLS origination"
  default = {
    "app.kubernetes.io/managed-by" = "Terraform"
  }
}

variable "tls_origination_spec" {
  description = "Additional spec for the TLSContext used in TLS origination"
  default     = {}
}
