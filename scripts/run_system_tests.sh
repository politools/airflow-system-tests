#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

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
echo "List runs with command:"
echo
echo "gcloud builds list --filter \"tags='trigger-${BUILD_ID}'\" --format=\"table[box,margin=3,title='system tests'](id,status,tags,logUrl)\""
echo
