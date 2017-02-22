FROM debian:jessie
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get update
RUN apt-get install -y wget

VOLUME ["/workdir"]

WORKDIR /workdir

ENTRYPOINT ["wget"]
