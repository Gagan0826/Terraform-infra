variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  type        = string
  default     = "ami-0f5ee92e2d63afc18"
}

variable "key_name" {
  default="w1"
  type        = string
}


variable "db_name" {
  type        = string
  default     = "Employee_db"
}

variable "engine" {
  type        = string
  default     = "mysql"
}

variable "allocated_storage" {
  type        = number
  default     = 20
}

variable "storage_type" {
  type        = string
  default     = "gp2"
}

variable "engine_version" {
  type        = string
  default     = "8.0.33"
}

variable "instance_class" {
  type        = string
  default     = "db.t2.micro"
}


variable "db_port" {
  type        = number
  default     = 3306
}


