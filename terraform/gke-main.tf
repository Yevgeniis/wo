

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


resource "google_container_node_pool" "wp_cluster_nodes" {
  name       = "${var.app_name}-${var.environment}-node-pool"
  location   = "${var.gcp_region}"
  cluster    = google_container_cluster.gke-cluster.id
  node_count = 1

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



resource "null_resource" "update_kubeconfig"  {
depends_on = [
    google_container_node_pool.wp_cluster_nodes
  ]
	provisioner "local-exec" {
        command = <<EOF
     	 gcloud container clusters get-credentials ${google_container_cluster.gke-cluster.name} --zone ${google_container_cluster.gke-cluster.location} --project ${var.gcp_project}
         kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/cloud/deploy.yaml
       sleep 5
       EOF
    
    interpreter = ["bash","-c"]
  	}
}


resource "null_resource" "deploy_kubernetes_code"  {
depends_on = [
    null_resource.install_ingress
  ]
	provisioner "local-exec" {
        command = <<EOF
     	 kubectl apply -f ../kubernetes/ 
       sleep 5
       EOF
    
    interpreter = ["bash","-c"]
  	}
}


resource "null_resource" "install_ingress"  {
depends_on = [
    null_resource.update_kubeconfig
  ]
	provisioner "local-exec" {
        command = <<EOF
         kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/cloud/deploy.yaml
       sleep 5
       EOF
    
    interpreter = ["bash","-c"]
  	}
}