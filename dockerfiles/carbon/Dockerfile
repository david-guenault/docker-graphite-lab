ARG REPOSITORY
ARG IMAGE
ARG TAG
FROM $REPOSITORY$IMAGE:$TAG
ARG AUTHOR
LABEL AUTHOR="$AUTHOR"

ARG PREFIX_PATH
ARG GRAPHITEVERSION
ARG TWISTEDVERSION
ARG CONFIG

RUN pip install  cffi && \
    export PYTHONPATH="/opt/graphite/lib/:/opt/graphite/webapp/" && \
    pip install --no-binary=:all: whisper==${GRAPHITEVERSION} && \
    pip install --no-binary=:all: carbon==${GRAPHITEVERSION} && \
    pip install --no-binary=:all: graphite-web==${GRAPHITEVERSION} && \
    pip install gunicorn

RUN rm -f /opt/graphite/conf/*.example

COPY conf /opt/graphite/conf/

RUN mv /opt/graphite/conf/${CONFIG} /opt/graphite/conf/carbon.conf

COPY run.sh /

RUN chmod +x /run.sh && \
    mkdir -p /var/log/graphite && \
    dos2unix /opt/graphite/conf/*.conf && \
    dos2unix /run.sh && \
    useradd carbon && \
    chown -R carbon:carbon /opt/graphite /var/log/graphite

