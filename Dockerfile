FROM sxend/nginx:1.8.0.2

MAINTAINER sxend

ADD usr/local/nginx/conf/nginx.conf.generated usr/local/nginx/conf/nginx.conf

ADD docker-registry.htpasswd.generated usr/local/nginx/docker-registry.htpasswd

RUN update-rc.d nginx enable

CMD service nginx start && /bin/bash
