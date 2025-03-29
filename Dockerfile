FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
python3.10 \
python3.10-distutils \
curl \
git \
software-properties-common

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.10 get-pip.py

RUN python3.10 -m pip install --upgrade pip 

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
