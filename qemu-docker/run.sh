#!/bin/bash

DN_SOURCE="${1:-/usr/src/linux-source-5.0.12-odroidc1/}"

cd "${DN_SOURCE}"

make oldconfig

gcc -dumpmachine
debuild -b -uc -us

exit 0

