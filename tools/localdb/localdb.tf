resource "kubernetes_namespace" "db" {
    metadata {
        name = "${terraform.workspace}-db"
    }  
}

resource "helm_release" "mssql" {
  depends_on = [kubernetes_secret_v1.mssql]
  name       = "${terraform.workspace}-mssql"
  namespace = "${kubernetes_namespace.db.metadata.0.name}"
  chart      = "./helm/mssql-linux"
    set {
        name  = "SA_PASSWORD.secretName"
        value = "${terraform.workspace}-mssql"
    }
}

resource "kubernetes_secret_v1" "mssql" {
  metadata {
    namespace = "${kubernetes_namespace.db.metadata.0.name}"
    name = "${terraform.workspace}-mssql"
  }
  depends_on = [ kubernetes_namespace.db ]
  data = {
    "SA_PASSWORD" = "Sa@123456"
  }

}
