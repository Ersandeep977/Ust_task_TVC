resource "aws_s3_bucket" "onebucket" {
  bucket        = var.bucket_name
  acl           = "private"
  force_destroy = true
  tags = {
    Name        = "Bucket1"
    Environment = "Test"
  }
}
variable "bucket_name" {
  default = "ust-global-sandeep-kumar-patel-testing-s3-with-terraform"
}


resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "ustsandeepkumarpatel"
  hash_key       = "LockID"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}