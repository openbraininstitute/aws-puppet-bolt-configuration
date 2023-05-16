#!/bin/bash
echo "❗ssh-agent with AWS coreservices key from pass needed❗"
ssh  ec2-user@ssh.shapes-registry.org sudo yum install -y nmap-ncat
bolt plan run aws_poc --native-ssh -v
 