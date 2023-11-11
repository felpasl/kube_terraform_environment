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