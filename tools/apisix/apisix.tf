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
  version    = "1.7.2"
  repository = "https://charts.apiseven.com"
  namespace  = "ingress-apisix"
  values     = ["${file("${path.module}/values.apisix.yaml")}"]
  set {
    name  = "ingress-controller.config.apisix.serviceNamespace"
    value = "ingress-apisix"
  }
}

resource "kubernetes_deployment" "whoaim" {
  metadata {
    name      = "whoami"
    namespace = "ingress-apisix"
  }
  spec {
    selector {
      match_labels = {
        app = "whoami"
      }
    }
    template {
      metadata {
        labels = {
          app = "whoami"
        }
      }
      spec {
        container {
          image = "containous/whoami"
          name  = "whoami"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "whoaim" {

  metadata {
    name      = "whoami"
    namespace = "ingress-apisix"
  }
  spec {
    selector = {
      app = "whoami"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_manifest" "whoaim" {
  manifest = yamldecode( <<EOF
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: whoaim-ingress
    namespace: ingress-apisix
  spec:
    # we use APISIX Ingress and it watches Ingress resources with "apisix" ingressClassName
    ingressClassName: apisix
    rules:
    - host: 
      http:
        paths:
        - backend:
            service:
              name: whoami
              port:
                number: 80
          path: /
          pathType: Prefix
    EOF
  )
}