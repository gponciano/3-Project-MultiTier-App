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


variable "aws_availability_zone" {
  type        = string
  default     = "us-east-2a"
  description = "Defining the AWS availability zone for the resources"
}

variable "aws_ami_id" {
  type = map(string)
  default = {
    amazon_linux = "ami-08ca1d1e465fbfe0c" # For db01, rmq01, mc01
    ubuntu       = "ami-05eb56e0befdb025f" # For tomcat01
  }
  description = "AMI IDs by OS"
}

variable "web_user" {
  type        = string
  description = "The SSH user to connect as"
}

variable "domain_name" {
  description = "The private domain name"
  default     = "multi-tier-app.in"
  type        = string
}