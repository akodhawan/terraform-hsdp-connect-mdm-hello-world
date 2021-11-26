resource "random_pet" "deploy" {
}

module "connect_onboarding" {
  source                  = "philips-labs/connect-onboarding/hsdp"
  onboarding_iam_org_id   = hsdp_iam_org.example_org.id
  provisioning_service_id = hsdp_iam_service.example_service.id
  admin_users             = concat([var.org_admin_username], [for user in hsdp_iam_user.example_user : user.id])
  self_service_users      = concat([var.org_admin_username], [for user in hsdp_iam_user.example_user : user.id])
}


resource "hsdp_connect_mdm_proposition" "testprop1" {
  name            = "TF-MDM-${random_pet.deploy.id}"
  description     = "Terraform managed ${random_pet.deploy.id} proposition"
  organization_id = hsdp_iam_org.example_org.id
  status          = "ACTIVE"
  depends_on      = [module.connect_onboarding]
}

resource "hsdp_connect_mdm_application" "testapp1" {
  name           = "TF-MDM-${random_pet.deploy.id}"
  proposition_id = hsdp_connect_mdm_proposition.testprop1.id
}

resource "hsdp_connect_mdm_device_group" "testgroup1" {
  name           = "TF-MDM-${random_pet.deploy.id}"
  description    = "A funny-product device group"
  application_id = hsdp_connect_mdm_application.testapp1.id
}

resource "hsdp_connect_mdm_device_type" "testdevicetype1" {
  name                   = "TF-MDM-${random_pet.deploy.id}"
  description            = "WEARABLE0001"
  commercial_type_number = "WATCH1"
  device_group_id        = hsdp_connect_mdm_device_group.testgroup1.id
  custom_type_attributes = {
    position = "wrist"
    region   = "eu"
  }
}

resource "hsdp_connect_mdm_oauth_client" "testclient1" {
  name                = "TF-MDM-${random_pet.deploy.id}"
  description         = "Test client"
  application_id      = hsdp_connect_mdm_application.testapp1.id
  global_reference_id = "c105f8c2-d62c-4d9f-8810-50adbd883ca8"

  scopes         = []
  default_scopes = []

  redirection_uris = [
  ]

  response_types = ["code", "code id_token"]

  user_client = true
}
