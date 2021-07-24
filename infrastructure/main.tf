resource "google_compute_network" "vcp" {
  name = "k8s-network"
}

resource "google_compute_firewall" "k8s_controlnode_rule" {
  name = "k8s-controlnode-rule"
  network = google_compute_network.vcp.name

  allow {
    protocol = "tcp"
    ports = ["6443", "2379-2380", "10250", "10251", "10252"]
  }

  target_tags = ["controlnode"]
}

resource "google_compute_firewall" "k8s_workernode_rule" {
  name = "k8s-workernode-rule"
  network = google_compute_network.vcp.name

  allow {
    protocol = "tcp"
    ports = ["10250", "30000-32767"]
  }

  target_tags = ["workernode"]
}

resource "google_compute_firewall" "default" {
  name = "default"
  network = google_compute_network.vcp.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}

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
    network = google_compute_network.vcp.name
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
    network = google_compute_network.vcp.name
    access_config {}
  }
}
