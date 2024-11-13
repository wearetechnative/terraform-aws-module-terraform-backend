module "backend" {
  source = "git@github.com:wearetechnative/terraform-aws-s3.git/?ref=2df300694acecd8ca62330a039b4a25eae20b07d"

  name           = lower("terraform-state${local.name}")
  use_fixed_name = var.use_fixed_name
  kms_key_arn    = var.kms_key_arn
}
