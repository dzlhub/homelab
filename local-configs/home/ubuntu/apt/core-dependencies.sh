#!/bin/bash

################################################################################
#
#  Name:           Core dependancies for Ubuntu
#  Version:        1.0.0.20250105
#  Description:    A bash script to install core dependancies for Ubuntu, which
#                  which are used for most third party APT packages
#
#  Author:         SchmittyD
#  Created:        07/12/2024 (AEST)
#  Updated:        05/01/2025	(AEST)
#  Github:         https://github.com/dzlhub/linux-setup-config
#  Email:          email
#  Website:        https://dev.dzlhub.xyz
#  Twitter:        https://twitter.com/schmittyd
#
################################################################################


# This updates the packages on the system from the distribution repositories.
apt update -y
apt upgrade -y

# This installs Multipass for creating virtual machines
sudo snap install multipass

# This installs the core depencencies that most third party packages not included in the distribution repositories require
sudo apt install -y net-tools ca-certificates curl wget htop iftop unzip dnsutils

# This intalls the keyrings for GPG keys required by third party packages to add packages to the system repositories
sudo install -m 0755 -d /etc/apt/keyrings
