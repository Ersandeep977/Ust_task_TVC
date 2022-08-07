#########################################################################################################
# file for VPC resource
# created by sandeep kumar Patel
#########################################################################################################
# Resource for Main VPC Block
resource "aws_vpc" "Main_VPC" {
  cidr_block       = var.Cidr_block_Main_VPC
  instance_tenancy = "default"
  tags             = local.Resource_VPC_tags
}

##########################################################
# Resource for Main internet gateway Block
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Main_VPC.id
  tags   = local.Resource_IG_tags
}

##########################################################
# Resource for Public subnet Block
resource "aws_subnet" "Public_subnet" {
  vpc_id            = aws_vpc.Main_VPC.id
  cidr_block        = var.Cidr_block_Public_subnet
  availability_zone = var.availability_zone
  tags              = local.Resource_Subnet-1_tags
}

##########################################################
# Resource for Private subnet Block
resource "aws_subnet" "Private_subnet" {
  vpc_id            = aws_vpc.Main_VPC.id
  cidr_block        = var.Cidr_block_private_subnet
  availability_zone = var.availability_zone
  tags              = local.Resource_Subnet-2_tags
}

##########################################################
# Resource for aws EIP  Block
resource "aws_eip" "lb" {
  #instance = aws_instance.web.id
  vpc = true
}

##########################################################
# Resource for NAT  Block
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.Private_subnet.id
  tags          = local.Resource_NG_tags
  #depends_on = [aws_internet_gateway.example]
}

########################################################################
# Resource for route table Block, table association and route for igw
# Public
resource "aws_route_table" "Public" {
  vpc_id = aws_vpc.Main_VPC.id
  tags   = local.Resource_RT_Public_tags
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.Public.id
}

resource "aws_route" "route_igw" {
  route_table_id         = aws_route_table.Public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
  #depends_on                = [aws_route_table.prod-route-table]
}

########################################################################
# Resource for route table Block, table association and route for igw
# private
resource "aws_route_table" "Private" {
  vpc_id = aws_vpc.Main_VPC.id
  tags   = local.Resource_RT_private_tags
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Private_subnet.id
  route_table_id = aws_route_table.Private.id
}

resource "aws_route" "r" {
  route_table_id         = aws_route_table.Private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.example.id
  # depends_on = ["aws_route_table.testing"]
}

