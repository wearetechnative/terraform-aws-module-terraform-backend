module "backend_s3" {
  source = "./../s3"

  name        = "terraform-state${local.name}"
  kms_key_arn = var.kms_key_arn
}
