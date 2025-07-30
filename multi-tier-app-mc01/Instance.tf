resource "aws_instance" "db01" {
  ami                    = var.aws_ami_id[var.aws_region]
  key_name               = aws_key_pair.db01-key.key_name
  vpc_security_group_ids = [aws_security_group.multi-tier-app-allow-from-tomcat01.id]
  availability_zone      = var.aws_availability_zone
  instance_type          = "t2.micro"

  tags = {
    Name    = var.multi-tier-instance-"mc01"
    Project = var.aws_tag_project
  }

  provisioner "file" {
    source      = "memcache.sh"
    destination = "/tmp/memcache.sh"
  }
  connection {
    type        = "ssh"
    user        = var.web_user
    private_key = file("multi-tier-app-mc01-key.pem")
    host        = self.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

}

resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"
}