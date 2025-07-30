data "aws_ami" "amiID" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
    ## Amazon Linux 2023 AMI
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

output "instance_id" {
  description = "AMI ID of Amazon instance"
  value       = data.aws_ami.amiID.id
}
