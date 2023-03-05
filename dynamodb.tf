module "state_lock" {
  source   = "git@github.com:TechNative-B-V/terraform-aws-module-dynamodb.git/?ref=2016bbf331807b9832e3e9bc01ecd292bfefe5d3"

  name           = "terraform-state-lock${local.name}"
  kms_key_arn = var.kms_key_arn
  partition_key = "LockID"
  partition_key_type = "S"
}
