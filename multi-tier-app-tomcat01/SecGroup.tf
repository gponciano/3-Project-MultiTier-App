resource "aws_security_group" "multi-tier-app-tomcat01-sg" {
  name        = "tomcat01-sg"
  description = "tomcat01-sg"

  tags = {
    Name = "multi-tier-app-tomcat01-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh-management" {
  description       = "ssh management access"
  security_group_id = aws_security_group.multi-tier-app-tomcat01-sg.id
  cidr_ipv4         = "0.0.0.0/0" # Replace with your IP address
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

/* resource "aws_vpc_security_group_ingress_rule" "allow_8080_from_elb" {
  description                  = "Allow traffic on port 8080 from ELB SG"
  security_group_id           = aws_security_group.multi-tier-app-tomcat01-sg.id
  referenced_security_group_id = aws_security_group.multi-tier-app-elb.id
  from_port                   = 8080
  to_port                     = 8080
  ip_protocol                 = "tcp"
} 
*/

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  description       = "Allow all outbound traffic"
  security_group_id = aws_security_group.multi-tier-app-tomcat01-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  description       = "Allow all outbound traffic for IPv6"
  security_group_id = aws_security_group.multi-tier-app-tomcat01-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}