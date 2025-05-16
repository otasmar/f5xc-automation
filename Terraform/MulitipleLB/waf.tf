resource "volterra_app_firewall" "waf" {
  for_each = {
    for lb in var.loadbalancers : "${lb.name}-waf" => lb
  }

  name      = each.key
  namespace = var.namespace

  allow_all_response_codes     = true
  default_anonymization        = true
  use_default_blocking_page    = true
  default_bot_setting          = true
  default_detection_settings   = true
  blocking                     = true
}
