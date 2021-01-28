# Image to runa Apache Airflow Breeze environment
# Airflow Breeze prerequisites:
# https://github.com/apache/airflow/blob/master/BREEZE.rst#prerequisites
#
# based on:
# https://github.com/GoogleCloudPlatform/cloud-builders-community/blob/master/docker-compose/Dockerfile

FROM ubuntu:bionic

ARG DOCKER_COMPOSE_VERSION

# https://docs.docker.com/compose/install/
RUN \
   apt-get -y update && \
   apt-get -y install util-linux coreutils ca-certificates curl docker.io && \
   rm -rf /var/lib/apt/lists/* && \
   curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
   chmod +x /usr/local/bin/docker-compose

CMD ["/bin/bash"]
