ARG REPOSITORY
ARG IMAGE
ARG TAG
FROM $REPOSITORY$IMAGE:$TAG
ARG AUTHOR
LABEL AUTHOR="${AUTHOR}"

COPY grafana.repo /tmp/

WORKDIR /tmp

RUN mv /tmp/grafana.repo /etc/yum.repos.d/ && \
    wget https://packages.grafana.com/gpg.key && \
    rpm --import gpg.key && \
    rm -f gpg.key && \
    yum clean all && \
    yum -y update

RUN yum install -y grafana

RUN grafana-cli 

WORKDIR /