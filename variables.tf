variable "kubed_enabled" {
  description = "value of kubed_enabled"
  default     = true
}

variable "sa_password" {
  type    = string
  default = "Sa@123456"
}

variable "apisix_enabled" {
  description = "value of apisix_enabled"
  default     = true
}

variable "kafka_ui_enabled" {
  description = "value of kafka_ui_enabled"
  default     = true
}

variable "kafka_username" {
  description = "value of kafka_username"
  default     = "user1"
}

variable "kafka_password" {
  description = "value of kafka_password"
  default     = "pass1"
}

variable "istio_enabled" {
  description = "value of istio_enabled"
  default     = true
}

variable "jaeger_enabled" {
  description = "value of jaeger_enabled"
  default     = true
}

variable "kafka_enabled" {
  description = "value of kafka_enabled"
  default     = true
}

variable "localdb_enabled" {
  description = "value of localdb_enabled"
  default     = true
}

variable "apisix" {
  type = object({
    dashboard_host       = string
    gateway_service_type = string
    nodeport_http        = number
    nodeport_https       = number
    user = object({
      username = string
      password = string
    })
  })

  default = {
    dashboard_host       = "apisix.localhost"
    gateway_service_type = "LoadBalancer"
    nodeport_http        = 31734
    nodeport_https       = 31440
    user = {
      username = "admin"
      password = "admin"
    }
  }
}

variable "keycloak_enabled" {
  description = "value of keycloak_enabled"
  default     = true
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
    ingress_class_type = "apisix"
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