output "terraform_backend_dynamodb_name" {
  value = aws_dynamodb_table.terraformstatelock.name
}

output "terraform_backend_s3_id" {
  value = data.aws_arn.backend_s3.resource
}
