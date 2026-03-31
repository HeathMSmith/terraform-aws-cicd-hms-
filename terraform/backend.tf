terraform {
  backend "s3" {
    bucket = "hms-cicd-tf-state"
    key = "cicd/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-locks"
  }
}