#!/bin/bash

service nginx start

aws s3 sync s3://jenkins.arimit.su/root/.jenkins/ /root/.jenkins/

nohup java -jar /opt/jenkins.war --httpPort=7000 2>&1 > /root/.jenkins/jenkins.log &

/bin/bash
