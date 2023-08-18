resource "aws_route" "rtn" {
  route_table_id         = var.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}