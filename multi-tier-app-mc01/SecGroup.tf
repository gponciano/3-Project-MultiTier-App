resource "aws_security_group" "multi-tier-app-allow-from-tomcat01" {
  name        = "Allow incoming traffic from tomcat01 server"
  description = "Allow incoming traffic from tomcat01 server"

  tags = {
    Name = "Allow incoming traffic from tomcat01 server"
  }
}

resource "aws_vpc_security_group_ingress_rule" "MySQL_from_tomcat01" {
  description       = "Allow MySQL traffic from tomcat01"
  security_group_id = aws_security_group.multi-tier-app-allow-from-tomcat01.id
  referenced_security_group_id = aws_security_group.aws_security_group.multi-tier-app-tomcat01-sg.id
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_ingress_rule" "Memcache_from_tomcat01" {
  description                  = "Allow Memcache traffic from tomcat01"
  security_group_id           = aws_security_group.multi-tier-app-allow-from-tomcat01.id
  referenced_security_group_id = aws_security_group.aws_security_group.multi-tier-app-tomcat01-sg.id
  from_port                   = 11211
  to_port                     = 11211
  ip_protocol                 = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "Rabbitmq_from_tomcat01" {
  description                  = "Allow Rabbitmq traffic from tomcat01"
  security_group_id           = aws_security_group.multi-tier-app-allow-from-tomcat01.id
  referenced_security_group_id = aws_security_group.aws_security_group.multi-tier-app-tomcat01-sg.id
  from_port                   = 5672
  to_port                     = 5672
  ip_protocol                 = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh-management" {
  description       = "ssh management access"
  security_group_id = aws_security_group.multi-tier-app-allow-from-tomcat01.id
  cidr_ipv4         = "0.0.0.0/0" # Replace with your IP address
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_within_same_sg" {
  description                  = "Allow all traffic within the same security group"
  security_group_id            = aws_security_group.multi-tier-app-allow-from-tomcat01.id
  referenced_security_group_id = aws_security_group.multi-tier-app-allow-from-tomcat01.id
  from_port                    = 0
  to_port                      = 0
  ip_protocol                  = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  description       = "Allow all outbound traffic"
  security_group_id = aws_security_group.multi-tier-app-tomcat01-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  description       = "Allow all outbound traffic for IPv6"
  security_group_id = aws_security_group.dmulti-tier-app-tomcat01-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}