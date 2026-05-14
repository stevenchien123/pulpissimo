#!/bin/bash

echo "========================================"
echo "啟動互動式 Menu 並自動輸入設定..."
echo "========================================"
# 使用 Here-Doc 將按鍵指令自動傳給 menu
menu << EOF
i
n
o
p
r
z
q
EOF

echo "========================================"
echo "設定 PULPissimo 環境變數..."
echo "========================================"
export PULP_RISCV_GCC_TOOLCHAIN=/opt/pulp-gcc-2.5.0/
export PATH=$PULP_RISCV_GCC_TOOLCHAIN/bin:$PATH

echo "========================================"
echo "更新 Git Submodule..."
echo "========================================"
git submodule update --init --recursive

echo "========================================"
echo "設定 PULP Runtime (Ibex 核心)..."
echo "========================================"
cd sw/pulp-runtime
source configs/pulpissimo_ibex.sh
cd ../..

echo "========================================"
echo "執行硬體編譯 (make checkout & make build)..."
echo "========================================"
make checkout
make build

echo "========================================"
echo "設定 VSIM 環境變數..."
echo "========================================"
export VSIM_PATH=/home/ChienShaoHsuan/pulpissimo_test/build/questasim
export VSIM="vsim"

echo "========================================"
echo "環境設定與編譯完成！您現在可以開始模擬了。"
echo "========================================"