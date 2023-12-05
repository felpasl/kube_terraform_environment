terraform {
  required_version = ">= 0.12"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
    }
  }
}

module "localdb" {
  source      = "./tools/localdb"
  localdb_enabled = var.localdb_enabled
  sa_password = var.sa_password
}

module "kubed" {
  source        = "./tools/kubed"
  kubed_enabled = var.kubed_enabled
}

module "apisix" {
  source         = "./tools/apisix"
  depends_on = [ module.istio ]
  apisix_enabled = var.apisix_enabled
  apisix = var.apisix
  key = var.apisix_key
  crt = var.apisix_crt
  tls_hosts = var.apisix_tls_hosts
}

module "kafka" {
  source           = "./tools/kafka"
  kafka_enabled    = var.kafka_enabled
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

module "istio" {
  source        = "./tools/istio"
  istio_enabled = var.istio_enabled
}

module "keycloak" {
  source        = "./tools/keycloak"
  keycloak_enabled = var.keycloak_enabled
  keycloak = var.keycloak
}

module "sonarqube" {
  source        = "./tools/sonarqube"
  sonarqube_enabled = var.sonarqube_enabled
  sonarqube_sqlserver = var.sonarqube_sqlserver
}