#!/bin/bash
# YUM INSTALL PUPPET MASTER 

sudo echo slave1.local > /etc/hostname
sudo hostname slave1.local

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum install -y puppet

echo "waiting to run puppet...."

# This way, the certificate on the puppet master is trusted !!!
echo "10.168.33.1	master.local  puppet" >> /etc/hosts

sudo /bin/puppet agent --server master.local master.local --waitforcert 60 --test --debug
sudo puppet cert --list
