resource "kubernetes_namespace" "rabbitmq" {
  count = var.rabbitmq_enabled ? 1 : 0
  metadata {
    name = "${terraform.workspace}-rabbitmq"
  }
}

resource "helm_release" "rabbitmq" {
    count = 2
    depends_on = [kubernetes_namespace.rabbitmq]
    chart = "rabbitmq"
    name = "rabbitmq"
    repository = "https://charts.bitnami.com/bitnami"
    values    = ["${file("${path.module}/values.rabbitmq.yaml")}"]
    namespace = kubernetes_namespace.rabbitmq[0].metadata.0.name 
}