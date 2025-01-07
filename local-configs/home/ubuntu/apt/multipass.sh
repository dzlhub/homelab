#!/bin/bash

################################################################################
#
#  Name:           KVM Installation Script for Ubuntu
#  Version:        1.0.0.20250105
#  Description:    This bash script installs KVM
#
#  Author:         SchmittyD
#  Created:        05/01/2025 (AEST)
#  Updated:        05/01/2025	(AEST)
#  Github:         https://github.com/dzlhub/linux-setup-config
#  Email:          email
#  Website:        https://dev.dzlhub.xyz
#  Twitter:        https://twitter.com/profile
#
################################################################################


# This updates the packages on the system from the distribution repositories.
apt update -y
apt upgrade -y

# This installs the multipass for creating virtual machines
sudo snap install multipass
