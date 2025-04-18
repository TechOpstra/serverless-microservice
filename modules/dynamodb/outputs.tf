# dynamodb/outputs.tf
output "dynamodb_table_name" {
  value = aws_dynamodb_table.user_data.name
}