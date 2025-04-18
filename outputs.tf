# outputs.tf
output "dynamodb_table_name" {
  value = module.dynamodb.dynamodb_table_name
}

output "add_user_lambda_arn" {
  value = module.lambda.add_user_lambda_arn
}

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}
