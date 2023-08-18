resource "aws_instance" "ec2_instance" {
  instance_type          = var.instance_type
  ami                    = var.ami
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  tags = var.instance_tags
}

