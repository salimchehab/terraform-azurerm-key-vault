variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
  default     = "West Europe"
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault (current tenant ID by default)."
  type        = string
  default     = ""
}

variable "create_resource_group" {
  description = "Controls if a new resource group should be created."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "key_vault_name" {
  description = "Specifies the name of the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values: 'standard' or 'premium'."
  type        = string
  default     = "standard"
}

variable "enabled_for_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  default     = false
}

variable "bypass_network_acls" {
  description = "Boolean flag to specify if AzureServices traffic can bypass the network rules."
  type        = bool
  default     = false
}

variable "allow_default_action_network_acls" {
  description = "Boolean flag to use 'Allow' as the Default Action when no rules match from ip_rules / virtual_network_subnet_ids."
  type        = bool
  default     = false
}

variable "network_acls_ip_rules" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  type        = list(string)
  default     = []
}

variable "network_acls_virtual_network_subnet_ids" {
  description = "One or more Subnet ID's which should be able to access this Key Vault."
  type        = list(string)
  default     = []
}

variable "access_policies" {
  description = "Define Key Vault Access Policies. 'azurerm_key_vault_access_policy' requires 'key_permissions' and 'secret_permissions'. An empty 'object_id' defaults to the current one."
  type = list(object({
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  default = []
}
