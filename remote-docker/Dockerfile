FROM python:3
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get update
RUN apt-get install -y --no-install-recommends openssh-client
RUN apt-get install -y --no-install-recommends rsync

RUN pip install remote-docker

# keep alive
RUN echo "ServerAliveInterval 60" >> /etc/ssh/ssh_config

VOLUME ["/ssh"]
VOLUME ["/run"]

WORKDIR /run
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
