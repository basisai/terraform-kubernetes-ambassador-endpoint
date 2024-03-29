resource "kubernetes_manifest" "host" {
  manifest = {
    apiVersion = "getambassador.io/v3alpha1"
    kind       = "Host"

    metadata = {
      name        = var.name
      namespace   = var.namespace
      annotations = var.host_annotations
      labels      = var.host_labels
    }

    spec = merge(
      {
        ambassador_id = var.ambassador_id
        hostname      = var.hostname
      },
      var.tls_enabled ? {
        acmeProvider = var.acme_provider
        requestPolicy = {
          insecure = var.insecure_request_policy
        }
        tlsContext = {
          name = kubernetes_manifest.tlscontext[0].manifest.metadata.name
        }
        tlsSecret = {
          name = var.tls_secret_name
        }
      } : tomap({}),
      var.host_spec,
    )
  }

  field_manager {
    force_conflicts = true
  }
}

resource "kubernetes_manifest" "mapping" {
  manifest = {
    apiVersion = "getambassador.io/v3alpha1"
    kind       = "Mapping"

    metadata = {
      name        = var.name
      namespace   = var.namespace
      annotations = var.mapping_annotations
      labels      = var.mapping_labels
    }

    spec = merge(
      {
        ambassador_id = var.ambassador_id
        service       = var.service
        hostname      = var.hostname
        prefix        = var.prefix
      },
      var.tls_origination_enable ? {
        tls = coalesce(var.tls_origination_name, "${var.name}-orig")
      } : tomap({}),
      var.mapping_spec,
    )
  }

  field_manager {
    force_conflicts = true
  }
}

resource "kubernetes_manifest" "tlscontext" {
  count = var.tls_enabled ? 1 : 0

  manifest = {
    apiVersion = "getambassador.io/v3alpha1"
    kind       = "TLSContext"

    metadata = {
      name        = var.name
      namespace   = var.namespace
      annotations = var.tlscontext_annotations
      labels      = var.tlscontext_labels
    }

    spec = merge(
      {
        ambassador_id = var.ambassador_id
        secret        = var.tls_secret_name
        hosts         = [var.hostname]
      },
      var.tlscontext_spec,
    )
  }

  field_manager {
    force_conflicts = true
  }
}

resource "kubernetes_manifest" "tls_origination" {
  count = var.tls_origination_enable ? 1 : 0

  manifest = {
    apiVersion = "getambassador.io/v3alpha1"
    kind       = "TLSContext"

    metadata = {
      name        = coalesce(var.tls_origination_name, "${var.name}-orig")
      namespace   = var.namespace
      annotations = var.tls_origination_annotations
      labels      = var.tls_origination_labels
    }

    spec = merge(
      {
        ambassador_id = var.ambassador_id
        secret        = var.tls_original_secret
      },
      var.tls_origination_spec,
    )
  }

  field_manager {
    force_conflicts = true
  }
}
