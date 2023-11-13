terraform {
  required_version = ">= 0.12"
}

module "localdb" {
  source      = "./tools/localdb"
  sa_password = var.sa_password
}

module "kubed" {
  source        = "./tools/kubed"
  kubed_enabled = var.kubed_enabled
}

module "apisix" {
  source         = "./tools/apisix"
  apisix_enabled = var.apisix_enabled
}

module "kafka" {
  source           = "./tools/kafka"
  kafka_0_username = var.kafka_username
  kafka_0_password = var.kafka_password
}

module "kafka-ui" {
  source           = "./tools/kafka-ui"
  depends_on       = [module.kafka]
  kafka_ui_enabled = var.kafka_ui_enabled
}

module "namespaces" {
  source = "./tools/namespaces"
}
