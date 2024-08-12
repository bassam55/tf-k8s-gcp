provider "google" {
  project = "tuxedos-dev"
  region  = "us-central1"
  zone    = "us-central1-a"
}

data "template_file" "controller-data" {
  template = file("./ansible-controller.yaml")
}

# ## create ansible controller
# module "compute_instances" {
#   source = "./modules/Compute"
#
#
#   project_id    = "tuxedos-dev"
#   region        = "us-central1"
#   zone          = "us-central1-b"
#   instance_name = "ansible-controller"
#   machine_type  = "e2-medium"
#   disk_image    = "rhel-sap-cloud/rhel-8-10-sap-ha"
#   network       = "default"
#   tags          = ["web", "dev"]
# }

# create ansible managed nodes
module "compute_instances" {
  source = "./modules/Compute"

  for_each = {
    vm1 = "idm-server"
    vm2 = "idm-replica"
    vm3 = "idm-client"
  }

  project_id    = "tuxedos-dev"
  region        = "us-central1"
  zone          = "us-central1-a"
  instance_name = each.value
  machine_type  = "e2-medium"
  disk_image    = "ubuntu-os-cloud/ubuntu-2204-lts"
  network       = "default"
  tags          = ["web", "dev"]
  cloud_init_path = "./ansible-controller.yaml"
}

output "vm_names" {
  value = [for k, v in module.compute_instances : v.instance_name]
}
