variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "name" {
  description = "GKE cluster name"
  type        = string
}

variable "region" {
  description = "GKE cluster region (for regional cluster) or zone (for zonal cluster). See 'location' below."
  type        = string
}

variable "location" {
  description = "Cluster location (zone or region). For a zonal cluster set this to zone (eg us-central1-a). For regional set region (eg us-central1)."
  type        = string
}

variable "network_self_link" {
  description = "VPC network self link"
  type        = string
}

variable "subnet_self_link" {
  description = "Subnet self link"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}

variable "machine_type" {
  description = "GCE machine type for nodes"
  type        = string
  default     = "e2-medium"
}

variable "min_master_version" {
  description = "Optional master version"
  type        = string
  default     = null
}

variable "node_tags" {
  description = "Optional tags to apply to node VMs (list)"
  type        = list(string)
  default     = []
}

variable "enable_private_nodes" {
  description = "Whether to provision a private cluster"
  type        = bool
  default     = false
}
