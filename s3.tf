module "backend_s3" {
  source   = "git@github.com:TechNative-B-V/terraform-aws-module-s3.git/?ref=3b39341b8f0ca25423f97ed3107411d6a4c6493f"

  name        = "terraform-state${local.name}"
  kms_key_arn = var.kms_key_arn
}
