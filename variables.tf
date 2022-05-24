variable "stack_prefix" {
  description = "The prefix of the fake webservices stack."
}

variable "server_count" {
  description = "The number of fakewebservices_server resources that will get provisioned."
}

variable "server_type" {
  description = "The server type."
}

variable "database_size" {
  description = "The allocated size of the database in gigabytes."
}

variable "vpc_cidr_block" {
  description = "The range of IPv4 addresses for this VPC, in the form of a Classless Inter-Domain Routing (CIDR) block."
}
