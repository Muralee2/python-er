resource "google_compute_firewall" "allow_internal" {
  name    = "${var.network_name}-allow-internal"
  network = var.network_name  # just the name, e.g. "my-vpc"

  allow {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = var.network_name  # just the name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
