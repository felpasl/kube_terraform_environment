

resource "helm_release" "kafka-ui" {
  count      = var.kafka_ui_enabled ? 1 : 0
  chart      = "kafka-ui"
  repository = "https://provectus.github.io/kafka-ui-charts"
  name       = "kafka-ui"
  namespace  = "${terraform.workspace}-kafka"
  set {
    name  = "ingress.enabled"
    value = "true"
  }
  set {
    name  = "ingress.ingressClassName"
    value = "apisix"
  }
  set {
    name  = "ingress.path"
    value = "/kafka-ui"
  }
  set {
    name  = "envs.config.KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS"
    value = "kafka.${terraform.workspace}-kafka:9092"
  }

  set {
    name  = "envs.secret.KAFKA_CLUSTERS_0_PROPERTIES_SASL_JAAS_CONFIG"
    value = "org.apache.kafka.common.security.plain.PlainLoginModule required username=\"${var.kafka_0_username}\" password=\"${var.kafka_0_password}\";"
  }

  values = ["${file("${path.module}/values.kafka-ui.yaml")}"]
}
