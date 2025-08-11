resource "null_resource" "create_firewall" {
  provisioner "local-exec" {
    command = "python3 ${path.root}/scripts/firewall.py ${var.project_id} ${var.network} ${var.subnet}"
  }
}
