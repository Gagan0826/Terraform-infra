resource "aws_security_group" "my_security_group" {
  vpc_id = var.vpc_id
  name   = var.name
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    from_port   = 31234
    to_port     = 31234
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 1080
    to_port     = 1080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["118.185.61.242/32", "175.111.128.155/32","103.6.90.178/32",
    "115.242.251.74/32","122.187.39.146/32","49.206.242.238/32","180.151.44.182/32","14.98.199.194/32","65.2.11.251/32"] 
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.rds_private_sg_id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

