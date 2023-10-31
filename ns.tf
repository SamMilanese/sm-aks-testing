resource "kubernetes_namespace_v1" "ns" {

  metadata {
    name = var.kube_namespace

    annotations = {
      name = "This blog post is amazing"
    }

    labels = {
      tier = "frontend"
    }
  }
}
