resource "aws_instance" "db01" {
  ami                    = var.aws_ami_id[var.aws_region]
  key_name               = aws_key_pair.db01-key.key_name
  vpc_security_group_ids = [aws_security_group.multi-tier-app-allow-from-tomcat01.id]
  availability_zone      = var.aws_availability_zone
  instance_type          = "t2.micro"

  tags = {
    Name    = "multi-tier-instance-${var.instance_type}"
    Project = var.aws_tag_project
  }

  provisioner "file" {
    source      = "mysql.sh"
    destination = "/tmp/mysql.sh"
  }
  connection {
    type        = "ssh"
    user        = var.web_user
    private_key = file("multi-tier-app-db01-key")
    host        = self.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/mysql.sh",
      "sudo /tmp/mysql.sh"
    ]
  }

}

resource "aws_ec2_instance_state" "db01-state" {
  instance_id = aws_instance.db01.id
  state       = "running"
}