api_p12     = "../credentials/xc-api-cert.p12"
tenant_name = "adports"
namespace   = "default"


loadbalancers = [
  {
     advertise_public = false
     dns_managed      = false
     hostname         = "lb1"
     name             = "lb1"
     port             = 80
     waf_name         = "non-standard"
  },
  {
     advertise_public = false
     dns_managed      = false
     hostname         = "lb2"
     name             = "lb2"
     port             = 80
     waf_name         = "non-standard"
  },
  {
     advertise_public = false
     dns_managed      = false
     hostname         = "lb3"
     name             = "lb3"
     port             = 80
     waf_name         = "non-standard"
  }
{
     advertise_public = false
     dns_managed      = false
     hostname         = "lb4"
     name             = "lb4"
     port             = 8080
     waf_name         = "non-standard"
  }
]
