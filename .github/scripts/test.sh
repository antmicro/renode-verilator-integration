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
        cygpath -m $path
    else
        realpath $path
    fi
}

for file in $SAMPLES_PATH/libV*
do
    path=$(path_name_portable ${file})
    VARIABLES+=" --variable $(file_name_to_peripheral ${file^^})_NATIVE_${RUNNER_OS^^}:@${path}"
done

for file in $SAMPLES_PATH/V*
do
    path=$(path_name_portable ${file})
    VARIABLES+=" --variable $(file_name_to_peripheral ${file^^})_SOCKET_${RUNNER_OS^^}:@${path}"
done

if [ "$RUNNER_OS" = "Windows" ]; then
    py -3 -m pip install -r $RENODE_PATH/tests/requirements.txt
    chmod u+x $RENODE_PATH/renode-test
    $RENODE_PATH/renode-test --show-log --runner dotnet ${VARIABLES} ${RENODE_TESTS_DIR}/*.robot
else
    sudo apt-get update
    sudo apt-get install -y policykit-1 libgtk2.0-0 screen uml-utilities gtk-sharp2 libc6-dev gcc python3 python3-pip mono-complete
    pip install -r $RENODE_PATH/tests/requirements.txt
    chmod u+x $RENODE_PATH/renode-test
    $RENODE_PATH/renode-test -j16 ${VARIABLES} ${RENODE_TESTS_DIR}/*.robot
fi
