FROM lochnair/base:alpine
MAINTAINER Lochnair <me@lochnair.net>

LABEL Description="Docker image for NextCloud"

ENV DB_PASSWORD "CHANGE_THIS!"
ENV NC_DOMAIN "cloud.example.com"

# Stop container if initialization fails
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS "2"

# Install MySQL
RUN \
apk add \
	--no-cache \
	--update \
	mariadb

# Install Nginx + PHP7-FPM
# Also install ffmpeg (used for preview generation)
RUN \
apk add \
	--no-cache \
	--update \
	ffmpeg \
	nginx \
	php7-apcu \
	php7-bz2 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-fpm \
	php7-gd \
	php7-iconv \
	php7-intl \
	php7-json \
	php7-mbstring \
	php7-mcrypt \
	php7-openssl \
	php7-pdo_mysql \
	php7-posix \
	php7-xml \
	php7-xmlreader \
	php7-zip \
	php7-zlib

COPY root/ /