provider "fakewebservices" {
  hostname = var.fws_hostname
  token    = var.fake_token
}

terraform {
  required_providers {
    fakewebservices = {
      source  = "hashicorp/fakewebservices"
      version = "0.2.1"
    }
  }
}
