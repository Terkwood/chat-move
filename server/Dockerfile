FROM debian:stable-slim

# these can probably be trimmed up:
#       autoconf automake cmake
RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
    autoconf automake bzip2 cmake curl gettext git libtool xz-utils \
    libudev-dev libx11-dev libxcursor-dev libxrandr-dev libasound2-dev libpulse-dev \
    libgl1-mesa-dev libglu1-mesa-dev libxi-dev libxinerama-dev yasm

RUN apt-get -y install wget unzip

WORKDIR /opt/chat-move

ENV GODOT_VERSION=3.2.3

RUN wget https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v${GODOT_VERSION}-stable_linux_server.64.zip

RUN unzip *.zip

RUN rm *.zip

ENV BIN_NAME=chat-move-server

RUN mv Godot_v${GODOT_VERSION}-stable_linux_server.64 ${BIN_NAME}

RUN chmod 755 ${BIN_NAME}

COPY target/${BIN_NAME}.pck .

RUN ls -lR

ENV PATH=/opt/chat-move:$PATH


RUN whoami

CMD "./${BIN_NAME}"
