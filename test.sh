#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

origin="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd )"

echo "origin is ${origin}"

cd build

case "$(uname)" in
  Darwin)
    os="macosx"
  ;;

  Linux)
    os="linux"
  ;;

  *)
    echo $"unknown OS. Stopping"
    exit 1
 
esac

echo "os is: ${os}"

./premake/${os}/premake5 gmake

cd $origin

echo "now in $(pwd)"

make -C build/${os}/gmake config=debug clean
make -C build/${os}/gmake config=debug
