terraform {
  backend "kubernetes" {
    secret_suffix = "terraform-state"
    config_path = "~/.kube/config"
  }
}