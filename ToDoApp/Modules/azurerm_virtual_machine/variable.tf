variable nic_name{
    description = "Name of the Network Interface"
    type        = string
}

variable "nic_location" {
    description = "Location of the Network Interface"
    type        = string
}

variable "resource_group_name" {
    description = "Name of the Resource Group"
    type        = string
}
variable "subnet_id" {
    description = "ID of the Subnet where the Network Interface will be created"
    type        = string
}
variable "vm_name" {
    description = "Name of the Virtual Machine"
    type        = string
}
variable "vm_location" {
    description = "Location of the Virtual Machine"
    type        = string
  
}
variable "vm_size" {
    description = "Size of the Virtual Machine"
    type        = string
  
}
variable "admin_username" {
    description = "Admin username for the Virtual Machine"
    type        = string
}
variable "admin_password" {
    description = "Admin password for the Virtual Machine"
    type        = string 
}

variable "image_publisher" {
    description = "Publisher of the VM image"
    type        = string
  
}
variable "image_offer" {
    description = "Offer of the VM image"
    type        = string
  
}
variable "image_sku" {
    description = "SKU of the VM image"
    type        = string
  
}
variable "image_version" {
    description = "Version of the VM image"
    type        = string
  
}