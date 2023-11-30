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


// Localhost Self-Signed Certificate for testPropose
variable "apisix_crt" {
  description = "value of apisix_crt"
  default     = <<EOF
-----BEGIN CERTIFICATE-----
MIID5zCCAs+gAwIBAgIUTjz0I2fD/HyIteQeJzcjoly657MwDQYJKoZIhvcNAQEL
BQAwgYIxCzAJBgNVBAYTAkJSMQswCQYDVQQIDAJTUDELMAkGA1UEBwwCU1AxEjAQ
BgNVBAoMCWxvY2FsaG9zdDESMBAGA1UECwwJbG9jYWxob3N0MRIwEAYDVQQDDAls
b2NhbGhvc3QxHTAbBgkqhkiG9w0BCQEWDmxvY2FsQGhvc3QuY29tMB4XDTIzMTEx
MjE4NTMyNloXDTI0MTExMTE4NTMyNlowgYIxCzAJBgNVBAYTAkJSMQswCQYDVQQI
DAJTUDELMAkGA1UEBwwCU1AxEjAQBgNVBAoMCWxvY2FsaG9zdDESMBAGA1UECwwJ
bG9jYWxob3N0MRIwEAYDVQQDDAlsb2NhbGhvc3QxHTAbBgkqhkiG9w0BCQEWDmxv
Y2FsQGhvc3QuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtXng
fofa+UrG3G8bLRRN3mJbiOlx1J6Q/p85TqxEyqD7wIs5srSLIvk3B4lOtlk0XKlS
UaAv64ImKVF4dRo6XLbz8NZ8RdB+7mQULcgzHagCHWjsFGDvdUkz2SnAd02Nsrub
OP3Do4czl5E5jiAAN/Sliy52abDFSIL3yPjLQf+yBIfk2fF9GLjsy1ONPJQeh14z
GsJEiuFEczK1TYWGijIqyVPTCdRJdBNgmBDusBmtnh8Nx33WslmxgS7R3wWc5TWL
YBKMl7uc8iZDkH2y0gYJG0+Dcnpm4PmFkQUEU15Ri+P3secQMWblna644L83P83X
8vQDN1PhNNyAsveX4wIDAQABo1MwUTAdBgNVHQ4EFgQUT67AvmjjqpjnLgPfqyVV
uCj4WQ8wHwYDVR0jBBgwFoAUT67AvmjjqpjnLgPfqyVVuCj4WQ8wDwYDVR0TAQH/
BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAYqaF+jfsGfFQh7YHFgcEIgGgMWtX
cJ4bma90Nfda+UnjEe3oTK995mImaWI60jrBfdK7+OA14iVb0VnZjysCe03pEb8D
ohPoiF1EKls4SDIxYdAJUUsD7uQJTWy2TsDr8PqDzriUfE3nxsebGsRB4ld87VDn
WnITA6hs5UMzKvfmEOPY4M+rNJ+gFn/QABQbJRoYndImXGPi2eNY2acM8rfo1rBD
9yfq7EIYis9ba9o3CNwDsHOpG7lrzetnxnTo4Y9dKXJXIcwIkW5C58y0pNg8afqD
bnBxhPyCTdx31CIch+ge4DoU3n4ePY9ui4RmTkdvk3BcVaTxinix1pshIQ==
-----END CERTIFICATE-----
EOF
}

// Localhost Self-Signed Certificate for testPropose
variable "apisix_key" {
  description = "value of apisix_key"
  default     = <<EOF
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1eeB+h9r5Ssbc
bxstFE3eYluI6XHUnpD+nzlOrETKoPvAizmytIsi+TcHiU62WTRcqVJRoC/rgiYp
UXh1GjpctvPw1nxF0H7uZBQtyDMdqAIdaOwUYO91STPZKcB3TY2yu5s4/cOjhzOX
kTmOIAA39KWLLnZpsMVIgvfI+MtB/7IEh+TZ8X0YuOzLU408lB6HXjMawkSK4URz
MrVNhYaKMirJU9MJ1El0E2CYEO6wGa2eHw3HfdayWbGBLtHfBZzlNYtgEoyXu5zy
JkOQfbLSBgkbT4Nyembg+YWRBQRTXlGL4/ex5xAxZuWdrrjgvzc/zdfy9AM3U+E0
3ICy95fjAgMBAAECggEARk0MdnfSkDgziTlRYck30SpxIzyr6B31NW4hGSULESQD
4rcMhvoB3G6Grti2MVWlPzAov446ghVNCzyQWWzrpvcI0QeF5NW8FkWWu5WOl7J5
/0KiEdLrcJgHCd1uvcjBV7ftjcpge3zos5KCpVgoPYT8jEpXfOIJyulRa/1VYB8y
QtG3JwgTjNh+zFd/7uqH22kNqrHSFks86YAZsKGhKJLR+Ia+t9O6qx8HAZ6o/d43
DxdvuhC2x0nb6u2rLRDaTWdqGn6PDTZPcXrejZkq0NARvxtp6tM5L2rpSh5iDI2R
7GtleFpy8JDZwDc5Z3wsHsQChTcoMFg7cboLhisGYQKBgQDnMnzf8rTXku/NTN3q
pxkTTvNJJDLmQv7LGLk1liG3rcwfvWelZ6l8ipQlbpecYG0FC2qVyZFgmX+LQt59
OnWIzMWUsDEJNgf9NWRTYsXbre8/FzNS+f/8Pep0Y4phvFGtdGlQ9zVg8QG2saKw
N4Rnp8dMJtuZeJ1Uoi7dGw6RHQKBgQDI8d3n5USv9bZKZqOnR1QsmO2BLYpb5mJM
8C8r5RhdilwDwLFCBDwecFEG9piN1sLVNatnzYS2tk9JkW0bn4+kJVOxxvxR2pGn
97Pcfam4JPzUG5z3LHo2+5dO6yxYWIkWN4gF64oVbXNRMfnyptWJQxSwuxkLU/wq
8eRRwOd8/wKBgEjG9dQxPIgXsvD3X2v8ScJwOdkuUe9162rXT4X0yoxdY0Iihzvk
E9Amd1gJJiSNngPWgijAmMjFyQZ3eD4HZvQ3MYMKq4TwwzcL1ZcCIrJyYDuF/BwE
onYur10P8IGvnC5z1KsuBlmLxDRUWpgKAd33TJ9GJB59f1ki7ImheMZpAoGAG4DP
SJAeyJ6u5pwJxjmDEd+UkluzVkTAK5usOSvQG+12DqVvHYQK3nes/3D9DFzaqegA
n+KHSaLGU2FuN5utQ2BAhlKf8mwiB4VlvsYMVsHpQPbOkx4pVCE3YnvZw/XKPZo4
KedFLQ2f/PsEJOwkyfa+fDn/gYdrOk2FXJM0m+0CgYEAw1AZiXQfZQZ66tqE6JZp
iWaKn7Yq3g9zCHzyHfgYyvcGPCE8PJjgRr8xkFJsW2heyjfA2V8MLDcihi2TRU+T
pTyi8rsLkW1IZamiqzZB2pPJZC9w5w3B5JpkE9zpjwhOCCB4W7Ad1ruKDxb4i544
PKKe8PujWkf1p7mtx00pfbc=
-----END PRIVATE KEY-----
  EOF
}

// List of hosts for TLS
variable "apisix_tls_hosts" {
  description = "value of tls hosts"
  type        = list(string)
  default     = [ "localhost", "apisix.localhost", "keycloak.localhost" ]
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