terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
    storage {
      data_plane_available = false
    }

    machine_learning {
      purge_soft_deleted_workspace_on_destroy = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}
