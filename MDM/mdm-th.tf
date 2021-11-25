module "connect_onboarding" {
  source = "philips-labs/connect-onboarding/hsdp"
  onboarding_iam_org_id = hsdp_iam_org.example_org.id
  provisioning_service_id = hsdp_iam_service.example_service.id
  admin_users = [for user in hsdp_iam_user.example_user: user.id]
  self_service_users = [for user in hsdp_iam_user.example_user: user.id]
}


resource "hsdp_connect_mdm_proposition" "testprop1" {
  name        = "FUNNYPRODUCT"
  description = "Terraform managed FUNNYPRODUCT proposition"
  organization_id = hsdp_iam_org.example_org.id
  status              = "ACTIVE"
  depends_on          = [module.connect_onboarding] 
}

