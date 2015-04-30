#!/bin/bash

CONFD_DIR=usr/local/nginx/conf.d/
CONFD_TEMPLATES=`find ${CONFD_DIR} -name '*.conf.template'`
BIND_VARIABLES=\'`cat ./require_environment_variable | sed -e 's/\(.*\)/\$\{\1\}/' | tr '\n' ' '`\'

for TEMPLATE in $CONFD_TEMPLATES
do
  GENERATED_FILE=$CONFD_DIR`basename $TEMPLATE .template`
  envsubst $BIND_VARIABLES < $TEMPLATE > $GENERATED_FILE
done
