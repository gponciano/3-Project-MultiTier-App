data "aws_ami" "amiID" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
    ## values = ["al2023-ami-2023.8.20250721.2-kernel-6.1-x86_64"]
    ## Amazon Linux 2023 AMI
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

output "instance_id" {
  description = "AMI ID of Amazon instance"
  value       = data.aws_ami.amiID.id
}
