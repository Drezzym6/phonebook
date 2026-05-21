#!/bin/bash
set -e
dnf update -y
dnf install python3-pip git -y
pip3 install flask==2.3.3 flask_mysql
TOKEN=${user-data-git-token}
GIT_USER=${user-data-git-name}
cd /home/ec2-user && git clone https://$TOKEN@github.com/$GIT_USER/phonebook.git
export MYSQL_DATABASE_HOST=${db-endpoint}
export MYSQL_DATABASE_USER=admin
export MYSQL_DATABASE_PASSWORD=${db-password}
python3 /home/ec2-user/phonebook/phonebook-app.py
