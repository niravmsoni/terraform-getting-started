# Adding Resiliency to the architecture

- What we would be adding?

- Data source
    - [aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) 
        - Allows access to list of AWS AZ which can be accessed by AWS account within region configured

- Load balancer resources
    - [aws_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) - Application load balancer
    - [aws_lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) - Target group for Load balancer
    - [aws_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) - Listener configuration for target group
    - [aws_lb_target_group_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) - Attach to EC2 instances