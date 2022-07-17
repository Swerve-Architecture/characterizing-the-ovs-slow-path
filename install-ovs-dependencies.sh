#!/bin/sh
printf "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-12 main" |sudo tee /etc/apt/sources.list.d/llvm-toolchain-xenial-12.list
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key |sudo apt-key add -
apt-get update
apt-get install make cmake
apt-get install llvm-12 clang-12
apt-get install meson ninja-build
apt-get install -y autotools-dev autoconf libtool
apt-get install systemtap-sdt-dev