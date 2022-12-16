

#create instance
resource "google_compute_instance" "vm_instance" {
  name = "${var.app_name}-vm-1-${var.environment}"
  machine_type = var.instance_type
  zone = var.gcp_zone_a
  hostname = "${var.app_name}-vm-1"
  tags = ["ssh","http","icmp"]
  allow_stopping_for_update = true
  
  labels = {
    "env" = "${var.environment}"
  }

  boot_disk {
    initialize_params {
      image = var.instance_image
      
    }
  }

  metadata_startup_script = data.template_file.linux-install-apache2.rendered

  network_interface {
    network = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {
      
    }
  }

}


# Bootstrapping Script to Install Apache
data "template_file" "linux-install-apache2" {
template = <<EOF
sudo apt-get update; 
sudo apt-get install -y apache2;
sudo systemctl start apache2;
sudo systemctl enable apache2;
EOF
}