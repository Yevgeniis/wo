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