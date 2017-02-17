FROM debian:jessie
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get update
RUN apt-get install -y --no-install-recommends openssh-client

VOLUME ["/ssh"]

COPY entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/entrypoint.sh /
ENTRYPOINT ["entrypoint.sh"]
