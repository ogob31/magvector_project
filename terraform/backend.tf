terraform {
  backend "s3" {
    bucket         = "magvector"
    key            = "magvector/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "magvector"
    encrypt        = true
  }
}
