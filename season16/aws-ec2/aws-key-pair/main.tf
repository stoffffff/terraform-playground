resource "tls_private_key" "datacenter_kp" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save private key to file
resource "local_file" "datacenter_kp_pem" {
  content         = tls_private_key.datacenter_kp.private_key_pem
  filename        = "/home/bob/datacenter-kp.pem"
  file_permission = "0600"
}

# Create AWS key pair using generated public key
resource "aws_key_pair" "datacenter_kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter_kp.public_key_openssh
}