# Create Azure Resource Group
# All Azure resources for this project will be deployed inside this resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.common_tags
}

# Create Azure Container Registry (ACR)
# ACR will store Docker images for the AKS microservices application
resource "azurerm_container_registry" "main" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "Basic"
  tags                = var.common_tags

  # Disable admin user for better security
  admin_enabled = false
}

# Create Azure Kubernetes Service (AKS) Cluster
# AKS will run the microservices application containers
resource "azurerm_kubernetes_cluster" "main" {
  name                = var.aks_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "aksstoredemo"

  # Use two small nodes to run all microservices with reasonable cost
  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
  }

  # Enable System Assigned Managed Identity for the AKS cluster
  identity {
    type = "SystemAssigned"
  }
  tags = var.common_tags
}

# Assign AcrPull role to AKS kubelet identity
# This permission allows AKS nodes to pull Docker images from Azure Container Registry
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.main.id
}
