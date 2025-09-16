

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "frontend_vm_name" {
  description = "The name of the resource group."
  type        = string
}





variable "location" {
  description = "The location of the resource group."
  type        = string

}

variable "vm_size_frontend" {
  description = "The size of the frontend virtual machine."
  type        = string

}
variable "nic_id" {}


variable "os_image_publisher" {
  description = "The publisher of the OS image for the virtual machine."
  type        = string

}

variable "os_image_offer" {
  description = "The offer of the OS image for the virtual machine."
  type        = string

}

variable "os_image_sku" {
  description = "The SKU of the OS image for the virtual machine."
  type        = string

}

variable "os_image_version" {
  description = "The version of the OS image for the virtual machine."
  type        = string
  default     = "latest"
}

variable "admin_username" {}
variable "admin_password" {}

#NIC Details





variable "frontend_subnet_name" {
  description = "The name of the frontend subnet."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP address."
  type        = string

}

#datablock
variable "keyvault_name" {}


# variable "kvsecret_usr" {}
# variable "kvsecret_pwd" {}