# create VPC
resource "google_compute_network" "wo-app-vpc" {
  name                    = "wo-app-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "wo-app-subnet" {
  name          = "wo-app-subnet"
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.wo-app-vpc.name
  region        = var.gcp_region
}