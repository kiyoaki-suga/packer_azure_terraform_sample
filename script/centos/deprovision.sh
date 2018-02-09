#/bin/sh
sudo yum -y remove ansible
sudo /usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync
