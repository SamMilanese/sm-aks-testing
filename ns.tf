resource "kubernetes_namespace_v1" "ns" {

  metadata {
    name = "tfc-agent-ns"

    annotations = {
      name = "This blog post is amazing"
    }

    labels = {
      tier = "frontend"
    }
  }
}
