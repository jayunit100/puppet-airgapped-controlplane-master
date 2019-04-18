#!/bin/bash
if [ "$(whoami)" != "root" ]
then
   echo "not running as `whoami`, instead, running as root, so $puppet commands work!"
   sudo su -s "$0"
   exit
fi

puppet="/opt/puppetlabs/bin/puppet"
cat master.local > /etc/hostname
echo "127.0.0.1		puppet" > /etc/hosts

function pre() {
	hostname master.local
	rpm -Uvh https://yum.puppetlabs.com/puppet6/puppet-release-el-7.noarch.rpm
	yum install -y puppetserver
	echo "waiting to run puppet...."
	sleep 2
	$puppet resource package puppetserver ensure=latest
	systemctl restart puppetserver
	
}

function inject_nodelet() {
	cp /vagrant/nodelet /etc/puppetlabs/code/environments/production/manifests/site.pp
}

function post() {
	whoami
	$puppet module install puppetlabs-docker --version 3.5.0
	$puppet module install puppetlabs-ntp
	# This could be done w/ an autosign.conf file.
	until /opt/puppetlabs/bin/puppetserver ca sign --certname=slave1.local ; do
		echo "couldnt find slave1.local cert, will try to sign again in a few"
		sleep 10
	done
}

pre
inject_nodelet
post
echo "Signed the cert !"


