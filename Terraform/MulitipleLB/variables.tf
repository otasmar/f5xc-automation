variable "api_p12" {
  description = "REQUIRED: F5 Distributed Cloud API certificate file path"
  type        = string
  default     = "/PATH/certificate.cert"
}

variable "tenant_name" {
  description = "REQUIRED: F5 Distributed Cloud tenant ID"
  type        = string
}

variable "namespace" {
  description = "REQUIRED: F5 Distributed Cloud namespace to deploy objects into"
  type        = string
  default     = "default"
}

variable "loadbalancers" {
  description = "REQUIRED: List of Loadbalancer information to create new loadbalancers"
  type = list(object({
    name             = string
    hostname         = string
    dns_managed      = bool
    port             = string
    advertise_public = bool
    waf_name         = string
  }))
  default = [
    {
      name             = "lb1"
      hostname         = "lb1"
      dns_managed      = false
      port             = 80
      advertise_public = false
      waf_name         = "waf1"
    },
    {
      name             = "lb2"
      hostname         = "lb2"
      dns_managed      = false
      port             = 80
      advertise_public = false
      waf_name         = "waf1"
    },
  ]
}