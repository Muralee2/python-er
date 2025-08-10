variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnetwork"
  type        = string
}
variable "node_pools" {
  description = "List of node pools configuration"
  type = list(object({
    name         = string
    machine_type = string
    node_count   = number
    min_count    = number
    max_count    = number
    disk_size_gb = number
    disk_type    = string
  }))
}
