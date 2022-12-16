#define instance type
variable "instance_type" {
    type = string
    description = "VM instance type"
    default = "e2-medium" 
}

#define instance image
variable "instance_image" {
    type = string
    description = "VM image ubuntu-2204-lts"
    default = "ubuntu-2204-jammy-v20221206"
  
}



