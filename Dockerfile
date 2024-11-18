# TODO (DANOBLE) Complete copyright notice and reference SPDX document that references MIT and Roon software terms and conditions
# TODO (david-noble) Contact original author about his license and on how to credit/collaborate with him.
# TODO (david-noble) Ensure that we comply with the OCI Image Format Specification at https://github.com/opencontainers/image-spec.
# TODO (david-noble) Ensure that the license expression specifies MIT AND the Roon license at https://roon.app/en/termsandconditions.

#################################################
# Copyright
# SPDX Document reference
#############################################

FROM ubuntu:latest
LABEL org.opencontainers.image.vendor="Noble Factor"
LABEL org.opencontainers.image.authors="David-Noble@noblefactor.com"
LABEL org.opencontainers.image.licenses="MIT AND LicenseRef:Roon-software-terms-and-conditions https://roon.app/en/termsandconditions"

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
