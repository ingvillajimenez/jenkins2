#! /bin/bash

ssh ubuntu@192.168.64.3 << EOF
  cd /home/ubuntu/server

  git pull origin master
EOF