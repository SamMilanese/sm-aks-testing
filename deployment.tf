resource "kubernetes_deployment_v1" "deploy" {
  metadata {
    name      = "deploy-tfc-agent"
    namespace = kubernetes_namespace_v1.ns.metadata.0.name

    labels = {
      tier = "frontend"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        tier = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          tier = "frontend"
        }
      }

      spec {
        container {
          image = "nginx:1.23.3"
          name  = "nginx"

          resources {
            limits = {
              cpu    = "1"
              memory = "256Mi"
            }
            requests = {
              cpu    = "500m"
              memory = "30Mi"
            }
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
  }
}
