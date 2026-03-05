resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/magvector-app"
  retention_in_days = 30
}