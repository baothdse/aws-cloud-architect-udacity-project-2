# Designate a cloud provider, region, and credentials
provider "aws" {
  access_key = "AKIASHG6BKSAQGXSFWEU"
  secret_key = "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"
  region = var.aws_region
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "greet_lambda.zip"
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_lambda_function" "greet_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "greet_lambda.zip"
  function_name = "Greet"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "greet_lamda.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.8"
}

resource "aws_cloudwatch_log_group" "greet_log" {
  name = "/aws/lambda/${aws_lambda_function.greet_lambda.function_name}"

  retention_in_days = 30
}
