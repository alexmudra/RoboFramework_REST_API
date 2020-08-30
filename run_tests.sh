#!/usr/bin/env bash

set -e

### constants ##################################################################

this_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ROBOT_VERSION="3.2.1"
IMAGE_NAME="robotframework"

 
### Run Test cases ###################################################

docker run --rm \
  --user robot --cap-drop ALL \
  --network="host" \
  -it \
  -v "$this_path/tests":/home/robot/tests \
  -v "$this_path/results":/home/robot/results \
  "$IMAGE_NAME:$ROBOT_VERSION" "${@:-tests}"

