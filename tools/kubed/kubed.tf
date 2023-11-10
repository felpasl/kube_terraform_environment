resource "helm_release" "kubed" {
    count = var.kubed_enabled ? 1 : 0
    chart = "kubed"
    name = "kubed"
    repository = "https://charts.appscode.com/stable"
    namespace = "kube-system"    
}
