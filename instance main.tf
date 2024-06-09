provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "groot" {
  ami           ="ami-09040d770ffe2224f"
  instance_type = "t2.micro"
  key_name      = "yup-key"  
  tags = {
    Name = "groot-instance"
  }

vpc_security_group_ids = [aws_security_group.allow_ssh.id]

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow inbound SSH traffic"

  // Ingress rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 


output "instance_ip" {
  value = aws_instance.groot.public_ip
}

