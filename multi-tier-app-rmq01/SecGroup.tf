# Security Group for the database (db01) instance
resource "aws_security_group" "multi-tier-app-db01-sg" {
  name        = "multi-tier-app-db01-sg"
  description = "Allow incoming traffic from tomcat01 server"

  tags = {
    Name = "multi-tier-app-db01-sg"
  }
}

# Ingress rules allowing traffic from Tomcat01 SG
resource "aws_vpc_security_group_ingress_rule" "MySQL-from-tomcat01" {
  description                   = "Allow MySQL traffic from tomcat01"
  security_group_id            = aws_security_group.multi-tier-app-db01-sg.id
  referenced_security_group_id = var.tomcat_sg_id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "Memcache-from-tomcat01" {
  description                   = "Allow Memcache traffic from tomcat01"
  security_group_id            = aws_security_group.multi-tier-app-db01-sg.id
  referenced_security_group_id = var.tomcat_sg_id
  from_port                    = 11211
  to_port                      = 11211
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "Rabbitmq-from-tomcat01" {
  description                   = "Allow Rabbitmq traffic from tomcat01"
  security_group_id            = aws_security_group.multi-tier-app-db01-sg.id
  referenced_security_group_id = var.tomcat_sg_id
  from_port                    = 5672
  to_port                      = 5672
  ip_protocol                  = "tcp"
}

# SSH access to the DB instance (from anywhere — should be restricted in production)
resource "aws_vpc_security_group_ingress_rule" "ssh-management" {
  description       = "SSH management access"
  security_group_id = aws_security_group.multi-tier-app-db01-sg.id
  cidr_ipv4         = "0.0.0.0/0" # Replace with your actual IP
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

# Allow internal traffic within the same security group (if needed)
resource "aws_vpc_security_group_ingress_rule" "allow_all_within_same_sg" {
  description                   = "Allow all traffic within the same security group"
  security_group_id            = aws_security_group.multi-tier-app-db01-sg.id
  referenced_security_group_id = aws_security_group.multi-tier-app-db01-sg.id
  from_port                    = 0
  to_port                      = 0
  ip_protocol                  = "-1"
}

# Egress rules (assumed to belong to the DB instance)
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  description       = "Allow all outbound traffic"
  security_group_id = aws_security_group.multi-tier-app-db01-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  description       = "Allow all outbound traffic for IPv6"
  security_group_id = aws_security_group.multi-tier-app-db01-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}
