#! /bin/bash

ssh ubuntu@192.168.64.3 << EOF
  cd /home/ubuntu/server/jenkins2

  git clone https://github.com/ingvillajimenez/jenkins2
  # git pull origin master
EOF