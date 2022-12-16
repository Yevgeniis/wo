#define Terraform provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.46.0"
    }
  }
}


#define GCP provider
provider "google" {
  # Configuration options
  project = var.gcp_project
  region = var.gcp_region
  zone = var.gcp_zone_a
  credentials = file(var.gcp_auth_file)
  
}


