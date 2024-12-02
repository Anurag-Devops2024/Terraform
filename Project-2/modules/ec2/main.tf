resource "aws_instance" "ec2-instance-1" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id

  tags = {
    Name = var.name
  }
}