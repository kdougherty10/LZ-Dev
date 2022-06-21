## Declare Terraform version and providers
terraform {
  required_version = ">=1.1"
  required_providers {
    # aviatrix = {
    #   source = "AviatrixSystems/aviatrix"
    #   version = "=2.20.3"
    # }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.2.0"
    }
  }
  backend "azure" {
    resource_group_name = "terraform_infra"
    storage_account_name = "infrasdbxo1kj23lk1"
    container_name = "tfstate"
    key = "foundation.tfstate" 
  }
}

# provider "aviatrix" {
#   controller_ip           = "18.220.186.38"
#   username                = "admin"
#   password                = "Cummins123!"
#   skip_version_validation = false
#   #https://www.terraform.io/docs/providers/aviatrix/guides/release-compatibility.html
# }

provider "azurerm" {
  features {}
}

module "foundation" {
  source = "./modules/foundation"

  # location_identifier        = "az1"
  # environment                = "test"
  # workload_name              = "test"
  rg_name                     = "spoke_gateway_rg"
  vnet_name                   = "test-network1"
  address_space               = "10.10.0.0/16"
  location                    = "Central US"
  #spoke_account_name          = "aaron_azure_lab"
  #spoke_gateway_name          = "testspoke1"
  #spoke_gateway_size          = "Standard_D3_v2"
  #ha_gateway_size             = "Standard_D3_v2" # Set this as the same value as spoke_gateway_size
  #spoke_subnet                = "10.10.254.0/26"
  #ha_subnet                   = "10.10.254.0/26" # Set this as the same value as spoke_subnet
  #transit_gateway_name        = "lab-transit-east-west" # Use "AVX-PRD-CentralUS-Transit-East-West" for prod
  #transit_egress_gateway_name = "lab-transit-egress" # Use "AVX-PRD-CentralUS-Transit-Egress" for prod
}