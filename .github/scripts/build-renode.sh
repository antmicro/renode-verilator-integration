# source this file
if [ -z "$RUNNER_OS" ]; then
    echo "RUNNER_OS required environment variable not set!"
    exit -1
fi

git clone --single-branch --recurse-submodules -b "${RENODE_GITREV:-master}" https://github.com/renode/renode.git

if [ "$RUNNER_OS" = "Linux" ]; then
    sudo apt-get update
    sudo apt-get install -y policykit-1 libgtk2.0-0 screen uml-utilities gtk-sharp2 libc6-dev gcc mono-complete
fi

pushd renode
if [ "$RUNNER_OS" = "Windows" ]; then
    ./build.sh --net
else
    ./build.sh
fi
popd
