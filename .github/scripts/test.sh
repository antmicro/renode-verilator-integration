#!/bin/bash

SAMPLES_PATH=$PWD/artifacts/samples
RENODE_PATH=$PWD/renode
RENODE_TESTS_DIR=$RENODE_PATH/tests/platforms/verilated

VARIABLES=""
echo -n > tests.yaml

function file_name_to_peripheral {
    echo "$(basename $1)" | sed 's/^V//;s/^LIBV//;s/-.*//'
}

function path_name_portable {
    path=$1
    if [ "$RUNNER_OS" = "Windows" ]; then
        # Renode expetects 'Windowsy' path - C:/ble/ble/ble
        cygpath -m ${path}
    else
        echo ${path}
    fi
}

function uppercase {
    echo "$1" |  tr '[:lower:]' '[:upper:]'
}

function variable_name {
    file=$1
    type=$2
    echo "$(file_name_to_peripheral $(uppercase ${file}))_${type}_$(uppercase ${RUNNER_OS})"
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
    sudo apt-get install -y policykit-1 libgtk2.0-0 screen uml-utilities gtk-sharp2 libc6-dev gcc python3 python3-pip mono-complete
fi

if [ "$RUNNER_OS" = "Windows" ]; then
    py -3 -m pip install -r $RENODE_PATH/tests/requirements.txt
    chmod u+x $RENODE_PATH/renode-test
    $RENODE_PATH/renode-test --runner dotnet ${VARIABLES} ${RENODE_TESTS_DIR}/*.robot
else
    python3 -m pip install -r $RENODE_PATH/tests/requirements.txt
    chmod u+x $RENODE_PATH/renode-test
    $RENODE_PATH/renode-test -j16 ${VARIABLES} ${RENODE_TESTS_DIR}/*.robot
fi
