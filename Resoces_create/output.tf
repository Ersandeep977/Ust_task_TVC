#########################################################################################################
# file for output file resource
# created by sandeep kumar Patel
#########################################################################################################
# EC2 instances output Value

# Web Server
output "aws_instance-Public-id" {
  value = aws_instance.web_server.public_ip
}
output "aws-instaces-private-ip" {
  value = aws_instance.web_server.private_ip
}
output "aws-instaces-key-name" {
  value = aws_instance.web_server.key_name
}
output "aws-instaces-status" {
  value = aws_instance.web_server.instance_state
}
output "aws-instaces-id" {
  value = aws_instance.web_server.id
}
output "aws-instaces-availability-zone" {
  value = aws_instance.web_server.availability_zone
}


####################################################################
# DB server
output "awsinstancePublic-id" {
  value = aws_instance.DB_server.public_ip
}
output "awsinstacesprivate-ip" {
  value = aws_instance.DB_server.private_ip
}
output "awsinstaceskeyname" {
  value = aws_instance.DB_server.key_name
}
output "awsinstacesstatus" {
  value = aws_instance.DB_server.instance_state
}
output "awsinstacesid" {
  value = aws_instance.DB_server.id
}
output "awsinstacesavailabilityzone" {
  value = aws_instance.DB_server.availability_zone
}

output "ebs" {
  value = aws_ebs_volume.vol1.id
}

output "Snapshot1" {
  value = aws_ebs_snapshot.example_snapshot1.id
}

output "Snapshot2" {
  value = aws_ebs_snapshot.example_snapshot2.id
}

output "Snapshot3" {
  value = aws_ebs_snapshot.example_snapshot3.id
}

##############################################################################
# VPC
output "main-vpc-id" {
  value = aws_vpc.Main_VPC.id
}

output "iw" {
  value = aws_internet_gateway.gw.id
}

output "publice-subnet" {
  value = aws_subnet.Public_subnet.id
}

output "privat-subnet" {
  value = aws_subnet.Private_subnet.id
}

output "eip" {
  value = aws_eip.lb.id
}

#########################################################
