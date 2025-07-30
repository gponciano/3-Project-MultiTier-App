resource "aws_instance" "tomcat01" {
  ami                    = var.aws_ami_id[var.aws_region]
  key_name               = aws_key_pair.tomcat01-key.key_name
  vpc_security_group_ids = [aws_security_group.tomcat01-sg.id]
  availability_zone      = var.aws_availability_zone
  instance_type          = "t2.micro"

  tags = {
    Name    = "multi-tier-instance-${var.instance_type}"
    Project = var.aws_tag_project
  }

  provisioner "file" {
    source      = "tomcat_ubuntu.sh"
    destination = "/tmp/tomcat_ubuntu.sh"
  }
  connection {
    type        = "ssh"
    user        = var.web_user
    private_key = file("multi-tier-app-tomcat01-key")
    host        = self.public_ip

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/tomcat_ubuntu.sh",
      "sudo /tmp/tomcat_ubuntu.sh"
    ]
  }

}

resource "aws_ec2_instance_state" "tomcat01-state" {
  instance_id = aws_instance.tomcat01.id
  state       = "running"
}