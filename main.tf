provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket         = "terr-bucket-backend-1"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "MyLockTable"  
  }
}
module "ec2_instance" {
  source          = "./modules/ec2_instance"
  instance_type   = var.instance_type
  ami             = var.ami
  key_name        = var.key_name
  vpc_security_group_ids=[module.security_group.security_group_id]
  subnet_id= module.public_subnet.my_public_subnet_id
  
  instance_tags = {
    Name = "web-host"
  }
}

 module "vpc"{
  source="./modules/vpc"
  cidr_block= "192.0.0.0/16"
 }

 module "public_subnet"{
  source="./modules/public_subnets"
  vpc_id  = module.vpc.vpc_id
  cidr_block="192.0.0.0/24"
  availability_zone="ap-south-1a"
  name="my-public-subnet"
 }

module "security_group"{
  source="./modules/security_group"
  vpc_id=module.vpc.vpc_id
  name="py-app-deploy-sg"
  rds_private_sg_id=module.rds_private_sg.security_group_id
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}
module "elastic_ip" {
  source = "./modules/elastic_ip"
}
module "nat_gateway" {
  source = "./modules/nat_gateway"
  allocation_id= module.elastic_ip.elastic_ip_id
  subnet_id     = module.public_subnet.my_public_subnet_id
}

module "public_route_table" {
  source = "./modules/route_tables/public_route_table"
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

module "private_route_table" {
  source = "./modules/route_tables/private_route_table"
  vpc_id = module.vpc.vpc_id
  nat_gateway_id=module.nat_gateway.nat_gateway_id
}

module "private_subnet_1" {
  source = "./modules/private_subnets/private_subnet_1"
  vpc_id = module.vpc.vpc_id
  cidr_block = "192.0.1.0/24"
  availability_zone = "ap-south-1a"
}
module "private_subnet_2" {
  source = "./modules/private_subnets/private_subnet_2"
  vpc_id = module.vpc.vpc_id
  cidr_block = "192.0.2.0/24"
  availability_zone = "ap-south-1b"
}

module "private_subnet_association" {
  source = "./modules/route_table_association/private_subnet_association"
  subnet_id = module.private_subnet_1.private_subnet_id
  route_table_id = module.private_route_table.private_route_table_id
}
module "public_subnet_association" {
  source = "./modules/route_table_association/public_subnet_association"
  subnet_id = module.public_subnet.my_public_subnet_id
  route_table_id = module.public_route_table.public_route_table_id
}

module "private_route_to_nat" {
  source = "./modules/private_route_to_nat"
  route_table_id = module.private_route_table.private_route_table_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
}

module "rds_private_sg" {
  source = "./modules/security_group/rds_private_sg"
  vpc_id = module.vpc.vpc_id
  name="rds_private_sg"
}

module "private_db_subnet_group" {
  source = "./modules/db_subnet_groups"
  subnet_ids = [module.private_subnet_1.private_subnet_id, module.private_subnet_2.private_subnet_id]
  name="db_subnet"
}

module "my_rds_db" {
  source              = "./modules/rds_instance"
  identifier          = var.identifier
  db_name             = var.db_name
  engine              = var.engine
  storage_type        = var.storage_type
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  db_port             = var.db_port
  allocated_storage   = var.allocated_storage
  db_subnet_group_name = module.private_db_subnet_group.name
  vpc_security_group_id = [module.rds_private_sg.security_group_id]
  secret_id=var.secret_id
}
