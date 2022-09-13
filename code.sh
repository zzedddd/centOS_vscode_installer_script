#!/bin/bash

if [[ ! ${EUID} -eq 0 ]]; then
	echo "Please run this script as superuser"
	exit
fi

username=$( cat /etc/group | grep 1000 | awk -F":" '{print $1}' )

rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo "[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo

yum install -y code figlet 

rm -rf centOS_vscode_installer_script/

figlet -c "Installation  Completed!   $username"



