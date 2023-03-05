# Terraform AWS [Terraform Backend]

An S3 bucket with DynamoDB compatible for use as a Terraform Backend.

This module mostly enforces safe and known best practices:
- Use our S3 module with locked down permissions.
- Setup DynamoDB compatible for use in backend and using PAY PER REQUEST to minize cost.

In case multiple Terraform projects are used on the same account they should be differentiated by `var.name`. Creating seperate modules increases seperation without increasing cost because all resources are either pay per use by default (S3) or configured to do so (DynamoDB).

The KMS key should be provided externally as these incur a monthly 1 dollar cost. See `var.kms_key_arn` for this.

[![](we-are-technative.png)](https://www.technative.nl)

## How does it work

### First use when you cloned this repository

Run `pre-commit install` to install any guardrails implemented using pre-commit.

See [pre-commit installation](https://pre-commit.com/#install) on how to install pre-commit.

## Usage

This backendrole provides the TerraForm backend dynamodb and S3 bucket.

The role is used for any cross-account setups but should also be used for any inaccount setups as well when possible. Currently our landing-zone depends on this module. But we will also use if for stack accounts and perhaps later for inaccount landingzones as well.

To use this module:
1. The S3 bucket name is provided by the output `terraform_backend_s3_id`.
2. The DynamoDB name is provided by the output `terraform_backend_dynamodb_name`.

Example backend.tf file:

```json
terraform {
  backend "s3" {
    bucket = "See step 1)"
    key    = "terraform.tf"
    region = "eu-central-1"

    dynamodb_table = "See step 2)"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | git@github.com:TechNative-B-V/terraform-aws-module-s3.git/ | 3b39341b8f0ca25423f97ed3107411d6a4c6493f |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.state_lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS key to use for encrypting EBS volumes. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to allow this module to be deployed multiple times in the same account. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_backend_dynamodb_name"></a> [terraform\_backend\_dynamodb\_name](#output\_terraform\_backend\_dynamodb\_name) | n/a |
| <a name="output_terraform_backend_s3_id"></a> [terraform\_backend\_s3\_id](#output\_terraform\_backend\_s3\_id) | n/a |
<!-- END_TF_DOCS -->
