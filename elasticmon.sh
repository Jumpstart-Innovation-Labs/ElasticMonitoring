#!/bin/sh

#install systems metrics metricbeat
apt-get update
apt-get upgrade
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.15.0-amd64.deb
dpkg -i metricbeat-7.15.0-amd64.deb

#install filebeat for logs
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.15.0-amd64.deb
dpkg -i filebeat-7.15.0-amd64.deb

#git repo with the config files for both
apt-get install git
git clone https://USERNAME:PASSWORD/PERSONALACCESSTOKEN@github.com/Jumpstart-Innovation-Labs/ElasticConf.git
#copy files to the config locations
cp /home/baxtmann/ElasticConf/filebeat.yml /etc/filebeat/filebeat.yml
cp /home/baxtmann/ElasticConf/metricbeat.yml /etc/metricbeat/metricbeat.yml

#if apache is installed

if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 1 ]
then
  filebeat modules enable apache
fi

#if mysql is installed

if [ $(dpkg-query -W -f='${Status}' mysql 2>/dev/null | grep -c "ok installed") -eq 1 ];
then
  filebeat modules enable mysql
fi

#Enable and configure metricbeat

metricbeat modules enable system

metricbeat setup

service metricbeat start

#Enable and configure filebeat
filebeat modules enable system

filebeat modules enable auditd

filebeat setup
service filebeat start
rm -rf ElasticConf/
