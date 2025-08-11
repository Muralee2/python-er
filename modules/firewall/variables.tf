variable "network_name" {
  description = "Name of the network where firewall rules will be applied."
  type        = string
}

variable "firewall_rules" {
  description = "List of firewall rules."
  type = list(object({
    name          = string
    direction     = string
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
    target_tags   = list(string)
  }))
}
