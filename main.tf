resource "kubernetes_manifest" "host" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "getambassador.io/v2"
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
      } : tomap({})
    )
  }
}

resource "kubernetes_manifest" "mapping" {
  provider = kubernetes-alpha

  manifest = {
    apiVersion = "getambassador.io/v2"
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
        host          = var.hostname
        prefix        = var.prefix
      },
      var.tls_origination_enable ? {
        tls = var.name
      } : tomap({}),
      var.mapping_spec,
    )
  }
}

resource "kubernetes_manifest" "tlscontext" {
  provider = kubernetes-alpha
  count    = var.tls_enabled ? 1 : 0

  manifest = {
    apiVersion = "getambassador.io/v2"
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
}

resource "kubernetes_manifest" "tls_origination" {
  provider = kubernetes-alpha
  count    = var.tls_origination_enable ? 1 : 0

  manifest = {
    apiVersion = "getambassador.io/v2"
    kind       = "TLSContext"

    metadata = {
      name        = var.name
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
}
