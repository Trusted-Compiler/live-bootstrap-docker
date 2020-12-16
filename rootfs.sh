#!/bin/bash
set -ex

# Setup tmp 
mkdir -p tmp/
sudo mount -t tmpfs -o size=8G tmpfs tmp

# Now copy everything over

# base: mescc-tools-seed
cp -r mescc-tools-seed/x86/* tmp
cp -r mescc-tools-seed/{M2-Planet,mes-m2,mescc-tools} tmp/
cp bootstrap-seeds/POSIX/x86/kaem-optional-seed tmp/init
cp bootstrap-seeds/POSIX/x86/kaem-optional-seed tmp/
cp -r bootstrap-seeds tmp/
mkdir tmp/bin

# blynn-compiler
pushd tmp
git clone ../blynn-compiler-oriansj blynn-compiler
cp ../blynn-compiler-extras/go.kaem blynn-compiler/ 
patch -Np0 -i ../blynn-compiler-extras/kaem.patch
mkdir blynn-compiler/{bin,generated}
popd

# General cleanup
find tmp -name .git -exec rm -rf \;

# initramfs
cd tmp 
find . | cpio -H newc -o | gzip > initramfs.igz
qemu-system-x86_64 -enable-kvm -kernel ../kernel -initrd initramfs.igz -append console=ttyS0 -nographic -m 16G

# Cleanup
sudo umount tmp
