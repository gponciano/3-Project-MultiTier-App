resource "aws_key_pair" "mc01-key" {
  key_name   = "multi-tier-app-mc01-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPMz75J+/MCBfe6XgwlfWj0L5Vn06S53TDS7+TF2p2uD bielp@Trinity"
}