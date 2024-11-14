FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository 'deb http://deb.debian.org/debian bullseye main contrib non-free' \
    && apt-get update && apt-get install -y \
        dpkg \
        dpkg-dev \
        wget \
        grep \
        imagemagick \
        fuse \
        libfuse2 \
        sed \
        file \
        desktop-file-utils \
        binutils \
        coreutils \
    && mkdir -p  /data \
    && cd /data && wget https://github.com/AppImage/pkg2appimage/raw/master/pkg2appimage \
    && chmod +x /data/pkg2appimage

VOLUME [ "/data" ]
WORKDIR /data
CMD ./pkg2appimage Wireshark-Docker.yml