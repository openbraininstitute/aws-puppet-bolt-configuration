#!/bin/bash
echo "❗ssh-agent with AWS coreservices key from pass needed❗"
ssh ec2-user@ssh.shapes-registry.org sudo yum install -y nmap-ncat
# ssh ec2-user@sbo-poc-pcluster.shapes-registry.org sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
# ssh ec2-user@sbo-poc-pcluster.shapes-registry.org sudo yum install puppet-agent -y
bolt module install
bolt plan run aws_poc --native-ssh -v
