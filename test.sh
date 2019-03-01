#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

origin="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd )"

echo "origin is ${origin}"

cd build

if [ $(uname) == "Darwin" ]; then
  os="macosx"
else
    if [ $(uname) == "Linux" ]; then
        os="linux"
    fi
fi

echo "os is: ${os}"

./premake/${os}/premake5 gmake

cd $origin

echo "now in $(pwd)"

make -C build/${os}/gmake config=debug clean
make -C build/${os}/gmake config=debug
