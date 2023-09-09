variable "AMI" {
  type = map(any)
  default = {
    ubuntu      = "ami-0f5ee92e2d63afc18"
    centsos     = "ami-0763cf792771fe1bd"
    amazon_linx = "ami-06f621d90fa29f6d0"
  }
}

variable "USERNAME" {
  type = map(any)
  default = {
    ubuntu      = "ubuntu"
    centos      = "centos"
    amazon_linx = "ec2-user"
  }
}

# key details 
variable "KEY_NAME" {
  type = map(any)
  default = {
    private_key = "websvrKey.pem"
    public_key  = "websrvKey.pub"
  }
}

variable "KEYNAME" {
  default = "websrvKey"
}


variable "INSTANCE_COUNT" {
  default = "1"
}

variable "MYIP" {
  default = "0.0.0.0/0"
  // You can also set your own ip address 
  // to get your ip address visit https://www.whatismyip.com/
}
