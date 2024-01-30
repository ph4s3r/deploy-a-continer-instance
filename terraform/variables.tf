variable "subnet_id" {
  type  = string
  description = "allocate ACI private IP in this subnet. The subnet must have a delegation to Microsoft.ContainerInstance service Example: .../virtualNetworks/vnet-dmz-etwasnet-test/subnets/DefaultSubnet"
}

variable "location" {
  type  = string
  description = "azure region to provision resources"
}

variable "rgname" {
  type  = string
  description = "resource group name to deploy resources"
}