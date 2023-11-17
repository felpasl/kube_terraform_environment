variable "sa_password" {
    description = "value of sa_password"
    default = "Sa@123456"
}

variable "localdb_enabled" {
    description = "whether to enable localdb"
    default = true  
}

variable "localdb_resources" {
    type = object({
        limits = object({
            cpu    = string
            memory = string
        })
        requests = object({
            cpu    = string
            memory = string
        })
    })
    description = "localdb resources"
    default = {
        limits = {
            cpu    = "200m"
            memory = "2Gi"
        }
        requests = {
            cpu    = "100m"
            memory = "1Gi"
        }
    }
}