#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function bash_escape {
    # Escape characters
    printf "%q" "${@}"
}

function usage {
    echo "Run series of system tests."
    echo ""
    echo "Usage: bash \$(./$(basename $0) [FILE])"
    echo ""
    echo "FILE - A file that contains a list of tests paths."
    exit 1
}

if [[ -z $1  ]]; then
    echo "You must provide a file."
    echo ""
    usage
fi

LIST_FILE=$1

if [[ ! -f "${LIST_FILE}" ]]; then
    echo "File does not exist."
    exit 1
fi

echo "Running series of tests:"
echo "$(cat $LIST_FILE)"
echo

while read line; do
    if grep "#" <<< "${line}" > /dev/null ; then
        continue
    fi

    if [[ -z "${line}" ]] ; then
        continue
    fi

    . $DIR/run_single_system_test.sh $line $BUILD_ID


done < ${LIST_FILE}

echo
echo "List runs with command"
echo "gcloud builds list --filter \"tags='trigger-${BUILD_ID}'\""
