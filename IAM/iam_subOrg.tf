resource "hsdp_iam_org" "Example_Org" {
  name          = "EXAMPLE_SUB_ORG_TF"
  description   = "Example Sub Organization"
  parent_org_id = var.example_root_org
}