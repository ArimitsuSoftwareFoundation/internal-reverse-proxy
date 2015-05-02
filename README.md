ASF internal reverse proxy container
====================================



## build
```
docker build --tag="docker-registry.arimit.su/`whoami`/internal-reverse-proxy:`git rev-parse HEAD`" .
docker run -it -p 443:443 -v /etc/certs/nginx:/etc/certs/nginx docker-registry.arimit.su/`whoami`/internal-reverse-proxy:`git rev-parse HEAD`
```
