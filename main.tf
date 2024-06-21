resource "aws_s3_bucket" "atlantis-bucket" {
    bucket = "test-atlantis-easydeploy"

    tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  
}


resource "aws_s3_bucket_versioning" "atlantis-bucket-versioning" {
    bucket = aws_s3_bucket.atlantis-bucket.id
    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "atlantis-bucket-encryption" {
    bucket = aws_s3_bucket.atlantis-bucket.id
    rule {
      apply_server_side_encryption_by_default {
        
      sse_algorithm  = "AES256"
        }
    }
    depends_on = [ aws_s3_bucket_versioning.atlantis-bucket-versioning ]
  
}

# resource "aws_instance" "web" {
#   # ami           = data.aws_ami.ubuntu.id
#   ami = "ami-0e001c9271cf7f3b9"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "terraform-atlantis"
#   }
# }