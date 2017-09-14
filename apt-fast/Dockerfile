FROM ubuntu:16.04

###### SETUP APT-FAST #####################
RUN apt-get update && apt-get install -y aria2 git \
    && git clone https://github.com/ilikenwf/apt-fast /tmp/apt-fast \
    && cp /tmp/apt-fast/apt-fast /usr/bin \
    && chmod +x /usr/bin/apt-fast \
    && cp /tmp/apt-fast/apt-fast.conf /etc

CMD ["apt-fast", "--help"]
