variable "sonarqube_enabled" {
  description = "value of sonarqube_enabled"
  default     = true
}

variable "sonarqube_sqlserver" {
  type = object({
    jdbc = object({
      db_url   = string
      db_user  = string
      db_pass  = string
    })
  })

  default = {
    jdbc = ({
      db_url   = "jdbc:sqlserver://dev-mssql-sql-statefull-deploy.dev-db;databaseName=sonarqube;encrypt=false"
      db_user  = "sa"
      db_pass  = "Sa@123456"
    })
  }
}