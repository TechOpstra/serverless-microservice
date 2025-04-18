
output "dynamodb_table_name" {
  value = aws_dynamodb_table.user_data.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.user_data.arn
}
