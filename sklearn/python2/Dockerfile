FROM python:2
MAINTAINER Konpat Preechakul <the.akita.ta@gmail.com>

RUN sed -i "s/httpredir.debian.org/`curl -s -D - http://httpredir.debian.org/demo/debian/ | awk '/^Link:/ { print $2 }' | sed -e 's@<http://\(.*\)/debian/>;@\1@g'`/" /etc/apt/sources.list
RUN apt-get clean && apt-key update && apt-get update

RUN apt-get install -y --no-install-recommends build-essential

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir numpy scipy
RUN pip install --no-cache-dir scikit-learn