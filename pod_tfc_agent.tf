resource "kubernetes_pod_v1" "pod_tfc_agent" {
  metadata {
    name      = "tfc-agent"
    namespace = kubernetes_namespace_v1.ns.metadata.0.name
  }

  spec {
    container {
      image = "hashicorp/tfc-agent:latest"
      name  = "tfc-agent"

      env {
        name  = "environment"
        value = "dev"
      }

      port {
        container_port = 8080
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 8080

          http_header {
            name  = "X-Custom-Header"
            value = "GreatBlogArticle"
          }
        }

        initial_delay_seconds = 2
        period_seconds        = 2
      }
    }
  }
}
