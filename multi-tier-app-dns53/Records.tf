resource "aws_route53_record" "db01" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "db01.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.db01_ip]
}

resource "aws_route53_record" "mc01" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "mc01.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.mc01_ip]
}
resource "aws_route53_record" "tomcat01" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "tomcat01.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.tomcat01_ip]
}

resource "aws_route53_record" "rmq01" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "rmq01.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.rmq01_ip]
}