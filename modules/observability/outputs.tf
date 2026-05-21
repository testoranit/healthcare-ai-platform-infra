output "application_log_group" {
  value = aws_cloudwatch_log_group.application.name
}

output "audit_log_group" {
  value = aws_cloudwatch_log_group.audit.name
}
