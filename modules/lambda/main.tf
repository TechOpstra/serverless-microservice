# lambda/main.tf
resource "aws_lambda_function" "add_user" {
  function_name = var.add_user_function_name
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = var.lambda_role_arn
  filename      = var.add_user_zip_file
  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
    }
  }
}

resource "aws_lambda_function" "get_user" {
  function_name = var.get_user_function_name
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = var.lambda_role_arn
  filename      = var.get_user_zip_file
  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table_name
    }
  }
}


