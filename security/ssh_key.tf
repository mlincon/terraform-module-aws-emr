# SSH key
resource "aws_key_pair" "emr-ssh-key" {
  key_name   = var.ssh-key-name
  public_key = file(var.ssh-key-path)
}
