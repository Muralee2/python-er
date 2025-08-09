variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range of the subnet"
  type        = string
}

variable "region" {
  description = "Region where subnet will be created"
  type        = string
}
