FROM python:3
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get update
RUN apt-get install -y --no-install-recommends openssh-client
RUN apt-get install -y --no-install-recommends rsync

RUN pip install remote-docker

VOLUME ["/ssh"]
VOLUME ["/run"]

WORKDIR /run
COPY entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/entrypoint.sh /
ENTRYPOINT ["entrypoint.sh"]
