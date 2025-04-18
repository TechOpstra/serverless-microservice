
module "dynamodb" {
  source      = "./modules/dynamodb"
  table_name  = "UserData"
  tags        = {
    Environment = "dev"
  }
}

module "iam" {
  source             = "./modules/iam"
  role_name          = "lambda-role"
  policy_name        = "lambda-policy"
  dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
}

module "lambda" {
  source                  = "./modules/lambda"
  add_user_function_name  = "AddUserFunction"
  get_user_function_name  = "GetUserFunction"
  lambda_role_arn         = module.iam.lambda_role_arn
  add_user_zip_file       = "lambda_functions/add_user.zip"
  get_user_zip_file       = "lambda_functions/get_user.zip"
  dynamodb_table_name     = module.dynamodb.dynamodb_table_name
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  api_name            = "UserAPI"
  get_user_lambda_arn = module.lambda.get_user_lambda_arn
}
