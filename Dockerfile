FROM ubuntu:16.04

ENV INKSCAPE_VERSION="0.92.5+68~ubuntu16.04.1" \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    add-apt-repository ppa:inkscape.dev/stable && \
    apt-get update && \
    apt-get install -y inkscape=${INKSCAPE_VERSION} && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/bin/inkscape" ]
