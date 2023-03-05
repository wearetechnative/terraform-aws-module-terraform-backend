variable "name" {
  description = "Name to allow this module to be deployed multiple times in the same account."
  type        = string
  default     = ""
}

variable "kms_key_arn" {
  description = "KMS key to use for encrypting EBS volumes."
  type        = string
  default     = null
}
