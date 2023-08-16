
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "name" {
  instance_type          = var.instance_type
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  subnet_id              = aws_subnet.my_public_subnet.id
  associate_public_ip_address = true
  key_name               = var.key_name
  tags = {
    Name = "test-rds"
  }
  }

