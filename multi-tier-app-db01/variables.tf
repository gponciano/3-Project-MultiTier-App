variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "Defining the AWS region for the resources"
}

variable "aws_tag_project" {
  type        = string
  default     = "multi-tier-project"
  description = "Tag for the project"
}

variable "instance_type" {
  default = "db01"
}

variable "aws_availability_zone" {
  type        = string
  default     = "us-east-2a"
  description = "Defining the AWS availability zone for the resources"
}

variable "aws_ami_id" {
  type = map(any)
  default = {
    us-east-2 = "ami-05eb56e0befdb025f"
  }
  description = "AMI ID for the Ubuntu instance"
}

variable "web_user" {
  type        = string
  default     = "ec2-user"
  description = "The user for SSH connection to the web instance"
}

