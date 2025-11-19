variable "aws_region" {
    description = "The AWS region to deploy the resouce"
    type = "string"
    default = "ap-south-1"
  
}

variable "vpc_name" {
    description = "The name of the VPC"
    type = "string"
}