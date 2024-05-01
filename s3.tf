module "backend" {
  source = "git@github.com:wearetechnative/terraform-aws-s3.git/?ref=41f66d2b2357c9cb0c64488eb92812c10d224823"

  name           = lower("terraform-state${local.name}")
  use_fixed_name = var.use_fixed_name
  kms_key_arn    = var.kms_key_arn
}
