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
    },
    {
      object_id = "30cd449f-c134-15e8-ad0f-189245e7f007"
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
