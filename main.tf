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