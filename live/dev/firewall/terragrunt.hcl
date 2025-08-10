terraform {
  source = "git::https://github.com/GoogleCloudPlatform/terraform-google-network.git//modules/firewall-rules?ref=v7.1.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id   = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals.project_id
  network      = "dev-vpc"
  rules = [
    {
      name                    = "allow-ssh"
      description             = "Allow SSH from anywhere"
      direction               = "INGRESS"
      priority                = 1000
      ranges                  = ["0.0.0.0/0"]
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
    }
  ]
}
