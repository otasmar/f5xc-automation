
# Create Load Balancer
resource "volterra_http_loadbalancer" "http-lb" {
  for_each    = { for lb in var.loadbalancers : lb.name => lb }
  name        = each.value.name
  namespace   = var.namespace
  labels      = {}
  annotations = {}
  domains     = ["${each.value.hostname}-${var.namespace}.lab-app.f5demos.com"]
  http {
    dns_volterra_managed = each.value.dns_managed
    port                 = each.value.port
  }
  advertise_on_public_default_vip = each.value.advertise_public

  default_route_pools {
    pool {
      name      = "${var.namespace}-tf-pool"
      namespace = var.namespace
    }
    weight           = 1
    priority         = 1
    endpoint_subsets = {}
  }

  disable_api_definition = true
  app_firewall {
    name      = each.value.waf_name
    namespace = var.namespace
  }
  add_location                     = true
  no_challenge                     = true
  user_id_client_ip                = true
  disable_rate_limit               = true
  service_policies_from_namespace  = true
  round_robin                      = true
  disable_trust_client_ip_headers  = true
  disable_malicious_user_detection = true
  disable_api_discovery            = true
  disable_bot_defense              = true
  disable_ip_reputation            = true
  disable_client_side_defense      = true
  no_service_policies              = true
  source_ip_stickiness             = true
}