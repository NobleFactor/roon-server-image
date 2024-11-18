FROM ubuntu:latest
LABEL org.opencontainers.image.authors="David-Noble@noblefactor.com"

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils libicu74

ENV PACKAGE https://download.roonlabs.net/builds/RoonServer_linuxx64.tar.bz2
ENV PREFIX /opt/local

VOLUME [ "${PREFIX}/share/roon-server", "${PREFIX}/var/roon-server/data", "${PREFIX}/var/roon-server/music", "${PREFIX}/var/roon-server/backup" ]
ADD start-roonserver /

ENTRYPOINT /start-roonserver --package ${PACKAGE} --prefix ${PREFIX}
