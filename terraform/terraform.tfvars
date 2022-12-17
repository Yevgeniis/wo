#application definition
app_name    = "wo-app-2"
environment = "test" # Dev, Test, Prod, etc
domain = "xarfa.local"

#GCP Settings
gcp_project   = "wo-app-371801"
gcp_region    = "europe-west1"
gcp_zone_a = "europe-west1-c"
gcp_auth_file = "keys.json"

#GCP Network
network-subnet-cidr = "10.10.10.0/24"

#Instance settings
instance_type = "e2-medium"
instance_image = "ubuntu-2204-jammy-v20221206"
instance_number_vm = "3"
