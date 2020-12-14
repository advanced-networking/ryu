FROM python:3.9-alpine

RUN apk add --no-cache \
    gcc \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    musl-dev \
    openssl-dev \
    py3-cryptography \
    py3-lxml \
    py3-toml \
    py3-yaml \
    zlib-dev

WORKDIR /src/ryu
COPY . .
RUN chmod +x tools/docker-entrypoint.sh

RUN pip install .

ENV CONTROLLER_DIR=/controllers
ENV CONTROLLER=
WORKDIR $CONTROLLER_DIR


ENTRYPOINT [ "sh", "/src/ryu/tools/docker-entrypoint.sh" ]
