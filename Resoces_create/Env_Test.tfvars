#########################################################################################################
# file for Test Env file
# created by sandeep kumar Patel
#########################################################################################################
# terrafrom Block
gion = "us-east-1"

# Ec2 block
ami                         = "ami-065efef2c739d613b"
instance_type               = "t2.medium"
key_name                    = "terrafromTF"
availability_zone           = "us-east-1a"
associate_public_ip_address = "true"

# VPC Block
Cidr_block_Main_VPC       = "10.0.0.0/16"
Cidr_block_Public_subnet  = "10.0.1.0/24"
Cidr_block_private_subnet = "10.0.2.0/24"

#security group Block
SgPorts = [22, 80, 444, 21]
