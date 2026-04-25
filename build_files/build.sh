#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux emacs ripgrep fd-find

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Dank Material Shell installation (with Niri)
dnf5 copr -y enable avengemedia/dms
# Also install weak dependencies for DMS
# (Recommended packages used for DMS)
dnf5 install -y dms --setopt=install_weak_deps=True
# Install Niri to use with DMS
dnf5 install -y niri

dnf5 -y copr disable avengemedia/dms

#### Example for enabling a System Unit File

systemctl enable podman.socket

# Enable danksearch user service
# (Doesn't work)
#systemctl --user enable dsearch
