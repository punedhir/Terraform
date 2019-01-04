##module "docker" {
##   source = "./eample"
#   ip = "192.168.56.5"
#   root = "rony"
#}
##module "docker2" {
#   source = "./example"
#   ip = "192.168.56.6"
#   root = "rony"
#}
##module "docker3" {
#   source = "./example"
#   ip = "192.168.56.5"
#   root = "rony"
#}
##module "docker4" {
#   source = "./eample"
#   ip = "192.168.56.6"
#   root = "rony"
#}
module "azure-puppetmaster" {
   source = "./azure"
   name = "puppetmaster"
   location = "East US"
   puppetin = "puppetmaster"
#   puppetpkg = "curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && dpkg -i puppetlabs-release-pc1-xenial.deb"  
#   puppetin = "apt-get --assume-yes update;  apt-get --assume-yes install puppetserver;  ufw allow 8140;  systemctl start puppetserver" 
}


module "azure-puppetserver1" {
   source = "./azure"
   name = "puppetserver1"
   location = "East US"
   puppetin = "puppetagent"
#   puppetpkg = "curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && dpkg -i puppetlabs-release-pc1-xenial.deb"  
#   puppetin = "apt-get --assume-yes update; apt-get --assume-yes install puppet-agent;  systemctl start puppet" 
}


module "azure-puppetserver2" {
   source = "./azure"
   name = "puppetserver2"
   location = "East US"
   puppetin = "puppetagent"
#   script = "puppetagent.sh"
}
