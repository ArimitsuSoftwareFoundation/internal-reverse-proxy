#!/bin/bash

envsubst '${DOCKER_REGISTRY_HOST}' < /usr/local/nginx/conf.d/docker-registry.nginx.conf.template > /usr/local/nginx/conf.d/docker-registry.nginx.conf

service nginx start

aws s3 sync s3://jenkins.arimit.su/root/.jenkins/jobs/ /root/.jenkins/jobs/

nohup java -jar /opt/jenkins.war --httpPort=7000 2>&1 > /root/.jenkins/jenkins.log &

/bin/bash
