resource "aws_instance" "ec2" {
  ami           = var.priv_instance_ami
  instance_type = var.priv_instance_type
  subnet_id = aws_subnet.subnet03.id
  key_name = var.priv_instance_key_name
  
  tags = {
    Name = var.priv_instance_name
  }
}