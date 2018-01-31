#!/bin/bash

#run migration scripts and init a user
sleep 1
promgen migrate
promgen register Prometheus localhost 9090

echo $PROMGEN_USER
promgen create_superuser_with_password --username $PROMGEN_USER --email $PROMGEN_EMAIL --password $PROMGEN_PASSWORD --preserve --noinput

promgen runserver 0.0.0.0:$PROMGEN_PORT
