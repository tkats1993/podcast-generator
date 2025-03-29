FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-distutils \
    python3-pip \
    curl \
    git \
    software-properties-common

# Αναβάθμιση pip για την Python 3.10
RUN python3.10 -m pip install --upgrade pip

# Εγκατάσταση PyYAML
RUN python3.10 -m pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

