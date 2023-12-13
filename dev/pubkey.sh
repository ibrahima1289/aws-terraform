#!/bin/bash

# Add public key for ssh
add_Publickey () {
echo "Copying public Key to ec2-server"
sudo chown root:root /home
sudo chmod 755 /home
sudo chown ubuntu:ubuntu /home/ubuntu -R
sudo chmod 700 /home/ubuntu /home/ubuntu/.ssh
sudo chmod 600 /home/ubuntu/.ssh/authorized_keys

# Copy public key pair value to remote ec2 authorized_keys file
echo -e "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCHWEZTfSyStqluL1nTKphlS9TGqYy4lbwPMr6dbApEo7R0pDTt0Ry3pEEoCfoqQn3aKz2jkDfYQeWp5Du/G7OiWsAmQ3Gl1szFUBzdt7jtjMTnXZ9Au7cUDPFoRPhnVEyNPyRMGcvh3ELR+sKx91tzO5rAvSR1NCp3v6bUo/dg5q8xRt8+6xueQJYJx5qRa6IbbpKerwWgH08b1xhSJ9lt+Kw/zUcIDtQHq5yd+tbtAUipPXLvLeVeOCT5pi8TeoR8J97BAHz92lXHltClHwOCGbnTNxsiPHSk5qCnQHZNV/KheSbWGDu0stbgOyNOdjktIvo5QxeyvqXDHMyXqAFEgV2jGAneZZR707g3k8cwrsEVdbb6xDhP4sHwDV1cxycW/fmaUSpVZ/7iTV0CNWm4OJmnM6XcugYosq3cLsXpmKelksz5t3YN0jxNuXDxZyk8hyQfngmsRPZPurkIrTCLGj6T7WsZDi4agRi4IJdn9OMPPK+2hXD7e3RAsmj6QhU= abe@wsl" >> /home/ubuntu/.ssh/authorized_keys

}

# Install NGINX server
install_nginx () {
sudo apt update -y && sudo apt upgrade -y
sleep 5 
sudo apt install nginx -y
sleep 5
sudo systemctl start nginx

}

add_Publickey
sleep 10
install_nginx