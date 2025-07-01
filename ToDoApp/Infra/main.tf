# This Terraform configuration file sets up the infrastructure for the ToDo application on Azure.
# It creates a resource group, virtual network, subnet, public IP, virtual machine, SQL server, and SQL database.


module "rgname" {
  source = "../Modules/azurerm_resource_group"
  resource_group_name = "todogauri"
  resource_group_location = "East US"
}

module "vnet" {
    depends_on = [ module.rgname ]
    source = "../Modules/azurerm_virtual_network"
    virtual_network_name = "todogauri-vnet"
    virtual_network_location = "East US"
    resource_group_name = "todogauri"
    address_space = ["10.0.0.0/16"]
}

module "subnet" {
    depends_on = [ module.vnet ]
    source = "../Modules/azurerm_subnet"
    subnet_name = "todogauri-subnet"
    resource_group_name = "todogauri"
    virtual_network_name = "todogauri-vnet"
    address_prefixes = ["10.0.1.0/24"]
}

module "pip" {
    source = "../Modules/azurerm_publicip"
    public_ip_name = "todogauri-pip"
    resource_group_name = "todogauri"
    location = "East US"
    allocation_method = "Static"
}

module "frontend_vm" {
    depends_on = [ module.subnet]
    source = "../Modules/azurerm_virtual_machine"
    resource_group_name = "todogauri"
    vm_name = "todogauri-frontend-vm"
    vm_location = "East US"
    vm_size = "Standard_B1s"
    nic_name = "todogauri-nic"
    nic_location = "East US"
    subnet_id = "/subscriptions/1ecb1540-18db-4ab8-9eac-659a71d4a5f7/resourceGroups/todogauri/providers/Microsoft.Network/virtualNetworks/todogauri-vnet/subnets/todogauri-subnet"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd1234!"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-jammy"  
    image_sku = "22_04-lts"
    image_version = "latest"

}
module "sql_server" {
    source = "../Modules/azurerm_sql_server"
    server_name = "todogauri-sqlserver1"
    resource_group_name = "todogauri"
    location = "Central US"
    administrator_login = "username"
    administrator_login_password = "Password@123"
  
}
module "sql_database" {
    depends_on = [ module.sql_server ]
    source = "../Modules/azurerm_sql_database"
    database_name = "todogauri-sqldb"
    server_id = "/subscriptions/1ecb1540-18db-4ab8-9eac-659a71d4a5f7/resourceGroups/todogauri/providers/Microsoft.Sql/servers/todogauri-sqlserver1"
}
