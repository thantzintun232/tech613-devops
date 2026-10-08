#! bin/bash
# purpose of this script : run on fresh ubuntu 24.04, install nginx
# update
sudo apt-get update 
# upgrade
sudo apt-get upgrade
# install nginx
sudo apt-get install nginx -y 
# restart nginx
sudo systemctl restart nginx
# enable nginx
sudo systemctl enable nginx


**Note**
- After nginx installation, whenever ubuntu is running it will run nginx automatically. 
You can check the status of nginx using the command `systemctl status nginx`.   

