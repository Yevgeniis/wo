# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "Auth file"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
}

# define GCP project name
variable "gcp_project" {
  type        = string
  description = "Project name"
}

# define GCP zone name
variable "gcp_zone_a" {
  type        = string
  description = "GCP zone"
}

#define application name
variable "app_name" {
  type = string
  description = "Application name"
  
}

#define environment variable for labels
variable "environment" {
  type = string
  description = "Environment dev,prod,test"

}

#define domain name
variable "domain" {
  type = string
  description = "domain"  
}