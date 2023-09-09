# generate the public-private key
resource "tls_private_key" "pk_generate" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

# store the generated private key in local disk 
resource "local_file" "web_srvKey_pem" {
  filename = var.KEY_NAME["private_key"]
  content  = tls_private_key.pk_generate.private_key_pem
}

# create aws key-pair
resource "aws_key_pair" "websrvKey" {
  key_name   = var.KEYNAME
  public_key = tls_private_key.pk_generate.public_key_openssh
}
