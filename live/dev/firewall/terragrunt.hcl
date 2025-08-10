terraform {
  source = "terraform-google-modules/network/google//modules/firewall-rules?ref=v7.1.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id   = local.project_id
  network_name = local.network_name

  rules = [
    {
      name                    = "allow-ssh"
      direction               = "INGRESS"
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
      source_ranges           = ["0.0.0.0/0"]
      target_tags             = ["ssh-access"]
      priority                = 1000
      disabled                = false
    }
  ]
}

