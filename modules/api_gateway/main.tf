resource "aws_api_gateway_rest_api" "user_api" {
  name        = var.api_name
  description = "API Gateway for user data management"
}

resource "aws_api_gateway_resource" "user" {
  rest_api_id = aws_api_gateway_rest_api.user_api.id
  parent_id   = aws_api_gateway_rest_api.user_api.root_resource_id
  path_part   = "user"
}

# Method for retrieving user data (GET)
resource "aws_api_gateway_method" "get_user" {
  rest_api_id   = aws_api_gateway_rest_api.user_api.id
  resource_id   = aws_api_gateway_resource.user.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_user" {
  rest_api_id             = aws_api_gateway_rest_api.user_api.id
  resource_id             = aws_api_gateway_resource.user.id
  http_method             = aws_api_gateway_method.get_user.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = "${var.get_user_lambda_arn}/invocations"
}

# Method for adding user data (POST)
resource "aws_api_gateway_method" "add_user" {
  rest_api_id   = aws_api_gateway_rest_api.user_api.id
  resource_id   = aws_api_gateway_resource.user.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "add_user" {
  rest_api_id             = aws_api_gateway_rest_api.user_api.id
  resource_id             = aws_api_gateway_resource.user.id
  http_method             = aws_api_gateway_method.add_user.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = "${var.add_user_lambda_arn}/invocations"
}
