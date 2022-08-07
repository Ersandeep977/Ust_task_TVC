#########################################################################################################
# file for variable file
# created by sandeep kumar Patel
#########################################################################################################
# terrafrom
variable "rgion" {
  description = "AWS Region"
  default     = {}
}
###########################################################
# S3 bucket 

variable "S3_key" {
  description = "S3 key fof the tfstate file"
  default     = "HttpdWebServer/terrafrom.tfstate"
}
variable "bucket_name" {
  description = "value"
  default     = "ust-global-sandeep-kumar-patel-testing-s3-with-terraform"
}

#####################################################
# EC2 instances
variable "ami" {
  description = "ami id for ce2 instances used"
  default     = {}
}

variable "instance_type" {
  description = "Ec2 instances type"
  default     = {}
}

variable "key_name" {
  description = "EC2 instances key name"
  default     = {}
}

variable "availability_zone" {
  description = "avaiblity zone used "
  default     = {}
}

variable "associate_public_ip_address" {
  description = " associate publice ip for instances"
  default     = {}
}

##################################################
# EBS
variable "device_name" {
  description = " volume name "
  default     = {}
}

##########################################################
# VPC
variable "Cidr_block_Main_VPC" {
  description = "Cidr block for Main VPC "
  default     = {}
}
variable "Cidr_block_Public_subnet" {
  description = "Cidr Block for publice subnet"
  default     = {}
}
variable "Cidr_block_private_subnet" {
  description = "Cidr Block for private subnet"
  default     = {}
}
##########################################################
# SG
variable "SgPorts" {
  type    = list(number)
  default = []
}