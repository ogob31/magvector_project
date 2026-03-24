#############################################
# Application Load Balancer
#############################################

resource "aws_lb" "main" {
  name               = "magvector-alb"
  internal           = false
  load_balancer_type = "application"

  subnets = var.subnet_ids

  enable_deletion_protection = false
}

#############################################
# Target Group
#############################################

resource "aws_lb_target_group" "main" {
  name        = "magvector-tg"
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
    matcher             = "200"
  }
}

#############################################
# Listener
#############################################

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

#############################################
# Outputs
#############################################

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}
