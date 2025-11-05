provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "lambda_exec" {
  name = "hello-world-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = { Service = "lambda.amazonaws.com" }
      Effect    = "Allow"
    }]
  })
}

resource "aws_lambda_function" "hello_world" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec.arn
  handler       = "main.lambda_handler"
  runtime       = var.lambda_runtime
  filename      = "${path.module}/lambda.zip"

  environment {
    variables = var.lambda_environment
  }

  # Enable AWS X-Ray tracing
  tracing_config {
    mode = "Active"
  }
}

resource "null_resource" "zip_lambda" {
  provisioner "local-exec" {
    command = "cd lambda && zip -r ../lambda.zip ."
  }
}
