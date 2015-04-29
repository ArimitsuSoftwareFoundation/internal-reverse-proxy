FROM sxend/nginx:1.8.0.1

MAINTAINER sxend

ADD usr/local/nginx/conf/nginx.conf.generated usr/local/nginx/conf/nginx.conf

RUN update-rc.d nginx enable

CMD service nginx start && /bin/bash
