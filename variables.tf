variable "instance_type" {
  type        = string
}

variable "ami" {
  type        = string
}

variable "key_name" {
  type        = string
}

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

variable "secret_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}