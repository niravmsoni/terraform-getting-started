variable "aws_region" {
  type        = string
  description = "AWS region to use for resources"
  default     = "us-east-1"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}
variable "vpc_public_subnet_count" {
  type = number
  description = "Number of public subnets to create"
  default = 2
}
variable "vpc_public_subnets_cidr_block" {
  type        = list(string)
  description = "CIDR Block for Public Subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map public IP address for subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 instances"
  default     = "t2.micro"
}

variable "instance_count" {
  type        = number
  description = "Number of instances to create"
  default     = 2
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Nirav Corporation"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}

variable "naming_prefix" {
  type        = string
  description = "Naming prefix for all resources."
  default     = "globo-web-app"
}

variable "environment" {
  type        = string
  description = "Environment for deployment"
  default     = "development"
}