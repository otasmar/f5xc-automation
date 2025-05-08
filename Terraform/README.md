# F5XC HTTP LB

## Introduction

This sample Terraform creates a F5 Distributed Cloud HTTP Health Check, Origin Pool, and HTTP Load Balancer that advertises the resulting service on the Internet via the F5 Distributed Cloud Regional Edges REs. 

## Prerequisites
- A F5 Distributed Cloud account with API access.
- A F5 Distributed Cloud namespace to deploy in.
- An origin server(s) that is Publci DNS reachable by the REs.


## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.3.0 |

## Providers

| Name | Version |
|------|---------|
| volterra | ~> 0.11.29 |

## Inputs
| Name                       | Description | Type | Default |
| -----                      | ----------- | ---- | ------- | 
| api_api_p12 | REQUIRED: F5 Distributed Cloud API P12 certificate file path | string | /PATH/certificate.p12 |
| tenant_name | REQUIRED: F5 Distributed Cloud tenant ID | string | |
| namespace | REQUIRED: F5 Distributed Cloud namespace to deploy objects into | string | default |

## Outputs

## Deployment
For deployment you can use the traditional terraform commands.

```bash
terraform init
terraform plan
terraform apply
```

## Destruction

For destruction / tear down you can use the trafitional terraform commands.

```bash
terraform destroy
```
