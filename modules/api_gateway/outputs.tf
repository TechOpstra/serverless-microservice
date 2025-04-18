# api_gateway/outputs.tf
output "api_gateway_url" {
  value = aws_api_gateway_rest_api.user_api.execution_arn
}
