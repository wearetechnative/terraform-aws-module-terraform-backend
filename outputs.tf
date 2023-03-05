output "terraform_backend_dynamodb_name" {
  value = module.state_lock.table_name
}

output "terraform_backend_s3_id" {
  value = module.backend.s3_bucket_name
}
