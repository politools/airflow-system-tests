#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

GCB_DIR=$(cd "${DIR}/../system_tests/" && pwd);
cd "${GCB_DIR}" || exit 1

FILE_PATH=$1
BUILD_ID=${2:-"manual"}
TAG_TRIGGER_TYPE="trigger-${BUILD_ID}"

if test -z "$FILE_PATH"
then
      echo "First argument is empty"
      echo "Quiting"
      exit 1
fi

CMD="./breeze tests --verbose --backend=postgres ${FILE_PATH} -- -s --system=google"
FILE="${FILE_PATH##*/}"
FILE_WITHOUT_PY="${FILE%.py}"

echo
echo "Run single system test:"
echo "  test:"
echo "    ${FILE_PATH}"
echo "  cmd:"
echo "    ${CMD}"
echo "  tags:"
echo "    ${TAG_TRIGGER_TYPE}"
echo "    ${FILE_WITHOUT_PY}"
echo

gcloud builds submit . \
    --timeout=3600 \
    --substitutions _CMD="${CMD}",_TAG_TRIGGER_TYPE="${TAG_TRIGGER_TYPE}",_TAG_TEST_NAME="${FILE_WITHOUT_PY}" \
    --async
