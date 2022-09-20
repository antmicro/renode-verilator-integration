Verilated Ibex model
====================

This directory contains files necessary for integrating a verilated model of the Ibex core with Renode.
It is intended to be used with the `Renode simulation framework <https://renode.io>`_. 

Build instructions
------------------

Ibex core is included as a submodule and ``fusesoc`` is used to generate build files.
These are passed to a ``cmake`` script responsible for collecting Renode dependencies and invoking ``verilator``. 

General steps to build the Ibex model are common for all host platforms:

1. Initialize the Ibex submodule
2. Install dependencies
3. Create ``build`` directory
4. Generate verilator args file with ``fusesoc``
5. Invoke the cmake script

``Verilator`` and ``cmake`` are required to be installed in the system.
Depending on the platform, the precise steps may differ.
``MSYS2`` environment is needed on Windows.
In case of ambiguity, please refer to the `scripts directory <https://github.com/antmicro/renode-verilator-integration/tree/master/.github/scripts>`_.

Building on Linux
-----------------

Simulation files depend on the `Verilator Integration Library <https://github.com/renode/renode/tree/master/src/Plugins/VerilatorPlugin/VerilatorIntegrationLibrary>`_ that is part of the Renode repository. 

As the first step ``$RENODE_DIR`` variable should be set to the path of Renode sources directory, for example::

    export RENODE_DIR=~/renode

To build the model, run the following commands from the current directory::

    git submodule update --init
    sudo apt update && sudo apt install git build-essential python3-pip wget cmake autoconf ccache flex bison perl xz-utils libfl2 libfl-dev zlib1g zlib1g-dev
    pip3 install --upgrade pyyaml mako junit-xml git+https://github.com/lowRISC/edalize.git@ot git+https://github.com/lowRISC/fusesoc.git@ot

    mkdir build && cd build
    fusesoc --cores-root=../ibex run --target=default --tool verilator --setup lowrisc:ibex:ibex_top
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DUSER_RENODE_DIR=$RENODE_DIR -DTOP_MODULE=ibex_top ..
    cmake --build . --config Release

After the build is finished, the model can be found in the ``build`` directory as ``libVtop.so`` shared library and ``Vtop`` application. 
For performance reasons it is recommended to use ``libVtop.so`` to test integration with verilated CPU in Renode.

Building on Windows and MacOS
-----------------------------
Instructions for building on Windows and MacOS are similar to the ones for Linux, but the initial setup differs. 
On Windows all commands must be executed inside ``MINGW64`` environment installed through `MSYS2 <https://www.msys2.org/>`_.

Please refer to the `CI script <https://github.com/antmicro/renode-verilator-integration/blob/master/.github/workflows/build.yml>`_ for detailed instructions.
