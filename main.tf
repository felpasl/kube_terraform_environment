terraform {
    required_version = ">= 0.12"
}

module "localdb" {
    source = "./tools/localdb"
}

module "kubed" {
  source = "./tools/kubed"
  kubed_enabled = "${var.kubed_enabled}"
}

module "apisix" {
    source = "./tools/apisix"
    apisix_enabled = "${var.apisix_enabled}"
}

module "kafka" {
    source = "./tools/kafka"
}

module "kafka-ui" {
    source = "./tools/kafka-ui"
    depends_on = [ module.kafka ]
    kafka_ui_enabled = "${var.kafka_ui_enabled}"
}

module "namespaces"{
    source = "./tools/namespaces"
}