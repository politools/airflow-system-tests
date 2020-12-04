#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GCB_DIR=$(cd "${DIR}/../system_tests/" && pwd);
cd "${GCB_DIR}" || exit 1

TEST=$1
BUILD_ID=${2:-"manual"}
TAG="trigger-${BUILD_ID}"

if test -z "$TEST"
then
      echo "First argument is empty"
      echo "Quiting"
      exit 1
fi

CMD="./breeze tests --verbose --backend=postgres ${TEST} -- -s --system=google"

echo "Run single system test:"
echo "  test:"
echo "    ${TEST}"
echo "  cmd:"
echo "    ${CMD}"
echo "  tag:"
echo "    ${TAG}"
echo

gcloud builds submit . \
    --timeout=3600 \
    --substitutions _CMD="${CMD}",_TAG="${TAG}" \
    --async
