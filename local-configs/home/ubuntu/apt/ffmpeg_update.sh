#!/bin/bash

################################################################################
#
#  Name:           FFMPEG Update Script for Ubuntu
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


# Remove current FFMPEG build source files and binaries
rm -rf ~/ffmpeg_build ~/bin/{ffmpeg,ffprobe,ffplay,x264,x265}

# This updates the packages on the system from the distribution repositories.
apt update -y
apt upgrade -y

# Create directories for source code and binaries to be placed in
mkdir -p ~/ffmpeg_sources ~/bin

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
