FROM ubuntu:20.04

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
 liblzo2-dev \
 git;

RUN pip3 install python-lzo pycryptodome

RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python

RUN git clone https://github.com/okanchou9/binwalk.git /binwalk; \
 cd /binwalk; \
 yes | ./deps.sh; \
 python3 setup.py install;

RUN apt-get clean; \
 rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
