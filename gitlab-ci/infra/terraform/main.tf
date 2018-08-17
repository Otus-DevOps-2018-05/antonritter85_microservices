provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_compute_project_metadata" "default" {
  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_instance" "docker-instance" {
  name         = "docker-host-${count.index+1}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  count        = "${var.number_of_instances}"

  boot_disk {
    initialize_params {
      size  = "${var.disk_size}"
      image = "${var.disk_image}"
    }
  }

  tags = ["docker-machine", "http-server", "https-server"]

  network_interface {
    network = "default"

    access_config {}
  }
}

resource "google_compute_firewall" "firewall-puma" {
  name = "allow-puma-default"

  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["docker-machine"]
}

resource "google_compute_firewall" "default-allow-http" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "default-allow-https" {
  name    = "default-allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}
