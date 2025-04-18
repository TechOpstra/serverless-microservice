
variable "role_name" {
  description = "Name of the IAM role for Lambda functions"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy for Lambda functions"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  type        = string
}
