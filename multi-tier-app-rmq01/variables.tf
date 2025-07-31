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
  default = "rmq01"
}

variable "aws_availability_zone" {
  type        = string
  default     = "us-east-2a"
  description = "Defining the AWS availability zone for the resources"
}

/*variable "aws_ami_id" {
  type = map(any)
  default = {
    us-east-2 = "ami-08ca1d1e465fbfe0c"
  }
  description = "AMI ID for the Amazon Linux instance"
}
*/
variable "aws_ami_id" {
  type        = string
  description = "AMI ID to use for this instance"
}

variable "tomcat_sg_id" {
  type        = string
  description = "The security group ID of the tomcat01 instance"
}
variable "private_key_path" {
  description = "Path to private key file"
  type        = string
}

variable "web_user" {
  type        = string
  default     = "ec2-user"
  description = "The user for SSH connection to the web instance"
}

