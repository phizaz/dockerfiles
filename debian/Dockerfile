FROM debian:jessie
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN apt-get clean && apt-key update && apt-get update

RUN apt-get install -y --no-install-recommends build-essential

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

