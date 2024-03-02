##################################################################################
# DATA
##################################################################################

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

##################################################################################
# RESOURCES
##################################################################################

# Creating a VPC with CIDR block 10.0.0.0/16
resource "aws_vpc" "app" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = merge(local.common_tags, { Name = "${local.naming_prefix}-vpc" })
}

# Creating internet Gateway and associating with VPC (Using VPC Id)
resource "aws_internet_gateway" "app" {
  vpc_id = aws_vpc.app.id
  tags = merge(local.common_tags, {
    Name = "${local.naming_prefix}-igw"
  })
}

# Creating both subnets (Using Count)
resource "aws_subnet" "public_subnets" {
  count                   = var.vpc_public_subnet_count
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  vpc_id                  = aws_vpc.app.id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = merge(local.common_tags, {
    Name = "${local.naming_prefix}-subnet-${count.index}"
  })
  availability_zone = data.aws_availability_zones.available.names[count.index]
}

# Commenting public_subnet1 and public_subnet2 since we are going to create both of them using count loop
# resource "aws_subnet" "public_subnet1" {
#   cidr_block              = var.vpc_public_subnets_cidr_block[0]
#   vpc_id                  = aws_vpc.app.id
#   map_public_ip_on_launch = var.map_public_ip_on_launch
#   tags                    = local.common_tags
#   # Assigning Subnet-1 with first Availability zone retrieved from data (We get this information from AWS provider based on region we have configured)
#   availability_zone = data.aws_availability_zones.available.names[0]
# }

# # Creating another subnet in a AZ2
# resource "aws_subnet" "public_subnet2" {
#   cidr_block              = var.vpc_public_subnets_cidr_block[1]
#   vpc_id                  = aws_vpc.app.id
#   map_public_ip_on_launch = var.map_public_ip_on_launch
#   tags                    = local.common_tags
#   availability_zone       = data.aws_availability_zones.available.names[1]
# }

# Creating route table and associate with VPC
resource "aws_route_table" "app" {
  vpc_id = aws_vpc.app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app.id
  }
  tags = merge(local.common_tags, {
    Name = "${local.naming_prefix}-rtb"
  })
}

# Associating route table with both subnets (Using Count)
resource "aws_route_table_association" "app_public_subnets" {
  count          = var.vpc_public_subnet_count
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.app.id
}

# # Associating route table with Subnet1
# resource "aws_route_table_association" "app_subnet1" {
#   subnet_id      = aws_subnet.public_subnet1.id
#   route_table_id = aws_route_table.app.id
# }

# # Associating route table with Subnet2
# resource "aws_route_table_association" "app_subnet2" {
#   subnet_id      = aws_subnet.public_subnet2.id
#   route_table_id = aws_route_table.app.id
# }

# SECURITY GROUPS #
# Creating Security group inside VPC
resource "aws_security_group" "nginx_sg" {
  name   = "${local.naming_prefix}-nginx_sg"
  vpc_id = aws_vpc.app.id
  tags   = local.common_tags

  # HTTP access from anywhere
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    # Making this change since now, EC2 instance should receive traffic from addresses within VPC
    cidr_blocks = [var.vpc_cidr_block]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Provisioning Security group for Load balancer
resource "aws_security_group" "alb_sg" {
  name   = "${local.naming_prefix}-nginx_alb_sg"
  vpc_id = aws_vpc.app.id
  tags   = local.common_tags

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

