terraform {
  source = "https://github.com/terraform-google-modules/terraform-google-network.git//modules/firewall-rules?ref=v7.1.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  network = "dev-vpc"

  rules = [
    {
      name        = "allow-ssh"
      description = "Allow SSH from anywhere"
      direction   = "INGRESS"
      priority    = 1000
      ranges      = ["0.0.0.0/0"]
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
    }
  ]
}


