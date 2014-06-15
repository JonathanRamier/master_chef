#!/bin/bash

sudo apt-get update
sudo apt-get -y dist-upgrade

if [ ! -s release-upgrade.log ]; then
sudo do-release-upgrade -f DistUpgradeViewNonInteractive > release-upgrade.log
fi;


#wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
#sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
#sudo apt-get update
#sudo apt-get install jenkins