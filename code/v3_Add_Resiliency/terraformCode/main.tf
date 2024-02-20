##################################################################################
# PROVIDERS - Using AWS Provider
##################################################################################
# Set Provider, and specify accessKey, secretKey and default region
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

##################################################################################
# DATA - Setting AMI as the Data
##################################################################################
# Define data
data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##################################################################################
# RESOURCES
##################################################################################

# Creating a VPC with CIDR block 10.0.0.0/16
resource "aws_vpc" "app" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = local.common_tags
}

# Creating internet Gateway and associating with VPC (Using VPC Id)
resource "aws_internet_gateway" "app" {
  vpc_id = aws_vpc.app.id
  tags   = local.common_tags
}

# Creating a subnet and associating with VPC (Using VPC Id)
resource "aws_subnet" "public_subnet1" {
  cidr_block              = var.vpc_public_subnet1_cidr_block
  vpc_id                  = aws_vpc.app.id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = local.common_tags
}

# Creating route table and associate with VPC
resource "aws_route_table" "app" {
  vpc_id = aws_vpc.app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app.id
  }
  tags = local.common_tags
}

# Associating route table with Subnet
resource "aws_route_table_association" "app_subnet1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.app.id
}

# SECURITY GROUPS #
# Creating Security group inside VPC
resource "aws_security_group" "nginx_sg" {
  name   = "nginx_sg"
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

# INSTANCES #
# Creating AWS EC2 instance - Taking AMI from Data, using t2.micro as instance type, placing in subnet created earlier and assigning security groups
resource "aws_instance" "nginx1" {
  ami                    = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  tags                   = local.common_tags
  user_data              = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Taco Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF
}

