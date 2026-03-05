variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_id" {
  description = "VPC ID where ECS and Load Balancer resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where ECS services and the Application Load Balancer will run"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the application container"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}
variable "project_name" {
  description = "Project name prefix for all resources"
  type        = string
}

