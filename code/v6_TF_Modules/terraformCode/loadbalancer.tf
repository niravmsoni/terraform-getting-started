#aws_elb_service_account
data "aws_elb_service_account" "root" {}

#aws_lb
resource "aws_lb" "nginx" {
  name               = "${local.naming_prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  # Replacing subnets from output variable of VPC module and depends_on for S3 Module created locally
  subnets            = module.app.public_subnets
  #subnets            = [aws_subnet.public_subnets[*].id]
  depends_on         = [module.web_app_s3]
  #depends_on         = [aws_s3_bucket_policy.web_bucket]

  enable_deletion_protection = false

  access_logs {
    bucket  = module.web_app_s3.web_bucket.id
    prefix  = "alb-logs"
    enabled = true
  }
  tags = local.common_tags
}

#aws_lb_target_group
resource "aws_lb_target_group" "nginx" {
  name     = "${local.naming_prefix}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.app.vpc_id

  tags = local.common_tags
}

#aws_lb_listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }

  tags = merge(local.common_tags, {
    Name = "${local.naming_prefix}-nginx"
  })
}

#aws_lb_target_group_attachment
resource "aws_lb_target_group_attachment" "nginx" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 80
}


# resource "aws_lb_target_group_attachment" "nginx1" {
#   target_group_arn = aws_lb_target_group.nginx_lb_tg.arn
#   target_id        = aws_instance.nginx1.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "nginx2" {
#   target_group_arn = aws_lb_target_group.nginx_lb_tg.arn
#   target_id        = aws_instance.nginx2.id
#   port             = 80
# }
