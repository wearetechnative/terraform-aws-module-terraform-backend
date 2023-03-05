module "iam_role" {
  count  = var.useraccount_account_id != null ? 1 : 0
  source = "./../identity_and_access_management/iam_role/"

  role_name = "TerraformBackendRole${local.name}"
  role_path = "/"

  customer_managed_policies = { "S3" : jsondecode(data.aws_iam_policy_document.terraforms3.json)
  "DynamoDB" : jsondecode(data.aws_iam_policy_document.terraformdynamodb.json) }

  trust_relationship = {
    "useraccount" : { "identifier" : var.useraccount_account_id, "identifier_type" : "AWS", "enforce_mfa" : true, "enforce_userprincipal" : true, "external_id" : null, "prevent_account_confuseddeputy" : false }
  }
}

data "aws_arn" "backend_s3" {
  arn = module.backend_s3.s3_arn
}

data "aws_iam_policy_document" "terraforms3" {
  statement {
    effect = "Allow"

    actions = ["s3:ListBucket"]

    resources = [module.backend_s3.s3_arn]
  }

  statement {
    effect = "Allow"

    actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]

    resources = ["${module.backend_s3.s3_arn}/*"]
  }
}

data "aws_iam_policy_document" "terraformdynamodb" {
  statement {
    effect = "Allow"

    actions = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]

    resources = [aws_dynamodb_table.terraformstatelock.arn]
  }
}
