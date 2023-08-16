
terraform {
  backend "s3" {
    bucket         = "terr-bucket-backend-1"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "MyLockTable"  
  }
}
