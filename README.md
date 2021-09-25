# ElasticMonitoring
A quick script to install the relevant beats required for standard Elastic/Kibana monitoring. 

This is configured and tested on Ubuntu 18.04

What will this script do? 

1. Update Apt-get 
2. Install Filebeat and MetricBeat
3. Attempt to clone configuration files from a private github repo (create your own or wget from a different source!)
4. Copy config files to relevant folders
5. Check for any apache/mysql install, if there is, it'll activate the relevant modules
6. Install base modules, for system metrics and linux logs
7. Start the service

More to come soon! For any questions, open an issue, we are happy to help! 

This project is part of Jumpstart Innovation Labs's commitment to open source. We are open sourcing 50% of our software by December 2022. 

Email support@jumpstartlabs.co for any questions! 
