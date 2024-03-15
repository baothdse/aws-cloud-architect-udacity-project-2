# Define the variable for aws_region
variable "aws_region" {
  description = "Region for provisioning lambda function"
  type        = string
  default     = "us-east-1"
}