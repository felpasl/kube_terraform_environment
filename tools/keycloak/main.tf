resource "kubernetes_namespace" "keycloak" {
  count = var.keycloak_enabled ? 1 : 0
  metadata {
    name = "${terraform.workspace}-keycloak"
  }
}

resource "helm_release" "keycloak" {
    count = var.keycloak_enabled ? 1 : 0
    depends_on = [kubernetes_namespace.keycloak]
    chart = "keycloak"
    name = "keycloak"
    repository = "https://charts.bitnami.com/bitnami"
    values    = ["${file("${path.module}/values.keycloak.yaml")}"]
    set {
      name = "auth.adminUser"
      value = var.keycloak.admin.username
    }
    set {
      name = "auth.adminPassword"
      value = var.keycloak.admin.password
    }
    set {
      name = "ingress.ingressClassName"
      value = var.keycloak.ingress_class_type
    }
    set {
      name = "production"
      value = var.keycloak.production
    }
    set {
      name = "postgresql.auth.postgresPassword"
      value = var.keycloak.postgres.postgres_pass
    }
    set {
      name = "postgresql.auth.username"
      value = var.keycloak.postgres.db_user
    }
    set {
      name = "postgresql.auth.password"
      value = var.keycloak.postgres.db_pass
    }
    set {
      name = "postgresql.auth.database"
      value = var.keycloak.postgres.database
    }
    namespace = kubernetes_namespace.keycloak[0].metadata.0.name 
}