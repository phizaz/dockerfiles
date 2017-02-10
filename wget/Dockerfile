FROM debian:jessie
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget

VOLUME ["/workdir"]

WORKDIR /workdir

ENTRYPOINT ["wget"]
