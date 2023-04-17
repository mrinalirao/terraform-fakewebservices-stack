resource "fakewebservices_vpc" "vpc" {
  name       = upper("${var.stack_prefix}_VPC")
  cidr_block = var.vpc_cidr_block
}

resource "fakewebservices_server" "server" {
  count = var.server_count

  name = upper("SRV_${var.stack_prefix}_${count.index + 1}")
  type = var.server_type
  vpc  = fakewebservices_vpc.vpc.name

  lifecycle {
    postcondition {
      condition     = self.type == "t2.micro"
      error_message = "The fakewebservices_server server type is invalid"
    }
  }
}

resource "fakewebservices_load_balancer" "load_balancer" {
  name    = upper("${var.stack_prefix}_LB")
  servers = fakewebservices_server.server[*].name
}

resource "fakewebservices_database" "database" {
  name = upper("${var.stack_prefix}_DB")
  size = var.database_size
}
