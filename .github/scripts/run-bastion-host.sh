#!/bin/bash

# This is executed as the 'ec2-user' on the SSH bastion host on AWS.
# Use 'sudo' to run commands as root.

sudo yum install -y nmap-ncat dnf-automatic

# configure dnf-automatic for automatic security upgrades
sudo sed -c -i "s/\(upgrade_type *= *\).*/\1security/" /etc/dnf/automatic.conf
sudo sed -c -i "s/\(apply_updates *= *\).*/\1yes/" /etc/dnf/automatic.conf
sudo sed -c -i "s/\(download_updates *= *\).*/\1yes/" /etc/dnf/automatic.conf
sudo systemctl enable dnf-automatic.timer && sudo systemctl start dnf-automatic.timer
