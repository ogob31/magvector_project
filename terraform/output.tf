output "lb_hostname" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.main.dns_name
}

output "target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = aws_lb_target_group.main.arn
}

output "alb_security_group_id" {
  description = "Security Group ID for the ALB"
  value       = aws_security_group.alb.id
}

output "ecs_security_group_id" {
  description = "Security Group ID for the ECS service"
  value       = aws_security_group.ecs.id
}
