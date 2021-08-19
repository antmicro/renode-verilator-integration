##### This CFU sample is based on CFU verilog generated in CFU-Playground. To generate it follow instructions below:

1. Get `CFU-Playground` repository:
```bash
git clone --recurse-submodules https://github.com/google/CFU-Playground.git
```

2. Get RISC-V toolchain: https://cfu-playground.readthedocs.io/en/latest/setup-guide.html#step-3-install-riscv-toolchain

3. Setup repository:
```bash
pushd CFU-Playground
./scripts/setup
popd
```
4. Build `mnv2` software:
```bash
pushd CFU-Playground/proj/mnv2_first
make software SW_ONLY=1
popd
```

5. Copy generated CFU to `cfu_mnv2`:
```bash
cp CFU-Playground/proj/mnv2_first/cfu.v .
```
