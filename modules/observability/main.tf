resource "aws_cloudwatch_log_group" "application" {
  name              = "/healthcare-ai/${var.name}/application"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "audit" {
  name              = "/healthcare-ai/${var.name}/audit"
  retention_in_days = 90
}
