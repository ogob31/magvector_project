variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID where ECS and Load Balancer resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where ECS services and ALB will run"
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "container_port" {
  description = "The port exposed by the container"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 3
}
