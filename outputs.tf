output "resource_group_id" {
  description = "The resource group ID (empty if no new resource group is created)."
  value       = concat(azurerm_resource_group.this.*.id, [""])[0]
}

output "vault_id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.this.id
}

output "vault_uri" {
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
  value       = azurerm_key_vault.this.vault_uri
}
