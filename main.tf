# Provides an alias for a KMS customer master key.
resource "aws_kms_alias" "this" {

  name          = "alias/${local.name}"
  target_key_id = aws_kms_key.this.key_id

  depends_on = [
    aws_kms_key.this
  ]

}

# Manages a single-Region or multi-Region primary KMS key.
resource "aws_kms_key" "this" {

  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  key_usage               = var.key_usage
  multi_region            = var.multi_region
  policy                  = data.aws_iam_policy_document.kms.json

  tags = {
    Name        = local.name
    Terraform   = "true"
    Resource    = "kms-key"
    Environment = var.environment
  }

}
