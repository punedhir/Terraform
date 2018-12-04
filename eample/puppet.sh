#!/bin/bash
#sudo apt-get update && sudo apt-get install ruby -y
echo "rony" | sudo -S apt install -y tree 
echo "rony" | sudo -S apt install -y puppet-common 
echo "Test conf"
puppet --version
tree
#sudo gem install --no-document puppet 
exit
