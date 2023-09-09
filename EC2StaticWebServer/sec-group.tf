resource "aws_security_group" "webSrv_SG" {
  name        = "webSrv_SG"
  description = "Security Group for Static web server"

  # outgoing traffic rules
  egress {
    # allows all the port
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # incomming traffic rules
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.MYIP]
    ipv6_cidr_blocks = ["::/0"]
  }

}
