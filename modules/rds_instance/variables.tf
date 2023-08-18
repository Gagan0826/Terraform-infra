variable "identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "engine" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "storage_type" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_port" {
  type = number
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "vpc_security_group_id" {
  type = list(string)
}

variable "db_subnet_group_name" {
  type = string
}

variable "secret_id" {
  type = string
}
