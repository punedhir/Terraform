wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt-get --asssume-yes update
apt-get --asssume-yes install puppet-agent
