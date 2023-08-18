resource "aws_nat_gateway" "ng" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id
}