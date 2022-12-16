# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "Auth file"
  default = "keys.json"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region me-west-1"
  default = "me-west1"
}

# define GCP project name
variable "gcp_project" {
  type        = string
  description = "wo-app project name"
  default = "wo-app-371801"
}

# define GCP zone name
variable "gcp_zone_a" {
  type        = string
  description = "GCP zone me-west1-a"
  default = "me-west1-a"
}
