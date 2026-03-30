resource "aws_s3_bucket" "demo" {
  bucket = "cicd-demo-${random_id.suffix.hex}"

  tags = {
    Project = "cicd-demo"
  }
}

resource "random_id" "suffix" {
  byte_length = 3
}