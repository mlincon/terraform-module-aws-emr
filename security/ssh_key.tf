# Amazon EC2 key pair that can be used to ssh to the master node 
# as the user called "hadoop"
resource "aws_key_pair" "emr_ssh_key" {
  key_name   = var.ssh-key-name
  public_key = file(var.ssh-key-path)
}
