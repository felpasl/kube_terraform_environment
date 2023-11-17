variable "kubed_enabled" {
    description = "value of kubed_enabled"
    default = true  
}

variable "sa_password" {
    type = string  
    default = "Sa@123456"
}

variable "apisix_enabled" {
    description = "value of apisix_enabled"
    default = true    
}

variable "kafka_ui_enabled" {
    description = "value of kafka_ui_enabled"
    default = true    
}

variable "kafka_username" {
    description = "value of kafka_username"
    default = "user1"      
}

variable "kafka_password" {
    description = "value of kafka_password"
    default = "pass1"  
}

variable "istio_enabled" {
    description = "value of istio_enabled"
    default = true  
}

variable "jaeger_enabled" {
    description = "value of jaeger_enabled"
    default = true    
}

variable "kafka_enabled" {
    description = "value of kafka_enabled"
    default = true      
}

variable "localdb_enabled" {
    description = "value of localdb_enabled"
    default = true        
}