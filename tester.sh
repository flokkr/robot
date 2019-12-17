#!/usr/bin/env bash
set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
robot "$@"
python3 -m http.server

