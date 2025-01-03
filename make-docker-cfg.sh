#!/usr/bin/env bash

jobs="${jobs:-1}"

cat >bootstrap.cfg.docker <<EOL
ARCH=x86
ARCH_DIR=x86
FORCE_TIMESTAMPS=False
CHROOT=True
UPDATE_CHECKSUMS=False
JOBS=$jobs
SWAP_SIZE=0
FINAL_JOBS=2
INTERNAL_CI=False
INTERACTIVE=False
BARE_METAL=False
DISK=sda1
KERNEL_BOOTSTRAP=False
BUILD_KERNELS=False
CONFIGURATOR=False
BUILD_FIWIX=False
CONSOLES=False
BUILD_LINUX=False
EOL

