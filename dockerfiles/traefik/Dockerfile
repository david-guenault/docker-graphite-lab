ARG REPOSITORY
ARG IMAGE
ARG TAG
FROM $REPOSITORY$IMAGE:$TAG
ARG AUTHOR
LABEL AUTHOR="$AUTHOR"

COPY ./conf/traefik.toml /etc/traefik/traefik.toml