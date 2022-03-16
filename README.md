# Docker Binwalk + ubi_reader

[Binwalk](https://github.com/ReFirmLabs/binwalk/) is a fast, easy to use tool for analyzing and extracting firmware images.

[ubi_reader](https://github.com/jrspruitt/ubi_reader) is a Python module and collection of scripts capable of extracting the contents of UBI and UBIFS images, along with analyzing these images to determine the parameter settings to recreate them using the mtd-utils tools.

Just modified the original script to support latest Binwalk + ubi_reader and Python3.

## Features

* binwalk is built from the git master branch.
* Image based on `ubuntu:latest`.
* Dependencies installed via `https://github.com/ReFirmLabs/binwalk/blob/master/deps.sh`

## Usage

```shell
$ git clone https://github.com/okanchou9/docker-binwalk.git && cd docker-binwalk
$ docker build -t binwalk:latest . --no-cache
$ docker run -it --rm -d --name binwalk -v "$(pwd):/binwalk" 
$ binwalk -e --run-as=root firmware.bin
$ cd firmware && ubireader_extract_images xxx.ubi
$ cd ubifs-root/xxx.ubi && binwalk -e --run-as=root YYY.ubifs
```
