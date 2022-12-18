#Create cluster
resource "google_container_cluster" "gke-cluster" {
  depends_on = [
    google_compute_network.vpc
  ]
  name     = "${var.app_name}-${var.environment}-gke-cluster"
  location = var.gcp_zone_a
  initial_node_count       = 1
  remove_default_node_pool = true
  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  project = var.gcp_project
  
  

}

#Create nodes in cluster
resource "google_container_node_pool" "wp_cluster_nodes" {
  name       = "${var.app_name}-${var.environment}-node-pool"
  location   = "${var.gcp_region}"
  cluster    = google_container_cluster.gke-cluster.id
  node_count = 2

  node_config {
    machine_type = "${var.instance_type}"
    disk_size_gb = 20
    disk_type = "pd-standard"
    labels = {
        env = "${var.environment}"
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
