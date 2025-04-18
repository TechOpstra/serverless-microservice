# lambda/outputs.tf
output "add_user_lambda_arn" {
  value = aws_lambda_function.add_user.arn
}

output "get_user_lambda_arn" {
  value = aws_lambda_function.get_user.arn
}
