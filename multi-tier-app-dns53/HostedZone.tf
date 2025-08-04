resource "aws_route53_zone" "private" {
  name = var.domain_name
  vpc {
    vpc_id = var.vpc_id
  }

  comment      = "Private hosted zone for internal DNS"
}
