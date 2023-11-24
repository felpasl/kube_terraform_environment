variable "keycloak_enabled" {
    description = "value of keycloak_enabled"
    default = true    
}

variable "keycloak" {
  type = object({
    ingress_class_type = string
    production         = bool
    admin = object({
      username = string
      password = string
    })
    postgres = object({
      database      = string
      db_user       = string
      db_pass       = string
      postgres_pass = string
    })
  })

  default = {
    ingress_class_type = "kong"
    production = false
    admin = {
      username = "admin"
      password = "admin"
    }
    postgres = {
      database = "keycloak"
      db_user = "dbkeycloak"
      db_pass = "dbkeycloakpass"
      postgres_pass = "keycloak"
    }
  }
}