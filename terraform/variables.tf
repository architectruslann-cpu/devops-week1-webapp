variable "aws_region" {
  description = "AWS region for the EC2 deployment"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type for low-cost lab"
  type        = string
  default     = "t4g.nano"
}

variable "key_name" {
  description = "AWS EC2 key pair name"
  type        = string
  default     = "firstkey"
}

variable "my_ip_cidr" {
  description = "My public IP address in CIDR format for SSH and web access"
  type        = string
  default     = "37.225.83.221/32"
}