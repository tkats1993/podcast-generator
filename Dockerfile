FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
software-properties-common \
&& add-apt-repository ppa:deadsnakes/ppa \
&& apt-get update \
&& apt-get install -y \
python3.10 \
python3.10-distutils \
python3-pip \
git \
build-essential \
python3-dev \
libyaml-dev

RUN python3.10 -m pip install --upgrade pip 

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
