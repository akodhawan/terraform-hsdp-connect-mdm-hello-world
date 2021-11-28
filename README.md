# terraform-hsdp-connect-mdm-hello-world

terraform-hsdp-connect-mdm-hello-world

## Requirements

| Name | Version |
|------|---------|
| hsdp | >= 0.26.0 |

## Providers

| Name | Version |
|------|---------|
| hsdp | >= 0.26.0 |


## How To

** Current State files are stored locally and preferred to have them stored in S3.
Check Store terraform state in S3
https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/guides/state

Preparation:

Based on `config/template.tfvars` create the local config file - example: `dev.tfvars`

Execute (from tf level):

```sh
terraform init
terraform plan --var-file=config/dev.tfvars
terraform apply --var-file=config/dev.tfvars
```


To Destroy reources:
```sh
terraform destroy --var-file=config/dev.tfvar
```

## Modules

No Modules.

## Resources

| Name |
|------|
| [hsdp_iam_org](https://registry.terraform.io/providers/philips-software/hsdp/0.14.1/docs/data-sources/iam_org) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|


## Outputs

No output.


# Contact / Getting help

Post your questions on the `#terraform` HSDP Slack channel

# License

License is MIT
