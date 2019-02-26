ARG REPOSITORY=dguenault/
ARG IMAGE=centos
ARG TAG=7
ARG AUTHOR="David GUENAULT"

FROM ${REPOSITORY}${IMAGE}:${TAG}
LABEL AUTHOR="${AUTHOR}"

RUN echo "sslverify=false" >> /etc/yum.conf

RUN yum install -y python-devel cairo-devel libffi-devel httpd perl pycairo mod_wsgi python-devel git gcc-c++

RUN yum -y install epel-release wget curl dos2unix

RUN wget https://bootstrap.pypa.io/get-pip.py && \ 
    python get-pip.py && \
    rm -f get-pip.py
