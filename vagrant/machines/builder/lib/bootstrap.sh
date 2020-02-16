#!/usr/bin/env bash

#Install required software packages
rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install python-devel
yum -y install openssl-devel
yum -y install python-pip
yum -y install git

#Required for some vault functions
yum -y install sshpass

#optional package to give us netstat
yum -y install net-tools
yum -y install ansible
