resource "aws_key_pair" "db01-key" {
  key_name   = "multi-tier-app-db01-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIYUkP7fnOwSaDS1PfnIICF+mWgCT6/vBGK/7YYUKQvD bielp@Trinity"
}