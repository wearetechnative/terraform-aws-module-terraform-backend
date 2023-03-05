variable "name" {
  description = "Name to allow this module to be deployed multiple times in the same account."
  type        = string
  default     = ""
}

variable "useraccount_account_id" {
  description = "Useraccount account ID so we can setup trust for the TerraformBackendRole. Use null to not create this role."
  type        = string
}

variable "kms_key_arn" {
  description = "KMS key to use for encrypting EBS volumes."
  type        = string
  default     = null
}
