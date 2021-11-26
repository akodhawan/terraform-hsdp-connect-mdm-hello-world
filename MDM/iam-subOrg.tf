resource "hsdp_iam_org" "example_org" {
  name          = "TF-IAM-${random_pet.deploy.id}"
  description   = "Example Sub Organization"
  parent_org_id = var.example_root_org
}

resource "hsdp_iam_role" "example_role" {
  name = upper("TF-IAM-${random_pet.deploy.id}")
  permissions = [
    "HSDP_IAM_ORGANIZATION.READ",
    "USER.READ"
  ]
  managing_organization = hsdp_iam_org.example_org.id
}

resource "hsdp_iam_user" "example_user" {
  for_each = { for staff in var.example_users : staff.email_id => staff }

  login           = each.value.email_id
  email           = each.value.email_id
  first_name      = each.value.first_name
  last_name       = each.value.last_name
  organization_id = hsdp_iam_org.example_org.id
}

resource "hsdp_iam_group" "example_group" {
  name                  = "TF-${random_pet.deploy.id}"
  roles                 = [hsdp_iam_role.example_role.id]
  users                 = concat([var.org_admin_username], [for user in hsdp_iam_user.example_user : user.id])
  managing_organization = hsdp_iam_org.example_org.id
}

resource "hsdp_iam_proposition" "example_prop" {
  name            = upper("TF-IAM-${random_pet.deploy.id}")
  description     = "Eaxmple Proposition"
  organization_id = hsdp_iam_org.example_org.id
}

resource "hsdp_iam_application" "example_app" {
  name           = upper("TF-IAM-${random_pet.deploy.id}")
  description    = "Example application"
  proposition_id = hsdp_iam_proposition.example_prop.id
}

resource "hsdp_iam_service" "example_service" {
  name           = "TF-IAM-${random_pet.deploy.id}"
  description    = "Example service"
  application_id = hsdp_iam_application.example_app.id

  validity = 12

  scopes         = ["openid"]
  default_scopes = ["openid"]
}
