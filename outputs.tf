output "terraform_backend_dynamodb_name" {
  value = module.state_lock.name
}

output "terraform_backend_s3_id" {
  value = module.backend.resource
}
