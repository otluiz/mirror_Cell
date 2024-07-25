#!/bin/bash

# Atualizar e instalar dependências
sudo apt update
sudo apt install -y \
    ffmpeg \
    libsdl2-dev \
    adb \
    gcc \
    git \
    pkg-config \
    meson \
    ninja-build \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswresample-dev \
    libavdevice-dev \
    libusb-1.0-0-dev \
    openjdk-17-jdk

# Clonar o repositório do scrcpy
git clone https://github.com/Genymobile/scrcpy.git
cd scrcpy

# Configurar Meson
meson build --buildtype release --strip -Db_lto=true

# Compilar e instalar scrcpy
ninja -C build
sudo ninja -C build install

echo "scrcpy instalado com sucesso!"
