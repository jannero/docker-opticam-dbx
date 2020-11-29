FROM python:3.6-alpine3.7

RUN \
  apk add --update \
    alpine-conf \
    bash \
    ca-certificates \
    ffmpeg \
    shadow \
    sudo \
    tzdata

RUN \
  adduser -D -h /home/opticam-dbx opticam-dbx && \
  mkdir /videos && \
  chown opticam-dbx:opticam-dbx /videos

ENV VIDEO_ROOT_DIR=/videos

ARG OPTICAM_DBX_VERSION=0.3.1
RUN pip install opticam_dbx==${OPTICAM_DBX_VERSION}

ENTRYPOINT ["python", "-m", "opticam_dbx.cli"]
