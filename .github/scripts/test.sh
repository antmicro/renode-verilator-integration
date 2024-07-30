#!/bin/bash

shopt -s failglob

SAMPLES_PATH=$PWD/artifacts/samples
RENODE_PATH=$PWD/renode
RENODE_TESTS_DIR=$RENODE_PATH/tests/platforms/verilated

VARIABLES=""

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

if [ "$RUNNER_OS" = "Linux" ]; then
    sudo apt-get update
    sudo apt-get install -y policykit-1 libgtk2.0-0 screen uml-utilities gtk-sharp2 libc6-dev gcc mono-complete
fi

pip install -r $RENODE_PATH/tests/requirements.txt

if [ "$RUNNER_OS" = "Windows" ]; then
    # use python instead of default py -3
    sed -i 's/py -3/python/g' $RENODE_PATH/tools/common.sh
    $RENODE_PATH/renode-test --net ${VARIABLES} ${RENODE_TESTS_DIR}/*.robot
else
    $RENODE_PATH/renode-test ${VARIABLES} ${RENODE_TESTS_DIR}/*.robot
fi
