#!/bin/bash

################################################################################
#
#  Name:           FFMPEG Installation Script for Ubuntu
#  Version:        1.0.0.20250105
#  Description:    This bash script installs the Docker GPG key, adds the
#                  the Docker repository to APT sources and installs the
#                  Docker Engine, Docker Engine CLI and Docker Compose Plugin
#
#  Author:         SchmittyD
#  Created:        18/12/2024 (AEST)
#  Updated:        18/12/2025	(AEST)
#  Github:         https://github.com/dzlhub/linux-setup-config
#  Email:          email
#  Website:        https://dev.dzlhub.xyz
#  Twitter:        https://twitter.com/schmittyd
#
################################################################################


# This updates the packages on the system from the distribution repositories.
apt update -y
apt upgrade -y

# This installs the dependencies required to compile FFMPEG
sudo apt update -qq && sudo apt install -y \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libfreetype6-dev \
  libgnutls28-dev \
  libtool \
  meson \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev \
  nasm

# Create directories for source code and binaries to be placed in
mkdir -p ~/ffmpeg_sources ~/bin

# This installs the dependencies required to compile FFMPEG
sudo apt update -qq && sudo apt install -y \
  libass-dev \
  libmp3lame-dev \
  libsdl2-dev \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  libx264-dev \
  libx265-dev \
  libnuma-dev \
  libvpx-dev \
  libfdk-aac-dev \
  libopus-dev \
  libsvtav1-dev \
  libsvtav1enc-dev \
  libsvtav1dec-dev \
  libdav1d-dev

# Compile FFMPEG
cd ~/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-gnutls \
  --enable-libaom \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libsvtav1 \
  --enable-libdav1d \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree && \
PATH="$HOME/bin:$PATH" make && \
make install && \
hash -r

# This maps the path for the manual to the system manpath
echo "MANPATH_MAP $HOME/bin $HOME/ffmpeg_build/share/man" >> ~/.manpath
