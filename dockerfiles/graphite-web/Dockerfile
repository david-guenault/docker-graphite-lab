ARG REPOSITORY
ARG IMAGE
ARG TAG
FROM $REPOSITORY$IMAGE:$TAG
ARG AUTHOR
LABEL AUTHOR="$AUTHOR"

ARG PREFIX_PATH
ARG GRAPHITEVERSION
ARG LOCALSETTINGS
ARG SECRET_KEY 

RUN export PYTHONPATH="/opt/graphite/lib/:/opt/graphite/webapp/" && \
    pip install --no-binary=:all: whisper==${GRAPHITEVERSION} && \
    pip install --no-binary=:all: graphite-web==${GRAPHITEVERSION} && \
    pip install gunicorn && \
    pip install whitenoise

RUN export PYTHONPATH="/opt/graphite/lib/:/opt/graphite/webapp/" && \
    django-admin.py migrate --settings=graphite.settings --run-syncdb && \
    cp /opt/graphite/storage/graphite.db /

RUN export PYTHONPATH="/opt/graphite/lib/:/opt/graphite/webapp/" && \
    django-admin.py collectstatic --noinput --settings=graphite.settings

RUN mkdir -p /opt/graphite/webapp

RUN cp /opt/graphite/webapp/graphite/local_settings.py.example /opt/graphite/webapp/graphite/local_settings.py

COPY run.sh /

RUN chmod +x /run.sh && \
    dos2unix /run.sh

WORKDIR /opt/graphite/webapp

