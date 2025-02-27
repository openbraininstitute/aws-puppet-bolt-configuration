#!/bin/bash

 if [ -z "$AWS_CORESERVICES_PRIVATE_KEY" ]; then AWS_CORESERVICES_PRIVATE_KEY should be set; exit 1; fi

# install puppet-bolt
. /etc/lsb-release # set $DISTRIB_CODENAME variable

wget https://apt.puppet.com/puppet-tools-release-${DISTRIB_CODENAME}.deb
sudo dpkg -i puppet-tools-release-${DISTRIB_CODENAME}.deb
sudo apt-get update
sudo apt-get install puppet-bolt -y

# configure ssh-agent with private key
ssh-agent > /tmp/agent
source /tmp/agent
echo $AWS_CORESERVICES_PRIVATE_KEY | base64 -d > private-key.pem
chmod 400 private-key.pem
ssh-add private-key.pem

export BOLT_PROJECT=$(pwd)

pwd

BASTION_NODES=("ssh.openbrainplatform.org" "ssh.staging.openbrainplatform.org")
for NODE in "${BASTION_NODES[@]}"; do
  # copy script to bastion
  scp -o StrictHostKeyChecking=no .github/scripts/run-bastion-host.sh ec2-user@$NODE:/tmp/
  # exec script
  ssh -o StrictHostKeyChecking=no ec2-user@$NODE bash /tmp/run-bastion-host.sh
done

bolt module install
bolt plan run aws --native-ssh -v
