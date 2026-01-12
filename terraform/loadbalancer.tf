#############################################
# USE EXISTING ALB + TARGET GROUP + LISTENER
#############################################

data "aws_lb" "main" {
  name = "test-lb"
}

data "aws_lb_target_group" "main" {
  name = "test-tg"
}

# If you already have an HTTP :80 listener on test-lb, read it like this:
data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.main.arn
  port              = 80
}

# Optional outputs (handy)
output "alb_dns_name" {
  value = data.aws_lb.main.dns_name
}

output "target_group_arn" {
  value = data.aws_lb_target_group.main.arn
}
