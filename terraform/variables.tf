variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "environment" {
  type = string
}

# Common resource tags
variable "common_tags" {
  type = map(string)

  default = {
    Environment = "Dev"
    Project     = "AKS-Store-Demo"
    ManagedBy   = "Terraform"
  }
}