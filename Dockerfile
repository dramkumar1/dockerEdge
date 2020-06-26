FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install wget -y && \
    apt-get install curl -y && \
    apt-get install hping3 -y -6 -1 && \
    apt-get install apache2 -y && \
    apt-get install docker.io -y && \
    apt-get install nano -y &&
