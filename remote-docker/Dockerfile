FROM python:latest
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get update
RUN apt-get install -y --no-install-recommends openssh-client
RUN apt-get install -y --no-install-recommends rsync

RUN pip install remote-docker

VOLUME ["/ssh"]
VOLUME ["/run"]

WORKDIR /run
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
