resource "kubernetes_persistent_volume_claim" "test" {
  wait_until_bound = false
  metadata {
    name = "test"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}

resource "kubernetes_pod_v1" "pod_tfc_agent" {
  metadata {
    name      = "tfc-agent"
    namespace = kubernetes_namespace_v1.ns.metadata.0.name
  }

  spec {
    container {
      image = "hashicorp/tfc-agent:latest"
      name  = "tfc-agent"
     volume_mount {
            mount_path = "~/.tfc-agent/hooks"
            name = kubernetes_config_map.example.metadata.0.name
          }

      env {
        name  = "environment"
        value = "dev"
      }
      env {
            name  = "TFC_AGENT_TOKEN"
            value = var.tfc_agent_token
          }
      env {
            name  = "TFC_AGENT_NAME"
            value = "SM_Test_Agent_1"
          }
      env {
            name  = "TFC_AGENT_SINGLE"
            value = "true"
          }

      port {
        container_port = 8080
      }


    }
    volume {
          name = kubernetes_config_map.example.metadata.0.name
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.test.metadata[0].name
          }
    }
  }
}
