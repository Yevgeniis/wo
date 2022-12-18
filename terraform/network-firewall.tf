# allow ICMP Protocol

resource "google_compute_firewall" "allow-icmp" {

    name = "${var.app_name}-${var.environment}-allow-icmp"
    network = google_compute_network.vpc.name
    allow {
      protocol = "icmp"
    }
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["icmp"]
}

# allow ssh
resource "google_compute_firewall" "allow-ssh" {
    name = "${var.app_name}-${var.environment}-allow-ssh"
    network = google_compute_network.vpc.name
    allow {
        protocol = "tcp"
        ports = ["22"]       
    } 
    source_ranges = ["0.0.0.0/0"] 
    target_tags = ["ssh"]
}


# allow http
resource "google_compute_firewall" "allow-http" {
    name = "${var.app_name}-${var.environment}-allow-http"
    network = google_compute_network.vpc.name
    allow {
        protocol = "tcp"
        ports = ["80"]       
    } 
    source_ranges = ["0.0.0.0/0"] 
    target_tags = ["http"]
}



# allow mongo
resource "google_compute_firewall" "allow-mongo" {
    name = "${var.app_name}-${var.environment}-allow-mongo"
    network = google_compute_network.vpc.name
    allow {
        protocol = "tcp"
        ports = ["27017"]       
    } 
    source_ranges = ["${var.network-subnet-cidr}","${google_container_cluster.gke-cluster.cluster_ipv4_cidr}"] 
    target_tags = ["mongo"]
}