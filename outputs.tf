output "key_id" {
  description = "The globally unique identifier for the key"
  value       = aws_kms_key.this.id
}

output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = aws_kms_key.this.arn
}

output "key_alias" {
  description = "Alias used to create KMS key"
  value       = aws_kms_alias.this.name
}
