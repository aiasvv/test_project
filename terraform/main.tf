resource "google_compute_network" "vpc" {
  name                    = "vpc2"
  auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "aia" {
  name                     = "aia"
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  ip_cidr_range            = "10.0.2.0/24"
}

resource "google_compute_address" "ip" {
  name   = "instance-ip"
  region = var.region
}

resource "google_compute_instance" "instance" {
  name         = "instance"
  zone         = var.zone
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.aia.name
    access_config {}
  }

  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }

  tags = ["http-server", "https-server", "ssh-server"]
}

resource "google_compute_firewall" "allow_ssh" {
  project = var.project
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-server"]
}

resource "google_compute_firewall" "allow_http" {
  project = var.project
  name    = "allow-http"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "allow_https" {
  project = var.project
  name    = "allow-https"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}