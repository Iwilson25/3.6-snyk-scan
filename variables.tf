# variables.tf

# AWS region to deploy the Lambda
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

# Name of the Lambda function
variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "hello-world"
}

# Runtime (Python or Node)
variable "lambda_runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "python3.9"
}

# Environment variables for the Lambda
variable "lambda_environment" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default = {
    MESSAGE = "Hello, World!"
  }
}
