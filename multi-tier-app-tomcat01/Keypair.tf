resource "aws_key_pair" "tomcat01-key" {
  key_name   = "multi-tier-app-tomcat01-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBCnXVWanFSi0PsvU20XjG591QI9n5cayS+0kWCdjTxd bielp@Trinity"
}