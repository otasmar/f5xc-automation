api_p12     = "./credentials/xc-api-cert.p12"
tenant_name = "adports"
namespace   = "default"


loadbalancers = [
  {
    name             = "lb1"
    hostname         = "app1.example.com"
    dns_managed      = true
    port             = "80"
    advertise_public = true
  },
  {
    name             = "lb2"
    hostname         = "app2.example.com"
    dns_managed      = false
    port             = "8080"
    advertise_public = false
  }
]