FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /binwalk

RUN apt-get update -y; \
 \
 apt-get install -y \
 wget \
 curl \
 python3 \
 python3-pip \
 xvfb \
 git;

RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python

RUN git clone https://github.com/ReFirmLabs/binwalk.git /binwalk; \
 cd /binwalk; \
 python setup.py install; \
 yes | ./deps.sh;

RUN apt-get clean; \
 rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/binwalk"]
