variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "get_user_lambda_arn" {
  description = "ARN of the get user Lambda function"
  type        = string
}

variable "add_user_lambda_arn" {
  description = "ARN of the add user Lambda function"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}
