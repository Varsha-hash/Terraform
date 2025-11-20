
#################### VPC VARIABLES ####################
variable "aws_region" {
    description = "The AWS region to deploy the resouce"
    type = string
    default = "ap-south-1"
  
}

variable "vpc_name" {
    description = "The name of the VPC"
    type = string
}

variable "vpc_cidr_range" {
    description = "CIDR range for the VPC"
    type = string
}


#################### Public Subnet Variable ####################

# variable "public_subnet_cidr_block" {
#     description = "CIDR block for the subnet"
#     type = list[string]
#    }

# variable "availability_zone" {
#     description = "AWS Availability Zone"
#     type = list[string]
#    }

# variable "public_subnet_name" {
#     description = "Name of the public subnet"
#     type = string
#    }

# #################### Public Subnet Variable ####################

# variable "private_subnet_cidr_block" {
#     description = "CIDR block for the subnet"
#     type = list[string]
#    }

# variable "private_subnet_name" {
#     description = "Name of the private subnet"
#     type = string
#    }

# #################### Internet Gateway Variable ####################
# variable "tf_internet_gateway_name" {
#     description = "Name of the  internet gateway"
#     type = string
#    }




