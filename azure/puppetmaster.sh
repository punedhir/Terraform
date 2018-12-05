curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get --assume-yes update
apt-get --assume-yes install puppetserverufw allow 8140
systemctl start puppetserver
