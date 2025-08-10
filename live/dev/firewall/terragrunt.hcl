terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/firewall-rules?ref=v7.1.0"
}

include {
  path = find_in_parent_folders("terragrunt.hcl")
}

dependencies {
  paths = ["../network"]
}

inputs = {
  project_id = local.project_id
  network    = local.network_name

  rules = [
    {
      name                    = "allow-ssh"
      description             = "Allow SSH from anywhere"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = ["0.0.0.0/0"]
      allow                   = [{ protocol = "tcp", ports = ["22"] }]
      enable_logging          = true
    },
    {
      name                    = "allow-internal"
      description             = "Allow internal traffic"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = ["10.0.0.0/8"]
      allow                   = [{ protocol = "all" }]
      enable_logging          = true
    }
  ]
}

