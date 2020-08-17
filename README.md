# Introduction 

This Terraform module is used to create an [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/). This modules creates the following resources:

- A new resource group (optional) - if the `create_resource_group` variable is set to `true`
- An Azure Key Vault
- One or more access policies for the above key vault (each access policy requires `key_permissions` and `secret_permissions` along with an `object_id`)

# Getting Started

The [example](./example) folder contains a basic setup for using this module. In order to use a service principal, the following environment variables can be exported: 

```
export ARM_CLIENT_ID=xxx
export ARM_CLIENT_SECRET=xxx
export ARM_SUBSCRIPTION_ID=xxx
export ARM_TENANT_ID=xxx
```

The following example outputs will be populated after a `terraform apply`:
 
```
Outputs:

resource_group_id = /subscriptions/xxx/resourceGroups/testing-terraform-module
vault_id = /subscriptions/xxx/resourceGroups/testing-terraform-module/providers/Microsoft.KeyVault/vaults/testing-007-key-vault
vault_uri = https://testing-007-key-vault.vault.azure.net/
```

## Access Policies

Possible values to be set for `key_permissions` inside the `access_policies` variable: `backup`, `create`, `decrypt`, `delete`, `encrypt`, `get`, `import`, `list`, `purge`, `recover`, `restore`, `sign`, `unwrapKey`, `update`, `verify` and `wrapKey`.

Possible values to be set for `secret_permissions` inside the `access_policies` variable: `backup`, `delete`, `get`, `list`, `purge`, `recover`, `restore` and `set`.

Possible values to be set for `certificate_permissions` inside the `access_policies` variable:  `backup`, `create`, `delete`, `deleteissuers`, `get`, `getissuers`, `import`, `list`, `listissuers`, `managecontacts`, `manageissuers`, `purge`, `recover`, `restore`, `setissuers` and `update`.

# Terraform Docs

`terraform-docs md terraform-azurerm-key-vault/`

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | ~> 2.2 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_policies | Define Key Vault Access Policies. 'azurerm\_key\_vault\_access\_policy' requires 'key\_permissions' and 'secret\_permissions'. An empty 'object\_id' defaults to the current one. | <pre>list(object({<br>    object_id               = string<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>    certificate_permissions = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "certificate_permissions": [],<br>    "key_permissions": [<br>      "get"<br>    ],<br>    "object_id": "",<br>    "secret_permissions": [<br>      "get"<br>    ]<br>  }<br>]</pre> | no |
| create\_resource\_group | Controls if a new resource group should be created. | `bool` | `true` | no |
| enabled\_for\_deployment | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | `bool` | `false` | no |
| enabled\_for\_disk\_encryption | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| enabled\_for\_template\_deployment | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | `bool` | `false` | no |
| key\_vault\_name | Specifies the name of the Key Vault. | `string` | n/a | yes |
| location | Specifies the supported Azure location where the resource exists. | `string` | `"West Europe"` | no |
| resource\_group\_name | The name of the resource group in which to create the Key Vault. | `string` | n/a | yes |
| sku\_name | The Name of the SKU used for this Key Vault. Possible values: 'standard' or 'premium'. | `string` | `"standard"` | no |
| tags | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault (current tenant ID by default). | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_id | The resource group ID (empty if no new resource group is created). |
| vault\_id | The ID of the Key Vault. |
| vault\_uri | The URI of the Key Vault, used for performing operations on keys and secrets. |
