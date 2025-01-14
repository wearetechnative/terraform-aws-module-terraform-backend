module "backend" {
  source = "github.com/wearetechnative/terraform-aws-s3.git/?ref=945d79d5d12cbc2e281afae53c74367a3c6bfd6e"

  name           = lower("terraform-state${local.name}")
  use_fixed_name = var.use_fixed_name
  kms_key_arn    = var.kms_key_arn
}
