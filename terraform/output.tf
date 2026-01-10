output "lb_hostname" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.main.dns_name
}
output "target_group_arn" {
  vpc_id = data.aws_vpc.selected.id
}
output "security_group_id" {
 vpc_id = data.aws_vpc.selected.id

}
