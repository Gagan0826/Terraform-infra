resource "aws_s3_bucket" "my_bucket" {
  bucket = "terr-bucket-backend-1"
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name = "My S3 Bucket"
  }
}
