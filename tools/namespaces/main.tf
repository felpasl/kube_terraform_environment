resource "helm_release" "namespaces" {
  chart = "./helm/namespace"
  name = terraform.workspace
  namespace = "default"
  values = ["${file("${path.cwd}/namespaces/namespaces.yaml")}"]
  set {
    name  = "labels.base"
    value = terraform.workspace
  }
}