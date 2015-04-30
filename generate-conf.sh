#!/bin/bash

CONFD_DIR=usr/local/nginx/conf.d/
CONFD_TEMPLATES=`find ${CONFD_DIR} -name '*.conf.template'`

for TEMPLATE in $CONFD_TEMPLATES
do
  GENERATED_FILE=$CONFD_DIR`basename $TEMPLATE .template`
  envsubst '${DOCKER_REGISTRY_HOST_NAME} ${ASF_SITE_HOST_NAME}' < $TEMPLATE > $GENERATED_FILE
done
