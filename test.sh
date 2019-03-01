#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

origin="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd )"

echo "origin is ${origin}"

cd build

./premake5.osx gmake

cd $origin

echo "now in $(pwd)"

make -C build/macosx/gmake config=debug clean
make -C build/macosx/gmake config=debug
