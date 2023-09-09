resource "aws_instance" "web01" {
  ami                    = var.AMI["ubuntu"]
  instance_type          = "t2.micro"
  key_name               = var.KEYNAME
  count                  = var.INSTANCE_COUNT
  vpc_security_group_ids = [aws_security_group.webSrv_SG.id]

  tags = {
    Name = "web01Test"
    Env  = "Testing"
    Type = "Static Web Hosting"
  }

  provisioner "file" {
    source      = "Scripts/provision.sh"
    destination = "/tmp/provision.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "chmod +x /tmp/provision.sh",
      "sudo /tmp/provision.sh",
    ]
  }

  connection {
    user        = var.USERNAME["ubuntu"]
    private_key = file(var.KEY_NAME["private_key"])
    host        = self.public_ip
  }
}

output "webserver_Public_IP" {
  value = "http://${aws_instance.web01[0].public_ip}/"
}
