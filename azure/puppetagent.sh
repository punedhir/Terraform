#!/bin/bash
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo -s  dpkg -i puppetlabs-release-pc1-xenial.deb
sudo -s  apt-get --asssume-yes update
sudo -s  apt-get --asssume-yes install puppet-agent
echo "Puppet Agent completed"



