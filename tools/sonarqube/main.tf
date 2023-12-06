resource "kubernetes_namespace" "sonarqube" {
  count = var.sonarqube_enabled ? 1 : 0
  metadata {
    name = "${terraform.workspace}-sonarqube"
  }
}

resource "helm_release" "sonarqube" {
    count = var.sonarqube_enabled ? 1 : 0
    depends_on = [kubernetes_namespace.sonarqube]
    chart = "sonarqube"
    name = "sonarqube"
    version = "10.0"
    repository = "https://SonarSource.github.io/helm-chart-sonarqube"
    values    = ["${file("${path.module}/values.sonarqube.yaml")}"]
    set {
      name = "jdbcOverwrite.jdbcUrl"
      value = var.sonarqube_sqlserver.jdbc.db_url
    }
    set {
      name = "jdbcOverwrite.jdbcUsername"
      value = var.sonarqube_sqlserver.jdbc.db_user
    }
    set {
      name = "jdbcOverwrite.jdbcPassword"
      value = var.sonarqube_sqlserver.jdbc.db_pass
    }
    namespace = kubernetes_namespace.sonarqube[0].metadata.0.name 
}