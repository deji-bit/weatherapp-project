#!/bin/bash
sudo yum update -y
sudo yum install maven tomcat -y
sudo systemctl start tomcat