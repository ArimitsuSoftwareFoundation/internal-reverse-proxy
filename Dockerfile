FROM sxend/nginx:1.8.0.2

MAINTAINER sxend

ADD usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf

RUN mkdir -p /usr/local/nginx/conf.d

ADD usr/local/nginx/conf.d/* /usr/local/nginx/conf.d/

RUN update-rc.d nginx enable

RUN apt-get -y install python-pip

RUN pip install awscli

RUN wget -O /opt/jenkins.war http://mirrors.jenkins-ci.org/war/1.611/jenkins.war

RUN mkdir -p /root/.jenkins

RUN mkdir -p /root/.aws

ADD .aws/config /root/.aws/config

ADD .aws/credentials /root/.aws/credentials

ADD bin/startup.sh /bin/startup.sh

CMD /bin/startup.sh
