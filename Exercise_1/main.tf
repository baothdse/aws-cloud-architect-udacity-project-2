# Designate a cloud provider, region, and credentials
provider "aws" {
  access_key = "AKIASHG6BKSAQGXSFWEU"
  secret_key = "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"
  region = "us-east-1"
}

# Provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  count = "4"
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.small"
  tags = {
    name = var.instance_name_t2_small
  }
  subnet_id = var.aws_subnet_public_id
}

# Provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacity_m4" {
  count = "2"
  ami = "ami-0323c3dd2da7fb37d"
  instance_type = "m4.large"
  tags = {
    name = var.instance_name_m4_large
  }
  subnet_id = var.aws_subnet_public_id
}