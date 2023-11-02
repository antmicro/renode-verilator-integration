# Source this file

export CCACHE_DIR="$PWD/ccache"

if [ -z "$VERILATOR_VERSION" -o -z "$RUNNER_OS" -o -z "$MAKE_BIN" ]; then
    echo "Not all required environment variables set (VERILATOR_VERSION, RUNNER_OS, MAKE_BIN)!"
    exit -1
fi

git clone -b "v$VERILATOR_VERSION" https://github.com/verilator/verilator
pushd verilator

if [ "$RUNNER_OS" = "Windows" ]; then  # MSYS2
    pacman --noconfirm -S --needed autoconf bison flex mingw-w64-x86_64-ccache

    # `CPPFLAGS=-I/usr/include` doesn't work
    cp /usr/include/FlexLexer.h include/
fi

if [ "$RUNNER_OS" = "Linux" ]; then  # Ubuntu
    sudo apt update
    sudo apt install -y ccache libfl-dev
fi

if [ "$RUNNER_OS" = "macOS" ]; then
    brew install ccache
fi

autoconf
./configure CC='ccache g++'  # `g++` is Clang on macOS
$MAKE_BIN
if [ "$RUNNER_OS" = "Linux" ]; then
    $MAKE_BIN test
fi
export VERILATOR_ROOT="$PWD"
popd

ccache -s
