resource "azurerm_resource_group" "this" {
  count = var.create_resource_group ? 1 : 0

  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.create_resource_group ? azurerm_resource_group.this[0].name : var.resource_group_name

  sku_name = var.sku_name

  tenant_id = var.tenant_id == "" ? local.tenant_id : var.tenant_id

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  tags = var.tags
}

resource "azurerm_key_vault_access_policy" "this" {
  count = length(var.access_policies)

  key_vault_id = azurerm_key_vault.this.id

  tenant_id = var.tenant_id == "" ? local.tenant_id : var.tenant_id
  object_id = lookup(var.access_policies[count.index], "object_id") == "" ? local.object_id : lookup(var.access_policies[count.index], "object_id")

  key_permissions         = lookup(var.access_policies[count.index], "key_permissions")
  secret_permissions      = lookup(var.access_policies[count.index], "secret_permissions")
  certificate_permissions = lookup(var.access_policies[count.index], "certificate_permissions", null)
}
