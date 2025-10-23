module "state_lock" {
  source = "github.com/wearetechnative/terraform-aws-module-dynamodb.git?ref=391776786f83458afa156503fe7e70ab1019f514"

  name               = var.add_name_prefix_to_dynamodb == true ? "terraform-state-lock${local.name}" : "terraform-state-lock"
  kms_key_arn        = var.kms_key_arn
  partition_key      = "LockID"
  partition_key_type = "S"
}
