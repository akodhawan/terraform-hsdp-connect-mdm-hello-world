data "hsdp_iam_org" "org" {
  organization_id = var.example_root_org
}

# data "hsdp_iam_service" "prov" {
#   service_id = "prov_serviceuser"
# }