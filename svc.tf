resource "kubernetes_service_v1" "svc" {
  metadata {
    name      = "frontend-svc"
    namespace = kubernetes_namespace_v1.ns.metadata.0.name
  }
  spec {
    selector = {
      tier = "frontend"
    }
    port {
      port        = 4444
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
