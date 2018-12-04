#!/bin/bash
curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo -s dpkg -i puppetlabs-release-pc1-xenial.deb
echo "depackage the puppet4" 
sudo -s apt-get --assume-yes update
sudo -s apt-get --assume-yes install puppetserver
sudo -s ufw allow 8140
sudo -s systemctl start puppetserver
echo "Puppet SErver has been started"



curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo -s dpkg -i puppetlabs-release-pc1-xenial.deb
sudo -s apt-get --assume-yes update
sudo -s apt-get --assume-yes install puppetserver
sudo -s ufw allow 8140
sudo -s systemctl start puppetserver
