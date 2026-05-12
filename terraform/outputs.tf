# Output the Azure Resource Group name
output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

# Output the Azure Container Registry login server
output "acr_login_server" {
  value = azurerm_container_registry.main.login_server
}

# Output the AKS cluster name
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.main.name
}