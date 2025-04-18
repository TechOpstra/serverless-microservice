# dynamodb/variables.tf
variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "tags" {
  description = "Tags for the DynamoDB table"
  type        = map(string)
  default     = {}
}