resource "aws_instance" "webserver" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = "devops_demo_1"
  security_groups = [var.security_group]

  tags = {
    Name = var.name
  }

}

resource "null_resource" "copyhtml" {

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/Cloud Work/Devops/Practise Exercise/AWS Keys/AWS_KeyPair_EC2/devops_demo_1.pem")
    host        = aws_eip.eip.public_ip
  }

  provisioner "local-exec" {
    command = "echo 'Instance created'"
  }
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo su"
  #   ]
  # }

  provisioner "file" {
    source      = "../file-provisioner/copy.sh"
    destination = "/tmp/copy.sh"
  }

  provisioner "file" {
    source      = "../file-provisioner/website-1/"
    destination = "/tmp"
  }

  depends_on = [aws_instance.webserver]
}

resource "aws_eip" "eip" {
  instance = aws_instance.webserver.id
}
