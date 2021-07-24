resource "google_compute_instance" "controlnode" {
  count = var.control_nodes
  name         = "controlnode-${count.index}"
  machine_type = "e2-small"
  zone         = "europe-west4-a"

  tags = ["controlnode"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_compute_instance" "workernode" {
  count = var.worker_nodes
  name         = "workernode-${count.index}"
  machine_type = "e2-small"
  zone         = "europe-west4-a"

  tags = ["workernode"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
