resource "aws_db_instance" "db_instance" {
  identifier           = var.identifier
  db_name              = var.db_name
  engine               = var.engine
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string).username
  password             = jsondecode(data.aws_secretsmanager_secret_version.credentials.secret_string).password
  port                 = var.db_port
  publicly_accessible = var.publicly_accessible
  skip_final_snapshot = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_id
  db_subnet_group_name   = var.db_subnet_group_name
}

data "aws_secretsmanager_secret_version" "credentials"{
  secret_id = var.secret_id
}
