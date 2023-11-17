resource "kubernetes_namespace" "db" {
  count = "${var.localdb_enabled}" ? 1 : 0
    metadata {
        name = "${terraform.workspace}-db"
    }  
}

resource "helm_release" "mssql" {
  count = "${var.localdb_enabled}" ? 1 : 0
  depends_on = [kubernetes_secret_v1.mssql]
  name       = "${terraform.workspace}-mssql"
  namespace = "${kubernetes_namespace.db[0].metadata.0.name}"
  chart      = "./helm/mssql-linux"
    set {
        name  = "SA_PASSWORD.secretName"
        value = "${terraform.workspace}-mssql"
    }
    set {
        name  = "SA_PASSWORD.secretKey"
        value = "SA_PASSWORD"
    }
    dynamic set {
      for_each = var.localdb_resources
      content {
        name  = "resources.${set.key}.cpu"
        value = set.value["cpu"]
      }      
    } 
       
    dynamic set {
      for_each = var.localdb_resources
      content {
        name  = "resources.${set.key}.memory"
        value = set.value["memory"]
      }      
    }
}

resource "kubernetes_secret_v1" "mssql" {
  count = "${var.localdb_enabled}" ? 1 : 0
  metadata {
    namespace = "${kubernetes_namespace.db[0].metadata.0.name}"
    name = "${terraform.workspace}-mssql"
  }
  depends_on = [ kubernetes_namespace.db ]
  data = {
    "SA_PASSWORD" = "Sa@123456"
  }

}
