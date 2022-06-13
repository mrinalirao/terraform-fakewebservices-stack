# terraform-fakewebservices-stack

This module provisions "resources" to a fictitious cloud provider, using the ["Fake Web Services"](https://github.com/hashicorp/terraform-provider-fakewebservices) Terraform provider.

These resources are purely for demonstration purposes and are created in Terraform Cloud using an API token.

## Installation & Usage

1. [Create a user or team API token in Terraform Cloud/Enterprise](https://www.terraform.io/docs/cloud/users-teams-organizations/api-tokens.html), and use the token in the provider configuration block.

1. Declare the required configuration and `terraform init` will automatically fetch and install the provider for you from the [Terraform Registry](https://registry.terraform.io/).

## Example Configuration

**terraform.tf**
```hcl
terraform {
  required_providers {
    fakewebservices = {
      source  = "hashicorp/fakewebservices"
      version = "0.2.3"
    }
  }
}
```

**provider.tf**
```hcl
provider "fakewebservices" {
  hostname = var.fws_hostname
  token    = var.fake_token
}
```

**variables.tf**
```hcl
variable "fws_hostname" {
  type        = string
  description = "The Terraform Cloud/Enterprise hostname that will be used in the provider configuration block."
}

variable "fake_token" {
  type        = string
  sensitive   = true
  description = "The Terraform Cloud/Enterprise user/team token that will be used in the provider configuration block."
}

variable "server_count" {
    description = "The number of fakewebservices_server resources that will get provisioned."
}
```

**main.tf**
```hcl
module "stack" {
  source         = "aqitio/stack/fakewebservices"
  version        = "0.0.2"
  stack_prefix   = "ENV"
  server_count   = var.server_count
  server_type    = "t2.micro"
  database_size  = 256
  vpc_cidr_block = "0.0.0.0/1"
}
```
