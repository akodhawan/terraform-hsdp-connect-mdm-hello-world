variable "example_root_org" {
  description = "IAM organization (GUID) you want to onboard"
  type        = string
  validation {
    condition     = can(regex("^[{]?[0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12}[}]?$", var.example_root_org))
    error_message = "The example_root_org value must be a valid GUID."
  }
}

variable "oauth2_client_id" {
  description = "OAuth2 Client ID"
  type        = string
}
variable "oauth2_password" {
  description = "OAuth2 Client Password"
  type        = string
}
variable "org_admin_username" {
  description = "Org Admin User"
  type        = string
}
variable "org_admin_password" {
  description = "Org Admin Password"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "example_users" {
  description = "Example Users"
  type = list(object({
    email_id   = string
    first_name = string
    last_name  = string
  }))
}