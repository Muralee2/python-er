terraform {
  source = "${path_relative_from_include()}/../../modules/firewall"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  firewall_rules_file = "${get_repo_root()}/scripts/firewall.py"
}

inputs = {
  subnet              = "dev-subnet8"  # <-- Add your subnet here
  firewall_rules_file = "${get_repo_root()}/scripts/firewall.py"
}

