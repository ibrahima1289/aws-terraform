# Create EC2
resource "aws_instance" "ec2-server" {
  ami                         = var.ec2_server_ami
  instance_type               = var.ec2_server_type
  subnet_id                   = aws_subnet.ec2-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.ec2-server-sg.id]
  associate_public_ip_address = var.ec2_server_public_ip
  user_data                   = file("pubkey.sh")

  tags = {
    Environment = "dev"
  }
}