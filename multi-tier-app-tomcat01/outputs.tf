output "tomcat_sg_id" {
  value = aws_security_group.multi-tier-app-tomcat01-sg.id
}

output "private_ip" {
  value = aws_instance.tomcat01.private_ip
}
