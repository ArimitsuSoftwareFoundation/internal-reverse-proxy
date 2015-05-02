FROM sxend/nginx:1.8.0.2

MAINTAINER sxend

ADD usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf

RUN mkdir -p /usr/local/nginx/conf.d

ADD usr/local/nginx/conf.d/* /usr/local/nginx/conf.d/

RUN update-rc.d nginx enable

CMD service nginx start && /bin/bash
