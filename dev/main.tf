# Create EC2
resource "aws_instance" "ec2-server" {
  ami                         = var.ec2_server_ami
  instance_type               = var.ec2_server_type
  associate_public_ip_address = var.ec2_server_public_ip
  subnet_id                   = aws_subnet.ec2-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.ec2-server-sg.id]
  user_data = "${file("pubkey.sh")}"

  # key_name                    = aws_key_pair.key.key_name
  # iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
    
  tags = {
    Environment = "dev"
  }
}
