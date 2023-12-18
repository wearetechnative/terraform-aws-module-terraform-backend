module "state_lock" {
  source   = "git@github.com:TechNative-B-V/terraform-aws-module-dynamodb.git/?ref=5fb90ad50328a36290b6572d5b56e9ff691e4385"

  name           = "terraform-state-lock${local.name}"
  kms_key_arn = var.kms_key_arn
  partition_key = "LockID"
  partition_key_type = "S"
  enable_backup = true
}
