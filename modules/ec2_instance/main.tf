resource "aws_instance" "ec2_instance" {
  instance_type          = var.instance_type
  ami                    = var.ami
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  tags = var.instance_tags
   root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
}
resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2_instance.id
  vpc=true
}
resource "aws_eip_association" "demo-eip-association" {
  instance_id   = aws_instance.ec2_instance.id
  allocation_id = aws_eip.ec2_eip.id
}
