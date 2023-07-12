#!/bin/bash
echo "❗ssh-agent with AWS coreservices key from pass needed❗"
# to add the key:
# pass systems/services/external/aws/ssh/aws_coreservices_password
# pass systems/services/external/aws/ssh/aws_coreservices_private_key | ssh-add -

# Install nc, so that it's possible to use the ssh bastion host to forward ssh connections
# to other hosts, such as the sbo-poc-compute01 HPC test VM.
ssh ec2-user@ssh.shapes-registry.org sudo yum install -y nmap-ncat

# Puppet bolt always first attempts to install the puppet agent on a node to gather facts
# before it attempts to run any manifests. Normally it does this automatically, but this
# fails on the pcluster node, because it uses Amazon Linux and that distro is not supported.
# => Install the rhel7 agent manually and disable the automatic install with a
#    features: puppet-agent block in the inventory.yaml.
# Currently disabled as at the moment we're no longer applying puppet manifest changes on
# the head node: it's done by a python script made by Omar.
#ssh ec2-user@sbo-poc-pcluster.shapes-registry.org sudo rpm -Uvh https://yum.puppet.com/puppet7-release-el-7.noarch.rpm
#ssh ec2-user@sbo-poc-pcluster.shapes-registry.org sudo yum install puppet-agent -y

bolt module install
bolt plan run aws_poc --native-ssh -v
