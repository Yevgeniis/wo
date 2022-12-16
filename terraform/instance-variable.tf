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



