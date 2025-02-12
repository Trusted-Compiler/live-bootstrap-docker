#!/usr/bin/env bash

mkdir distfiles &&
  cd distfiles &&
  curl -L -O https://github.com/Trusted-Compiler/distfiles/releases/download/4eceb77/distfiles.tar.gz &&
  tar -xvf distfiles.tar.gz && rm distfiles.tar.gz &&
  cd .. && ./download-distfiles.sh
    
