terraform {
  backend "s3" {
    bucket         = "magvector-terraform-state-051826742726"
    key            = "magvector/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
