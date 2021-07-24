resource "google_compute_instance" "controlnode" {
  count = var.control_nodes
  name         = "controlnode-${count.index}"
  machine_type = "e2-small"
  zone         = "europe-west4-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}
