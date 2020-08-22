module "test-key-vault" {
  source = "../"

  resource_group_name = "testing-terraform-module"
  tags = {
    Department  = "007"
    Environment = "DEV"
    Terraform   = true
  }
  key_vault_name = "testing-007-key-vault"
  access_policies = [
    {
      object_id               = ""
      key_permissions         = ["get"]
      secret_permissions      = ["get"]
      certificate_permissions = []
      storage_permissions     = []
    },
    {
      object_id = "10000000-2000-3000-4000-500000000000"
      key_permissions = [
        "get",
        "list",
      ]
      secret_permissions = [
        "get",
        "list",
      ]
      certificate_permissions = [
        "get",
        "list",
      ]
    }
  ]
}
