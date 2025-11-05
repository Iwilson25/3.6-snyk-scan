# outputs.tf

output "lambda_function_name" {
  description = "The name of the deployed Lambda function"
  value       = aws_lambda_function.hello_world.function_name
}

output "lambda_function_arn" {
  description = "The ARN (Amazon Resource Name) of the Lambda function"
  value       = aws_lambda_function.hello_world.arn
}

output "lambda_invoke_arn" {
  description = "The Invoke ARN of the Lambda function (used for API Gateway integration)"
  value       = aws_lambda_function.hello_world.invoke_arn
}
