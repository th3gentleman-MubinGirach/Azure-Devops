provider "azurerm" {
  version = "=2.65.0"
  features {}
}


resource "azurerm_resource_group" "mubin" {
  name     = "mubin-resources"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                     = "mubingirach"
  resource_group_name      = azurerm_resource_group.mubin.name
  location                 = azurerm_resource_group.mubin.location
  sku                      = "Standard"
  admin_enabled            = true
 
}

resource "kubernetes_namespace" "mubin" {
  metadata {
    annotations = {
      name = "mubin-annotation"
    }

    labels = {
      mylabel = "demo"
    }

    name = "mubingirach"
  }
}
resource "azurerm_kubernetes_cluster" "mubin" {
  name                = "mubin-aks"
  location            = azurerm_resource_group.mubin.location
  resource_group_name = azurerm_resource_group.mubin.name
  dns_prefix          = "mubinsaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "standard_b2s"
    availability_zones = ["1", "2"]
    enable_auto_scaling = false
  }

   network_profile {
    load_balancer_sku  = "Standard"
    network_plugin     = "azure"
    network_policy     = "calico"
   }
   
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
