
variable "subnet_name" {
  description = "The name of the frontend virtual machine."
  type        = string

}

variable "vnet_name" {
  description = "The name of the network interface."
  type        = string
}

variable "public_ip_name" {
  description = "The location of the network interface."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "nic_name" {
  description = "The name of the resource group."
  type        = string
}

# variable "nic_location" {
#   description = "The name of the resource group."
#   type        = string
# }


variable "bap_name" {}
variable "lb_name" {}
variable "ip_configuration_name" {}
