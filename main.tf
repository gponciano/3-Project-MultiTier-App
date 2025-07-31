module "tomcat01" {
  source                = "./multi-tier-app-tomcat01"
  aws_region            = var.aws_region
  aws_ami_id            = var.aws_ami_id["ubuntu"]             # Ubuntu for Tomcat
  aws_availability_zone = var.aws_availability_zone
  aws_tag_project       = var.aws_tag_project
  private_key_path      = "${path.module}/multi-tier-app-tomcat01/multi-tier-app-tomcat01-key"
  web_user              = "ubuntu"
}

module "db01" {
  source                = "./multi-tier-app-db01"
  aws_region            = var.aws_region
  aws_ami_id            = var.aws_ami_id["amazon_linux"]       # Amazon Linux
  aws_availability_zone = var.aws_availability_zone
  aws_tag_project       = var.aws_tag_project
  private_key_path      = "${path.module}/multi-tier-app-db01/multi-tier-app-db01-key"
  web_user              = "ec2-user"
  tomcat_sg_id          = module.tomcat01.tomcat_sg_id
}

module "mc01" {
  source                = "./multi-tier-app-mc01"
  aws_region            = var.aws_region
  aws_ami_id            = var.aws_ami_id["amazon_linux"]       # Amazon Linux
  aws_availability_zone = var.aws_availability_zone
  aws_tag_project       = var.aws_tag_project
  private_key_path      = "${path.module}/multi-tier-app-mc01/multi-tier-app-mc01-key"
  web_user              = "ec2-user"
  tomcat_sg_id          = module.tomcat01.tomcat_sg_id
}

module "rmq01" {
  source                = "./multi-tier-app-rmq01"
  aws_region            = var.aws_region
  aws_ami_id            = var.aws_ami_id["amazon_linux"]       # Amazon Linux
  aws_availability_zone = var.aws_availability_zone
  aws_tag_project       = var.aws_tag_project
  private_key_path      = "${path.module}/multi-tier-app-rmq01/multi-tier-app-rmq01-key"
  web_user              = "ec2-user"
  tomcat_sg_id          = module.tomcat01.tomcat_sg_id
}
