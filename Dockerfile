# pull base image
FROM python:3.9.15-slim-buster
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install  dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        pkg-config \
        autoconf \
        automake \
        libtool \
        build-essential \
        lsb-release \
        wget \
        automake libtool pkg-config libsqlite3-dev sqlite3 \
        libpq-dev \
        libcurl4-gnutls-dev \
        libproj-dev \
        libxml2-dev \
        libnetcdf-dev \
        libpoppler-dev \
        libspatialite-dev \
        libhdf4-alt-dev \
        libhdf5-serial-dev \
        libopenjp2-7-dev

# Install gdal, geos and proj
COPY ./build_deps.sh /
RUN /build_deps.sh

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait