FROM ubuntu:latest
MAINTAINER Simon Menke <simon.menke@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Ensure UTF-8
RUN apt-get update
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*

RUN /scripts/install.sh
RUN /scripts/configure.sh
RUN touch /firstrun

EXPOSE 5432

ENTRYPOINT ["/scripts/start.sh"]
