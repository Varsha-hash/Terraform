### Setup VPC
resource "aws_vpc" "tf_vpc" {
    cidr_block = var.vpc_cidr_range
    tags = {
       Name = var.vpc_name
    }
 }

### Setup  Public Subnet 
# resource "aws_subnet" "public_subnet" {
#     count = length(var.public_subnet_cidr_block)
#     vpc_id = aws_vpc.vpc_tf.id
#     cidr_block = var.public_subnet_cidr_block[count.index] # Access element from a list
#     availability_zone  = element(var.availability_zone[count.index]) # Retrieve a single value from a list 
#     tags = {
#        Name =  "${var.public_subnet_name}-${count.index+1}" # Interpolate values into a string
#     }
# }

# ### Setup Private subnet 
# resource "aws_subnet" "private_subnet" {
#     count = length(var.private_subnet_cidr_block)
#     vpc_id = aws_vpc.vpc_tf.id
#     cidr_block = var.private_subnet_cidr_block[count.index] # Access element from a list
#     availability_zone  = element(var.availability_zone[count.index]) # Retrieve a single value from a list 
#     tags = {
#        Name =  "${var.private_subnet_name}-${count.index+1}" # Interpolate values into a string
#     }
# }

# ### Setup Internet Gateway
# resource "aws_internet_gateway" "tf_internet_gateway" {
#     vpc_id = aws_vpc.tf_vpc.id 
#       tags = {
#          Name = var.tf_internet_gateway_name
#       }
# }

# ### Setup Route Table for Public Subnet
# resource "aws_route_table" "public_route_table" {
#    vpc_id = aws_vpc.tf_vpc.id
#    route = {
#      cidr_block = "0.0.0.0"
#      gateway_id = aws_internet_gateway.tf_internet_gateway.id
 
#    }
#     tags = {
#       Name = "${var.public_subnet_name}-route-table"
#     }
# }

# ### Setup Route Table for Private Subnet
# resource "aws_route_table" "private_route_table" {
#    vpc_id = aws_vpc.tf_vpc.id
#    tags = {
#       Name = "${var.private_subnet_name}-route-table"
#     }
# }

# ### Associate Public Subnet with Route Table
# resource "aws_route_table_associastion" "publich_subnet_association" {
#    count = length(aws_subnet.public_subnet)
#    subnet_id = aws_subnet.public_subnet[count.index].id
#    route_table_id = aws_route_table.public_route_table.id

# }

# ### Associate Private Subnet with Route Table
# resource "aws_route_table_associastion" "private_subnet_association" {
#    count = length(aws_subnet.private_subnet)
#    subnet_id = aws_subnet.private_subnet[count.index].id
#    route_table_id = aws_route_table.private_route_table.id

# }

