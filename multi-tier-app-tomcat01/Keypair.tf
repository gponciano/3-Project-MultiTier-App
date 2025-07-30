resource "aws_key_pair" "tomcat01-key" {
  key_name   = "multi-tier-app-tomcat01-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKGJCkJrVQ6NnOkc0eBQbH6UEZCGaWZ3PH6NOJN4/Esa bielp@Trinity"
}