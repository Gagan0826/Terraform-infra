terraform {
  backend "s3" {
    bucket         = "terr-backend"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "MyLockTable"  
  }
}
