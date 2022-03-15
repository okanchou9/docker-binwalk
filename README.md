# Docker Binwalk

[Binwalk](https://github.com/ReFirmLabs/binwalk/) is a fast, easy to use tool for analyzing and extracting firmware images.

Just modified the original script to support latest Binwalk and Python3.

## Features

* binwalk is built from the git master branch.
* Image based on `ubuntu:latest`.
* Dependencies installed via `https://github.com/ReFirmLabs/binwalk/blob/master/deps.sh`

## Usage

```shell
$ git clone https://github.com/okanchou9/docker-binwalk.git && cd docker-binwalk
$ docker build -t binwalk:latest . --no-cache
$ docker run -it --rm -v "$(pwd):/binwalk" binwalk:latest [binwalk options] ./firmware.bin
```
