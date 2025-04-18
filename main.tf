terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.94.1"
    }
  }
}

provider "aws" {
  region = var.region
}


module "dynamodb" {
  source      = "./modules/dynamodb"
  table_name  = var.dynamodb_table_name
  tags        = var.tags
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
  add_user_zip_file       = var.add_user_zip_file
  get_user_zip_file       = var.get_user_zip_file
  dynamodb_table_name     = module.dynamodb.dynamodb_table_name
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  api_name            = var.api_name
  get_user_lambda_arn = module.lambda.get_user_lambda_arn
  add_user_lambda_arn = module.lambda.add_user_lambda_arn
}
