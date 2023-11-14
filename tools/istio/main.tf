
resource "kubernetes_namespace" "istio" {
  count = "${var.istio_enabled}" ? 1 : 0
  metadata {
    name = "istio-system"
  }
}


resource "helm_release" "istio" {
  count      = "${var.istio_enabled}" ? 1 : 0
  depends_on = [kubernetes_namespace.istio]
  chart      = "base"
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = "istio-system"
}


resource "helm_release" "istiod" {
  count      = "${var.istio_enabled}" ? 1 : 0
  depends_on = [helm_release.istio]
  chart      = "istiod"
  name       = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = "istio-system"
  values     = ["${file("${path.module}/values.istio.yaml")}"]
}

resource "helm_release" "isito-egress" {
  count      = "${var.istio_enabled}" ? 1 : 0
  depends_on = [helm_release.istiod]
  chart      = "gateway"
  name       = "istio-egress"
  repository = "https://istio-release.storage.googleapis.com/charts"
  namespace  = "istio-system"
  values     = ["${file("${path.module}/values.istio.gateway.yaml")}"]
}
