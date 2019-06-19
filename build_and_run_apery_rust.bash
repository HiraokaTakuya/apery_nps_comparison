#!/bin/bash

if [ -e apery_rust ]; then
    :
else
    git clone https://github.com/HiraokaTakuya/apery_rust.git
fi
cd apery_rust
git submodule init
git submodule update
cargo build --release
./target/release/apery <<- EOF
setoption name Threads value 1
isready
go byoyomi 10000
wait
EOF
