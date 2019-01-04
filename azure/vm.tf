variable name {}

variable location {}

#variable puppetpkg {}

variable puppetin {}

provider "azurerm" {}

resource "azurerm_resource_group" "test" {
  name = "${var.name}"
  location = "${var.location}"
} 

resource "azurerm_virtual_network" "main" {
  name                = "puppet-VNET"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_subnet" "internal" {
  name = "${var.name}-subnet"
  address_prefix = "10.0.0.0/16" 
  resource_group_name = "${var.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
}

resource "azurerm_public_ip" "test" {
  name = "${var.name}-ip"
  resource_group_name = "${var.name}"
  location            = "${azurerm_resource_group.test.location}"
  public_ip_address_allocation = "dynamic"
  depends_on = ["azurerm_subnet.internal"]
}

resource "azurerm_network_interface" "test" {
  name = "${var.name}-nic"
  resource_group_name = "${var.name}"
  location = "${var.location}"
  depends_on = ["azurerm_public_ip.test"]

  ip_configuration {
   name = "${var.name}-ip"
   subnet_id = "${azurerm_subnet.internal.id}"
   public_ip_address_id = "${azurerm_public_ip.test.id}"
   private_ip_address_allocation = "dynamic"
 }
}

resource "azurerm_virtual_machine" "test" { 
  name = "${var.name}-vm" 
  resource_group_name = "${var.name}" 
  location = "${var.location}"
  network_interface_ids = ["${azurerm_network_interface.test.id}"]
  vm_size = "Standard_D2s_v3"
  depends_on = ["azurerm_network_interface.test"]

storage_image_reference {
  publisher = "Canonical" 
  offer = "UbuntuServer"
  sku = "16.04-LTS"
  version = "latest"
}

storage_os_disk {
  name = "disk1"
  create_option = "FromImage" 
}

os_profile_linux_config {
  disable_password_authentication = "false"
}

os_profile {
  computer_name = "${var.name}-vm"
  admin_username = "rony"
  admin_password = "rony@123456789"
} 
}
#data azurerm_public_ip "machineip" {
#  name = "${var.name}-vm" 
#  resource_group_name = "${var.name}" 
#  depends_on = ["azurerm_virtual_machine.test"]
#}

resource "azurerm_virtual_machine_extension" "test" {
  name = "${var.name}-vm" 
  resource_group_name = "${var.name}" 
  location = "${var.location}"
  virtual_machine_name = "${var.name}-vm" 
  publisher = "Microsoft.Azure.Extensions"
  type = "CustomScript"
  type_handler_version = "2.0"
  depends_on = ["azurerm_virtual_machine.test"]
  settings = <<SETTINGS
  {
    "fileUris" : ["https://raw.githubusercontent.com/punedhir/Terraform/master/azure/${var.puppetin}.sh"]
  }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute" : "bash ${var.puppetin}.sh" 
  }
PROTECTED_SETTINGS
}



#    "fileUris" : "https://github.com/punedhir/Terraform/blob/master/azure/${var.puppetin}.sh"
#    "commandToExecute" : "bash ${var.puppetin}.sh" 





