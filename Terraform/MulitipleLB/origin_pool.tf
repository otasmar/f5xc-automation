# Create Health Check for each Load Balancer
resource "volterra_healthcheck" "http_health_check" {
  for_each  = { for lb in var.loadbalancers : lb.name => lb }

  name      = "${each.key}-http-hc"
  namespace = var.namespace

  http_health_check {
    use_origin_server_name = true
    path                   = "/"
    use_http2              = false
    expected_status_codes  = ["200"]
  }

  timeout             = 3
  interval            = 15
  unhealthy_threshold = 1
  healthy_threshold   = 3
  jitter_percent      = 30
}

# Create Origin Pool for each Load Balancer
resource "volterra_origin_pool" "origin_pool" {
  for_each  = { for lb in var.loadbalancers : lb.name => lb }

  name      = "${each.key}-origin-pool"
  namespace = var.namespace

  origin_servers {
    public_name {
      dns_name = "${each.value.hostname}"
    }
    labels = {}
  }

  use_tls {
    use_host_header_as_sni = true
    tls_config {
      default_security = true
    }
    volterra_trusted_ca = true
    no_mtls             = true
  }

  port                  = 443
  same_as_endpoint_port = true

  healthcheck {
    name      = volterra_healthcheck.http_health_check[each.key].name
    namespace = var.namespace
  }

  loadbalancer_algorithm = "LB_OVERRIDE"
  endpoint_selection     = "LOCALPREFERED"
}
