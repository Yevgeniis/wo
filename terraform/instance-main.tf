#create instance
resource "google_compute_instance" "vm_instance" {
  count = var.instance_number_vm
  name = "${var.app_name}-vm-${count.index}-${var.environment}"
  machine_type = var.instance_type
  zone = var.gcp_zone_a
  hostname = "${var.app_name}-vm-${count.index}.${var.domain}"
  tags = ["ssh","http","icmp","mongo"]
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
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -;
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list;
apt update -y;
apt install -y mongodb-org;
systemctl enable mongod;
EOF
}