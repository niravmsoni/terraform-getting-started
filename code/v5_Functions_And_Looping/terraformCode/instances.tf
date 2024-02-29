##################################################################################
# DATA - Setting AMI as the Data
##################################################################################
# Define data
data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


# INSTANCES #
# Created multiple instances using count argument
resource "aws_instance" "nginx" {
  count                  = var.instance_count
  ami                    = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnets[count.index].id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]
  tags                   = local.common_tags
  user_data              = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/index.html /home/ec2-user/index.html
aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/Globo_logo_Vert.png /home/ec2-user/Globo_logo_Vert.png
sudo rm /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
sudo cp /home/ec2-user/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png
EOF
}

# # Creating AWS EC2 instance - Taking AMI from Data, using t2.micro as instance type, placing in subnet created earlier and assigning security groups
# resource "aws_instance" "nginx1" {
#   ami                    = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public_subnet1.id
#   vpc_security_group_ids = [aws_security_group.nginx_sg.id]
#   iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
#   depends_on             = [aws_iam_role_policy.allow_s3_all]
#   tags                   = local.common_tags
#   user_data              = <<EOF
# #! /bin/bash
# sudo amazon-linux-extras install -y nginx1
# sudo service nginx start
# aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/index.html /home/ec2-user/index.html
# aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/Globo_logo_Vert.png /home/ec2-user/Globo_logo_Vert.png
# sudo rm /usr/share/nginx/html/index.html
# sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
# sudo cp /home/ec2-user/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png
# EOF
# }

# # Another instance that sits in subnet 2
# resource "aws_instance" "nginx2" {
#   ami                    = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
#   instance_type          = var.instance_type
#   subnet_id              = aws_subnet.public_subnet2.id
#   vpc_security_group_ids = [aws_security_group.nginx_sg.id]
#   iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
#   depends_on             = [aws_iam_role_policy.allow_s3_all]
#   tags                   = local.common_tags
#   user_data              = <<EOF
# #! /bin/bash
# sudo amazon-linux-extras install -y nginx1
# sudo service nginx start
# aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/index.html /home/ec2-user/index.html
# aws s3 cp s3://${aws_s3_bucket.web_bucket.id}/website/Globo_logo_Vert.png /home/ec2-user/Globo_logo_Vert.png
# sudo rm /usr/share/nginx/html/index.html
# sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html
# sudo cp /home/ec2-user/Globo_logo_Vert.png /usr/share/nginx/html/Globo_logo_Vert.png
# EOF
# }

# aws_iam_role
resource "aws_iam_role" "allow_nginx_s3" {
  name = "allow_nginx_s3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags               = local.common_tags
}

# aws_iam_role_policy
resource "aws_iam_role_policy" "allow_s3_all" {
  name = "allow_s3_all"
  role = aws_iam_role.allow_nginx_s3.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
                "arn:aws:s3:::${local.s3_bucket_name}",
                "arn:aws:s3:::${local.s3_bucket_name}/*"
            ]
    }
  ]
}
EOF
}

# aws_iam_instance_profile
resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx_profile"
  role = aws_iam_role.allow_nginx_s3.name

  tags = local.common_tags
}