terraform {
  required_version = "= 1.10.1"

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "= 0.11.40"
    }
  }
}
provider "volterra" {
  api_p12_file = var.api_p12
  url          = "https://${var.tenant_name}.console.ves.volterra.io/api"
}


