instance_type       = "t2.medium"
ami                 = "ami-0f5ee92e2d63afc18"
key_name            = "w1"


db_name             = "employee_db"
engine              = "mysql"
allocated_storage   = 20
storage_type        = "gp2"
engine_version      = "8.0.33"
instance_class      = "db.t2.micro"
db_port             = 3306
secret_id           = "week-1-rds"
identifier          = "employee-rds"