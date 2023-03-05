module "backend_s3" {
  source = "./../s3"

  name        = "terraform-state${local.name}"
  kms_key_arn = var.kms_key_arn
}

resource "aws_kms_grant" "backend" {
  count = length(module.iam_role)

  name              = "terraform-s3-backend${local.name}"
  key_id            = var.kms_key_arn
  grantee_principal = module.iam_role[0].role_arn
  operations        = ["GenerateDataKey", "Decrypt"]
}


resource "aws_dynamodb_table" "terraformstatelock" {
  name           = "terraform-state-lock${local.name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
