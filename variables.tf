
variable "region" {
  description = "region for the aws"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "UserData"
}

variable "lambda_role_arn" {
  description = "ARN of the IAM role for Lambda functions"
  type        = string
}

variable "add_user_zip_file" {
  description = "Path to the ZIP file containing the add user Lambda function code"
  type        = string
  default     = "modules/lambda_functions/get_user.zip"
}

variable "get_user_zip_file" {
  description = "Path to the ZIP file containing the get user Lambda function code"
  type        = string
  default     = "modules/lambda_functions/add_user.zip"
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "UserAPI"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {
    Environment = "dev"
  }
}
