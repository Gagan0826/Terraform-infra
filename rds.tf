

  resource "aws_db_instance" "my_rds_db" {
  db_name              = "Employee_db"
  engine               = "mysql"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine_version       = "8.0.33"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "Password!"
  port                 = 3306
  publicly_accessible = false
  skip_final_snapshot= true
  vpc_security_group_ids = [aws_security_group.rds_private_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.private_db_subnet_group.name
}
