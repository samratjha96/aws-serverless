resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
  "Statement": [
      {
        "Action": "sts:AssumeRole",
      "Principal": {
          "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "archive_file" "zipped_code" {
  type        = "zip"
  source_file = "${path.module}/../src/index.js"
  output_path = "${path.module}/../src/index.zip"
}

resource "aws_lambda_function" "cy-store-data" {
  filename         = "${path.module}/../src/index.zip"
  function_name    = "cy-store-data"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.zipped_code.output_base64sha256
  runtime          = "nodejs10.x"
  timeout          = 30
}

