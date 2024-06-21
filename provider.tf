provider "aws" {
  region     = "us-east-1"
  # profile    = "default"
}
terraform {
  backend "s3" {
    bucket  = "test-atlantis-easydeploy"
    key     = "atlantis/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}