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
echo -e "paste_public_key_pair_value_here" >> /home/ubuntu/.ssh/authorized_keys

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