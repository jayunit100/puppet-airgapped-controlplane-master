#!/bin/bash

alias puppet=/opt/puppetlabs/bin/puppet
function pre() {
	sudo echo slave1.local > /etc/hostname
	sudo hostname slave1.local
	rpm -Uvh https://yum.puppetlabs.com/puppet6/puppet-release-el-7.noarch.rpm

	yum install -y puppet

	# This way, the certificate on the puppet master is trusted !!!
	echo "10.168.33.1	master.local  puppet" >> /etc/hosts
}

function run_agent() {
	sudo /opt/puppetlabs/bin/puppet agent --server=master.local --waitforcert 60 --test --debug
}
pre
while true ; do
       sleep 5	
       run_agent
done

