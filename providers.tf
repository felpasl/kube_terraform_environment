
provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  registry_config_path   = "registry.yaml"
  repository_config_path = "repositories.yaml"
  repository_cache       = "${path.module}/.cache"
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubectl" {

}
