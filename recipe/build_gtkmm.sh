#!/usr/bin/env bash
set -ex

# get meson to find pkg-config when cross compiling
export PKG_CONFIG=$BUILD_PREFIX/bin/pkg-config

meson ${MESON_ARGS} \
    --wrap-mode=nofallback \
    --buildtype=release \
    --prefix="${PREFIX}" \
    -Dlibdir=lib \
    -Dbuild-demos=false \
    -Dbuild-tests=false \
    builddir .

ninja -C builddir -j${CPU_COUNT}
ninja -C builddir install
