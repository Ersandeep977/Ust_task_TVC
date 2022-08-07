#########################################################################################################
# file for Instaces resource
# created by sandeep kumar Patel
#########################################################################################################
# WEB Server Resource
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.AmazonAmiName.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = aws_subnet.Public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_port.id]
  tags                        = local.Resource_EC2_Web_1_server_tags
  provisioner "file" {
    source      = "./index1.html"
    destination = "/home/ec2-user/index1.html"
  }

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/Sandeep/Desktop/Ust_task/Resoces_create/terrafromTF.pem")
  }
}
resource "aws_instance" "web_server_ex" {
  ami                         = data.aws_ami.AmazonAmiName.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  availability_zone           = var.availability_zone
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = aws_subnet.Public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_port.id]
  tags                        = local.Resource_EC2_Web_2_server_tags
  provisioner "file" {
    source      = "./index2.html"
    destination = "/home/ec2-user/index2.html"
  }

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/Sandeep/Desktop/Ust_task - Copy/Resoces_create/terrafromTF.pem")
  }
}

# Security Group for Web server
resource "aws_security_group" "allow_port" {
  name        = "allow_all port"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.Main_VPC.id
  dynamic "ingress" {
    for_each = var.SgPorts
    iterator = Port
    content {
      from_port   = Port.value
      to_port     = Port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.Resource_Sg_tags
}
# AWS EBS Volume for server 1 Create
resource "aws_ebs_volume" "vol1" {
  availability_zone = var.availability_zone
  size              = 1
  tags              = local.Resource_ebs_vol_1_tags
}
# AWS EBS Volume for server 2 Create
resource "aws_ebs_volume" "vol2" {
  availability_zone = var.availability_zone
  size              = 1
  tags              = local.Resource_ebs_vol_2_tags
}

# AWS EBS Volume Attachment server 1 
resource "aws_volume_attachment" "ebs_att1" {
  device_name = "/dev/sdj"
  volume_id   = aws_ebs_volume.vol1.id
  instance_id = aws_instance.web_server.id
}
# AWS EBS Volume Attachment server 2
resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdi"
  volume_id   = aws_ebs_volume.vol2.id
  instance_id = aws_instance.web_server_ex.id
}

# AWS Snapshot for ebs for server 1 volume
resource "aws_ebs_snapshot" "example_snapshot1" {
  volume_id = aws_ebs_volume.vol1.id
  tags      = local.Resource_Sapshot_sever_1_tags
  depends_on = [
    aws_instance.web_server
  ]
}
# AWS Snapshot for ebs forr server 2 volume
resource "aws_ebs_snapshot" "example_snapshot2" {
  volume_id = aws_ebs_volume.vol1.id
  tags      = local.Resource_Sapshot_server_2_tags
  depends_on = [
    aws_instance.web_server_ex
  ]
}

####################################################################################
# DB Server Resource 
resource "aws_instance" "DB_server" {
  ami               = data.aws_ami.AmazonAmiName.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.availability_zone
  subnet_id         = aws_subnet.Private_subnet.id
  #security_groups = [aws_security_group.sg2.id]
  vpc_security_group_ids = [aws_security_group.sg2.id]
  tags                   = local.Resource_EC2_DB_server_tags
}

# Security Group for DB server
resource "aws_security_group" "sg2" {
  name        = "allow_all s2"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.Main_VPC.id


  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.Resource_Sg_tags
}
# AWS EBS Volume for DB server Create
resource "aws_ebs_volume" "vol3" {
  availability_zone = var.availability_zone
  size              = 1
  tags              = local.Resource_ebs_vol_3_tags
}

# AWS EBS Volume Attachment DB server
resource "aws_volume_attachment" "ebs_att3" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vol3.id
  instance_id = aws_instance.DB_server.id
}

# AWS Snapshot for ebs volume for DB server
resource "aws_ebs_snapshot" "example_snapshot3" {
  volume_id = aws_ebs_volume.vol3.id
  tags      = local.Resource_Sapshot_DB_server_tags
  depends_on = [
    aws_instance.DB_server
  ]
}

