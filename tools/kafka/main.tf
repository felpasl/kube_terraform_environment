resource "kubernetes_namespace" "kafka" {
  metadata {
    name = "${terraform.workspace}-kafka"
  }
}
resource "helm_release" "kafka" {
  depends_on = [kubernetes_namespace.kafka]
  chart      = "kafka"
  name       = "kafka"
  repository = "https://charts.bitnami.com/bitnami"

  set {
    name  = "sasl.client.users[0]"
    value = var.kafka_0_username
  }
  set {
    name  = "sasl.client.passwords[0]"
    value = var.kafka_0_password
  }
  values    = ["${file("${path.module}/values.kafka.yaml")}"]
  namespace = kubernetes_namespace.kafka.metadata.0.name
}

resource "kubernetes_secret" "kafkaSecret" {
  metadata {
    name      = "kafka-secret"
    namespace = "default"
    annotations = {
      "kubed.appscode.com/sync" : "base=${terraform.workspace}"
    }
  }
  type = "Opaque"
  data = {
    "kafka_username" = var.kafka_0_username
    "kafka_password" = var.kafka_0_password
  }
}
