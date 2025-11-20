# ### Create the DB 
# resource "aws_db_isnatnce" "postgres_db" {
#     allocated_storage = 2
#     name = "postgres_db"
#     engine = "postgres"
#     engine_version = "12.4"
#     instance_class = "db.t2.micro"
#     username = "admin"
#     password = "1234"
#     vpc_security_group_ids = aws_security_group.rds_sg.id
#     db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
#     skip_final_snapshot = true
# }

# ### Create the Security Group 
# resource "aws_security_group" "rds_sg" {

#     name = "rds-security-group"
#     description =  "Allow DB traffic"
#     vpc_id = aws_vpc.tf_vpc.id

#     ingress  {
#         from_port= 3306
#         to_port= 3306
#         protocol= "tcp"
#         cidr_blocks = ["10.0.0.0/16"]
# }

#     egress  {
#         from_port= 0
#         to_port= 0
#         protocol= "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

# }

# ### Create DB Subnet Group
# resource "aws_db_subnet_group" "rds_subnet_group" {
#     name = "rds-subnet-group"
#     subnet_ids = aws_subnet.private_subnet[*].id
#     tags = {
#         Name = "RDS subnet group"
#     }
# }