output "demo_bucket" {
  description = "S3 bucket created by Terraform"
  value       = aws_s3_bucket.demo.bucket
}