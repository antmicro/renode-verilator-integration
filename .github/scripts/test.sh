#!/bin/bash

shopt -s failglob

SAMPLES_PATH=$PWD/artifacts/samples
RENODE_TESTS_DIR=$RENODE_ROOT/tests/platforms/verilated

VARIABLES=""

if [ "$RUNNER_OS" = "Windows" ]; then
    # Ensure RENODE_TESTS_DIR is a Unix-style path so we can glob on it in the renode-test invocation
    RENODE_TESTS_DIR="$(cygpath "$RENODE_TESTS_DIR")"
fi

function file_name_to_peripheral {
    basename "$1" | sed 's/^V//;s/^LIBV//;s/-.*//'
}

function path_name_portable {
    if [ "$RUNNER_OS" = "Windows" ]; then
        # Renode expects a Windows-style path, like C:/path/file.resc
        cygpath -m "$1"
    else
        echo "$1"
    fi
}

function uppercase {
    echo "$1" |  tr '[:lower:]' '[:upper:]'
}

function variable_name {
    file=$1
    type=$2
    echo "$(file_name_to_peripheral "$(uppercase ${file})")_${type}_$(uppercase ${RUNNER_OS})"
}

for file in $SAMPLES_PATH/libV*
do
    path=$(path_name_portable ${file})
    VARIABLES+=" --variable $(variable_name ${file} "NATIVE"):@${path}"
done

for file in $SAMPLES_PATH/V*
do
    path=$(path_name_portable ${file})
    VARIABLES+=" --variable $(variable_name ${file} "SOCKET"):@${path}"
done

renode-test ${VARIABLES} --results-dir results ${RENODE_TESTS_DIR}/*.robot
