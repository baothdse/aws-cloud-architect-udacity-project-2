variable "instance_name_t2_small" {
  description = "Value of the Name tag for the EC2 instance T2 Small"
  type        = string
  default     = "Udacity T2"
}

variable "instance_name_m4_large" {
  description = "Value of the Name tag for the EC2 instance M4 Large"
  type        = string
  default     = "Udacity M4"
}

variable "aws_subnet_public_id" {
  description = "Public Subnet 1"
  default = "subnet-07d29554a60e3277f"
}