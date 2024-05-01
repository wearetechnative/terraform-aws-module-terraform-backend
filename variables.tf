variable "name" {
  description = "Name to allow this module to be deployed multiple times in the same account."
  type        = string
  default     = ""
}

variable "add_name_prefix_to_dynamodb" {
  description = "To prefix the name to the Dynamodb table name."
  type        = bool
  default     = false
}

variable "kms_key_arn" {
  description = "KMS key to use for encrypting EBS volumes."
  type        = string
  default     = null
}

variable "use_fixed_name" {
  description = "Trigger to use fixed name instead of adding a random prefix."
  type        = string
  default     = false
}

