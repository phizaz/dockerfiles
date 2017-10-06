FROM debian:latest

ENV VERSION "1.38"

RUN apt-get update && apt-get install -y wget unzip
RUN wget https://downloads.rclone.org/rclone-v${VERSION}-linux-amd64.zip \
    && unzip -o rclone-v${VERSION}-linux-amd64.zip \
    && cp rclone-v${VERSION}-linux-amd64/rclone /usr/local/bin \
    && rm -r rclone-v${VERSION}-linux-amd64 \
    && rm rclone-v${VERSION}-linux-amd64.zip

WORKDIR workdir
ENTRYPOINT [ "rclone" ]

