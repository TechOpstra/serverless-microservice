# dynamodb/main.tf
resource "aws_dynamodb_table" "user_data" {
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "user_id"

  attribute {
    name = "user_id"
    type = "S"
  }

  tags = var.tags
}




