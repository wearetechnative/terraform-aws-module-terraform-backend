resource "aws_dynamodb_table" "terraformstatelock" {
  name           = "terraform-state-lock${local.name}"
  billing_mode   = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
