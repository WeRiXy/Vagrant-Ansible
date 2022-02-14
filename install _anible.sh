#!/bin/sh
sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
service ssh restart
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt -y install ansible
cd /home/vagrant/ansible
sudo ansible-playbook Playbook.yml -i hosts.ini --ssh-common-args='-o StrictHostKeyChecking=no'