module "connect_onboarding" {
  source = "philips-labs/connect-onboarding/hsdp"

  onboarding_iam_org_id = hsdp_iam_org.example_org.id
  provisioning_service_id = hsdp_iam_service.deserve_service.id
  admin_users = [for user in hsdp_iam_user.institute_user: user.id]
  self_service_users = [for user in hsdp_iam_user.institute_user: user.id]
}

