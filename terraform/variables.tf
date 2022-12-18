#############################
#Provider variables
#############################
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



#####################################
#Network variables
#####################################

#define subnet cidr
variable "network-subnet-cidr" {
  type        = string
  description = "Network subnet"
}


#####################################
#Instance Variable
#####################################

#define instance type
variable "instance_type" {
    type = string
    description = "VM instance type"
}

#define instance image
variable "instance_image" {
    type = string
    description = "VM image"
  
}

#define instance number
variable "instance_number_vm" {
    type = string
    description = "How many vm's will be create"
}



