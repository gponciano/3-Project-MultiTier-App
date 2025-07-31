resource "aws_instance" "mc01" {
  ami                    = var.aws_ami_id
  key_name               = aws_key_pair.mc01-key.key_name
  vpc_security_group_ids = [aws_security_group.multi-tier-app-db01-sg.id]
  availability_zone      = var.aws_availability_zone
  instance_type          = "t2.micro"

  tags = {
    Name    = "multi-tier-instance-mc01"
    Project = var.aws_tag_project
  }

  provisioner "file" {
    source      = "memcache.sh"
    destination = "/tmp/memcache.sh"
  }
  connection {
    type        = "ssh"
    user        = var.web_user
    private_key = file(var.private_key_path)
    host        = self.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/memcache.sh",
      "sudo /tmp/memcache.sh"
    ]
  }

}

resource "aws_ec2_instance_state" "mc01-state" {
  instance_id = aws_instance.mc01.id
  state       = "running"
}