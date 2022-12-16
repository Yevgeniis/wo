#define subnet cidr
variable "network-subnet-cidr" {
  type        = string
  description = "wo-app subnet"
  default = "10.10.10.0/24"
}


