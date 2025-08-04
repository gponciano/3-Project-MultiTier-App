variable "domain_name" {
  description = "The private domain name"
  default     = "multi-tier-app.in"
  type        = string
}

variable "vpc_id" {
  description = "The VPC to associate with the private hosted zone"
  type        = string
}

variable "db01_ip" {
  description = "Private IP of db01 instance"
  type        = string
}

variable "mc01_ip" {
  description = "Private IP of mc01 instance"
  type        = string
}
variable "tomcat01_ip" {
  description = "Private IP of tomcat01 instance"
  type        = string
}
variable "rmq01_ip" {
  description = "Private IP of rmq01 instance"
  type        = string
}