# Create EC2
resource "aws_instance" "ec2-server" {
  ami                         = var.ec2_server_ami
  instance_type               = var.ec2_server_type
  associate_public_ip_address = var.ec2_server_public_ip
  key_name                    = "ClassKeyJenkins"
  # key_name                    = aws_key_pair.ec2_key.key_name
  subnet_id                   = aws_subnet.ec2-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.ec2-server-sg.id]
  # user_data = <<EOF
  # #!/bin/bash
  # echo "Copying public Key to ec2-server"
  # sudo chown root:root /home
  # sudo chmod 755 /home
  # sudo chown ubuntu:ubuntu /home/ubuntu -R
  # sudo chmod 700 /home/ubuntu /home/ubuntu/.ssh
  # sudo chmod 600 /home/ubuntu/.ssh/authorized_keys
  # echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqPj+C2AIDKJMP+wNMTd2jtgvfwm8J7jCXRCVjgdLqUm94m9SPJdNFgG1uOSChP3MSB+gZ2XC14rL224HXvI1wAdjcFZ/2YELy4jEn2pARkYOPNbklxVuulwwwMmNsXV+9I20JZuub9pB/ZrlZ7fTatMMDra4pOmY7cDrY0hQbVim/YnXpKQJdIFy28S1YA+qalGTTZFCmZh3mGGl7RE8SNAx5Uvik9pHip1YVF7RlQ5SyyYRAm1DBS8gZjnaHt0FIJETtv4yRG8bPAO9eiyB79uFNe7SAUij+DtHRjeHL7kaGznCwHlORCIt7gmc03f9+0QOarImMZ+IueD+WRCIJ1lptkfEFd79PX1e+qPSxeLDEqr2TzJixGwY+q14IuncX6l/sgQ9RzpJfu9FxNrEkP76kzVzjMRHhIcJLTy3unPF89ar1wehsw2VfmdE43pSc0Fy7lqzK6Up73FT1kbGxCzLIHZ0Ea0zFUyKMXktZvONUXVS0XDB7tyqAFmcVrtzgK1JsLNrT22yElad98TpfKT4JCoSgSmSCaF2kc4iBIgVe4uTz+qTWzCrdaU3w+D4A/Wc5VMBAHXlX0QqGvXntTWHoGyAVMxu1KsqvzaSnrp/GEmSxYULLHbxWxn6p1NQKdPIXvFsJyu7ZzEtDix3QBWEuCzXn0HJzMCg9xWe47w== ec2" >> /home/ubuntu/.ssh/authorized_keys
  # EOF

  # connection {
  #       type        = "ssh"
  #       host        = self.public_ip
  #       user        = "ubuntu"
  #       private_key = file("/home/abe/.ssh/id_rsa")
  #       timeout     = "4m"
  #   }
  tags = {
    Environment = "dev"
  }
}
