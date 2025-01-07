#!/bin/bash

################################################################################
#
#  Name:           UniFi Network Server Installation Script for Ubuntu
#  Version:        1.0.0.20250105
#  Description:    This bash script installs Pi-Hole
#
#  Author:         SchmittyD
#  Created:        24/12/2024 (AEST)
#  Updated:        24/12/2025	(AEST)
#  Github:         https://github.com/dzlhub/linux-setup-config
#  Email:          email
#  Website:        https://dev.dzlhub.xyz
#  Twitter:        https://twitter.com/schmittyd
#
################################################################################


### Install  Dependencies

## Install Open JDK JRE Headless
sudo apt install openjdk-17-jre-headless


## MongoDB 7.0 - UniFi Network Server only supports version < 7.1.0
# Import the public key
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# Create the list file
echo "deb [ arch=amd64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org.list

# Reload the package database
sudo apt update

# Install MongoDB Community Server
sudo apt-get install -y mongodb-org=7.0.14 mongodb-org-database=7.0.14 mongodb-org-server=7.0.14 mongodb-mongosh mongodb-org-mongos=7.0.14 mongodb-org-tools=7.0.14


## UniFi Network Server

# Import the public key
sudo wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg

# Create the list file
echo 'deb [ arch=amd64 ] https://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list

# Reload the package database & Install UniFi Network Server
sudo apt update && sudo apt -y install unifi
