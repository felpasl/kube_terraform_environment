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