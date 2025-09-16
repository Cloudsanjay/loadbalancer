variable "nic_name" {
  description = "The name of the network interface."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resource group."
  type        = string

}

#datablock
variable "subnet_name" {}
variable "vnet_name" {}

