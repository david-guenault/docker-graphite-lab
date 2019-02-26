#! /bin/bash
# SECRET_KEY
# CLUSTER_SERVERS
# CARBOLINK_HOSTS
# REPLICATION_FACTOR
# GUNICORN_PORT
# GUNICORN WORKERS
# export SECRET_KEY="lskflmkazmlrfkazmlcksqmlkqsmlfkzmlkdmlaksmlqskfmlqkfmlzkdmlskdmqlskdq"
# export CLUSTER_SERVERS=""
# export CARBOLINK_HOSTS=""
# export REPLICATION_FACTOR=1
cp /graphite.db /opt/graphite/storage/
cp /opt/graphite/webapp/graphite/local_settings.py.example /opt/graphite/webapp/graphite/local_settings.py
sed -i "s/^#SECRET_KEY = 'UNSAFE_DEFAULT'$/SECRET_KEY='${SECRET_KEY}'/g" /opt/graphite/webapp/graphite/local_settings.py
sed -i "s/^#CLUSTER_SERVERS.*$/CLUSTER_SERVERS = \[${CLUSTER_SERVERS}\]/g" /opt/graphite/webapp/graphite/local_settings.py
sed -i "s/^#CARBONLINK_HOSTS.*.$/CARBONLINK_HOSTS = \[${CARBONLINK_HOSTS}\]/g" /opt/graphite/webapp/graphite/local_settings.py
sed -i "s/^#REPLICATION_FACTOR.*$/REPLICATION_FACTOR = ${REPLICATION_FACTOR}/g" /opt/graphite/webapp/graphite/local_settings.py
sed -i "s/^#RENDERING_HOSTS.*$/RENDERING_HOSTS = ${RENDERING_HOSTS}/g" /opt/graphite/webapp/graphite/local_settings.py

gunicorn -w ${GUNICORN_WORKERS} -b 0.0.0.0:${GUNICORN_PORT} graphite.wsgi:application