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

# resource "aws_instance" "web" {
#   # ami           = data.aws_ami.ubuntu.id
#   ami = "ami-0e001c9271cf7f3b9"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "terraform-atlantis"
#   }
# }
