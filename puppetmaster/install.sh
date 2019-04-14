#!/bin/bash
# YUM INSTALL PUPPET MASTER 

cat master.local > /etc/hostname

sudo hostname master.local
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum install -y puppetserver
echo "waiting to run puppet...."
sleep 2
sudo /bin/puppet resource package puppetserver ensure=latest
systemctl restart puppetserver
