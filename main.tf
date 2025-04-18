# main.tf
module "dynamodb" {
  source      = "./modules/dynamodb"
  table_name  = "UserData"
  tags        = {
    Environment = "dev"
  }
}

module "lambda" {
  source                  = "./modules/lambda"
  add_user_function_name  = "AddUserFunction"
  get_user_function_name  = "GetUserFunction"
  lambda_role_arn         = "arn:aws:iam::123456789012:role/lambda-role"
  add_user_zip_file       = "path/to/add_user.zip"
  get_user_zip_file       = "path/to/get_user.zip"
  dynamodb_table_name     = module.dynamodb.dynamodb_table_name
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  api_name            = "UserAPI"
  get_user_lambda_arn = module.lambda.get_user_lambda_arn
}
