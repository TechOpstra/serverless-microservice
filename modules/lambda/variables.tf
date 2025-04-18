# lambda/variables.tf
variable "add_user_function_name" {
  description = "Name of the add user Lambda function"
  type        = string
}

variable "get_user_function_name" {
  description = "Name of the get user Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda functions"
  type        = string
}

variable "add_user_zip_file" {
  description = "Path to the ZIP file containing the add user Lambda function code"
  type        = string
}

variable "get_user_zip_file" {
  description = "Path to the ZIP file containing the get user Lambda function code"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}
