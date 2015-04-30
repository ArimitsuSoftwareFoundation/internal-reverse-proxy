#!/bin/bash

CONFD_DIR=usr/local/nginx/conf.d/
CONFD_TEMPLATES=`find ${CONFD_DIR} -name '*.conf.template'`
BIND_VARIABLES="'"'${DOCKER_REGISTRY_HOST_NAME} ${ASF_SITE_HOST_NAME}'"'"
echo $BIND_VARIABLES
for TEMPLATE in $CONFD_TEMPLATES
do
  GENERATED_FILE=$CONFD_DIR`basename $TEMPLATE .template`
  envsubst $BIND_VARIABLES < $TEMPLATE > $GENERATED_FILE
done
