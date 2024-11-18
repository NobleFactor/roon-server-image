FROM ubuntu:latest
LABEL org.opencontainers.image.authors="David-Noble@noblefactor.com"

ARG PACKAGE=https://download.roonlabs.net/builds/RoonServer_linuxx64.tar.bz2
ARG PREFIX=/opt/local

RUN apt-get update\
 && apt-get -y upgrade\
 && apt-get -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils libicu74

VOLUME [\
 "${PREFIX}/var/roon/data",\
 "${PREFIX}/var/roon/music",\
 "${PREFIX}/var/roon/backup" ]

ADD start-roonserver /

ENTRYPOINT [ "/start-roonserver", "--package", "${PACKAGE}", "--prefix", "${PREFIX}" ]
