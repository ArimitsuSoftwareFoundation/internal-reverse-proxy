ASF internal reverse proxy container
====================================



## run
```
export AWS_KEY=key
export AWS_SECRET=secret
CONTAINER_ID=`docker run -e SETTINGS_FLAVOR=s3 -e AWS_BUCKET=docker-registry.arimit.su -e STORAGE_PATH=/registry -e AWS_KEY=${AWS_KEY} -e AWS_SECRET=${AWS_SECRET} -e SEARCH_BACKEND=sqlalchemy -d -i -t -p 5000:5000 registry`

CONTAINER_IP=`docker inspect --format="{{.NetworkSettings.IPAddress}}" ${CONTAINER_ID}`
DOCKER_REGISTRY_HOST=http://${CONTAINER_IP}:5000

docker build --tag="docker-registry.arimit.su/internals/internal-reverse-proxy:`git rev-parse HEAD`" .
docker run -it -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/certs/nginx:/etc/certs/nginx \
  -p 80:80 -p 81:81 docker-registry.arimit.su/internals/internal-reverse-proxy:`git rev-parse HEAD`
```

## run nghttp2
```
docker run -it -p 443:443 -v /etc/certs/nghttp2:/etc/certs/nghttp2 sxend/nghttp2:0.7.13-1.3.2

nghttpx -D --http2-proxy -f0.0.0.0,443 -b192.168.0.101,81 \
  --dh-param-file=/etc/certs/nghttp2/reverse-proxy.dhp \
  /etc/certs/nghttp2/reverse-proxy.key /etc/certs/nghttp2/reverse-proxy.crt

```
