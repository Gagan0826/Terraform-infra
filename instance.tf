
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "name" {
  instance_type          = "t2.micro"
  ami                    = "ami-0f5ee92e2d63afc18"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  subnet_id              = aws_subnet.my_public_subnet.id
  associate_public_ip_address = true
  key_name               = "w1"
  tags = {
    Name = "test-rds"
  }
  }

