

  resource "aws_db_instance" "my_rds_db" {
  db_name              = var.db_name
  engine               = var.engine
  allocated_storage    = 20
  storage_type         = var.storage_type
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string).username
  password             = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string).password
  port                 = var.db_port
  publicly_accessible = false
  skip_final_snapshot= true
  vpc_security_group_ids = [aws_security_group.rds_private_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.private_db_subnet_group.name
}

data "aws_secretsmanager_secret_version" "credentials"{
  secret_id ="week-1-rds"
}



