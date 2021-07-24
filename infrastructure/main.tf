resource "google_compute_instance" "controlnode" {
  name         = "controlnode"
  machine_type = "e2-small"
  zone         = "europe-west4-a"

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
