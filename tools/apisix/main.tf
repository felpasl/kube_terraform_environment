resource "kubernetes_namespace" "apisix" {
  count = "${var.apisix_enabled}" ? 1 : 0
  metadata {
    name = "ingress-apisix"
  }
}

// install gateway CRD https://github.com/kubernetes-sigs/gateway-api/releases

resource "helm_release" "apisix" {
  depends_on = [ kubernetes_namespace.apisix ]
  chart      = "apisix"
  name       = "apisix"
  repository = "https://charts.apiseven.com"
  namespace  = "ingress-apisix"
  values     = ["${file("${path.module}/values.apisix.yaml")}"]
  set {
    name  = "dashboard.ingress.hosts[0].host"
    value = var.apisix.dashboard_host
  }
  set {
    name  = "service.type"
    value = var.apisix.gateway_service_type
  }
  set {
    name  = "service.http.nodePort"
    value = var.apisix.nodeport_http
  }
  set {
    name  = "service.tls.nodePort"
    value = var.apisix.nodeport_https
  }
}

resource "kubernetes_secret" "tlsSecret" {
  count = "${var.apisix_enabled}" ? 1 : 0
  depends_on = [ helm_release.apisix ]
  metadata {
    name      = "apisix-tls"
    namespace = "ingress-apisix"
  }
  type = "kubernetes.io/tls"
  
  data = {
    "tls.crt" = "${var.crt}"
    "tls.key" = "${var.key}"
  }
}

// Change to kubectl_manifest because of https://github.com/hashicorp/terraform-provider-kubernetes/issues/1367

resource "kubernetes_manifest" "tlsSecret" {
  count = "${var.apisix_enabled}" ? 1 : 0
  depends_on = [ helm_release.apisix ]
  manifest = {
    apiVersion = "apisix.apache.org/v2"
    kind       = "ApisixTls"
    metadata = {
      name      = "host-tls"
      namespace = "ingress-apisix"
    }
    spec = {
      hosts = "${var.tls_hosts}"
      secret = {
        name      = "apisix-tls"
        namespace = "ingress-apisix"
      }
    }
  }
}
