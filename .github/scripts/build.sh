# Source this file

if [ -z "$RUNNER_OS" -o -z "$MAKE_BIN" -o -z "$BUILD_ARCH" ]; then
    echo "Not all required environment variables set (RUNNER_OS, MAKE_BIN, BUILD_ARCH)!"
    exit -1
fi

if [ "$RUNNER_OS" = "Windows" ]; then
    BIN_SUFFIX=".exe"
    LIB_SUFFIX=".dll"
    MAKE_TYPE="MinGW"

    # install dependencies for cpu_ibex sample
    pacman --noconfirm -S --needed wget python-pip perl xz zlib
    pip install --upgrade pyyaml mako junit-xml git+https://github.com/lowRISC/edalize.git@ot git+https://github.com/lowRISC/fusesoc.git@ot

elif [ "$RUNNER_OS" = "Linux" ]; then
    LIB_SUFFIX=".so"
    EXTRA_CMAKE_VARS="-DLIBOPENLIBM=$GITHUB_WORKSPACE/lib/libopenlibm-Linux-x86_64.a"

    # install dependencies for cpu_ibex sample
    sudo apt install git build-essential python3-pip wget cmake autoconf ccache flex bison perl xz-utils libfl2 libfl-dev zlib1g zlib1g-dev
    sudo pip3 install --upgrade pyyaml mako junit-xml git+https://github.com/lowRISC/edalize.git@ot git+https://github.com/lowRISC/fusesoc.git@ot
    wget http://es.archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi7_3.3-4_amd64.deb
    sudo dpkg -i libffi7_3.3-4_amd64.deb
    
elif [ "$RUNNER_OS" = "macOS" ]; then
    LIB_SUFFIX=".dylib"

    # install dependencies for cpu_ibex sample
    pip3 install --upgrade pyyaml mako junit-xml git+https://github.com/lowRISC/edalize.git@ot git+https://github.com/lowRISC/fusesoc.git@ot

    # include Python Framework bin folder where fusesoc is installed
    export PATH="$PATH":$(python3 -c 'import os, inspect; print(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(inspect.getfile(os)))), "bin"))')
fi

SAMPLES_DIR="$PWD/artifacts/samples"
mkdir -p $SAMPLES_DIR

RENODE_DIR="$PWD/renode"

# Usage: build SOURCE_DIR [OUT_NAME]
function build {
    pushd $1
    mkdir build
    cd build

    if [ "$SAMPLE" == "cpu_ibex" ]; then
        # Generate verilator args file.
        # Run `fusesoc` directly in shell. 
        # Using `execute_process` command in CMakeLists.txt is problematic on MSYS2 as no intermediate shell can be used. 
        # See: https://cmake.org/cmake/help/latest/command/execute_process.html.
        TOP_MODULE="ibex_top"
        fusesoc --cores-root=../ibex run --target=default --tool verilator --setup lowrisc:ibex:$TOP_MODULE
    fi

    cmake -G "${MAKE_TYPE:-Unix} Makefiles" -DCMAKE_BUILD_TYPE=Release -DUSER_RENODE_DIR=$RENODE_DIR $EXTRA_CMAKE_VARS ..

    $MAKE_BIN Vtop libVtop VERBOSE=1
    cp "Vtop$BIN_SUFFIX" "$SAMPLES_DIR/V${2:-$1}-$RUNNER_OS-$BUILD_ARCH-$GITHUB_RUN_ID$BIN_SUFFIX"

    # Check dependencies on Linux and Windows
    if [ "$RUNNER_OS" != "macOS" ]; then
        ldd "Vtop$BIN_SUFFIX"
    fi

    cp "libVtop$LIB_SUFFIX" "$SAMPLES_DIR/libV${2:-$1}-$RUNNER_OS-$BUILD_ARCH-$GITHUB_RUN_ID$LIB_SUFFIX"
    popd
    rm -rf "$1/build"
}

# Script executables

pushd samples
for SAMPLE in *; do
    # Skip building cfu_* samples
    if [[ "$SAMPLE" =~ "cfu_" ]]; then
        continue
    fi

    build $SAMPLE
done
popd

# Test executables

# Usage: build-modified-uartlite PATCH_NAME PATCH_ROOT
function build-modified-uartlite {
    PATCH=".github/scripts/tests/$1.patch"
    patch -d $2 -p1 <$PATCH
    # PATCH_NAME is passed as OUT_NAME
    build samples/uartlite $1
    patch -R -d $2 -p1 <$PATCH
}

function build-ibex-interrupts {
    pushd samples/cpu_ibex/irq_example/
    ./build.sh
    cp main.elf main.dump $SAMPLES_DIR
    popd
}

# Connection Timeout
build-modified-uartlite uartlite_sleep_after_1000_iters $RENODE_DIR

# Full connection inability
build-modified-uartlite uartlite_wrong_ports $PWD

# Partial connection inability
build-modified-uartlite uartlite_wrong_second_port $PWD

if [ "$RUNNER_OS" == "Linux" ]; then
    # Ibex IRQ test
    build-ibex-interrupts
fi

ls -lh $SAMPLES_DIR
