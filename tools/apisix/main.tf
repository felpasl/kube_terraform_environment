resource "kubernetes_namespace" "apisix" {
  count = "${var.apisix_enabled}" ? 1 : 0
  metadata {
    name = "ingress-apisix"
  }
}

// install gateway CRD https://github.com/kubernetes-sigs/gateway-api/releases

resource "helm_release" "apisix" {
  chart      = "apisix"
  name       = "apisix"
  repository = "https://charts.apiseven.com"
  namespace  = "ingress-apisix"
  values     = ["${file("${path.module}/values.apisix.yaml")}"]
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
