resource "azurerm_resource_group" "rgname" {
  name     = var.resource_group_name
  location = var.resource_group_location
}