#!/bin/bash

if [ -e apery_cpp ]; then
    :
else
    git clone https://github.com/HiraokaTakuya/apery.git apery_cpp
fi
cd apery_cpp
git submodule init
git submodule update
(cd src && make nosse -j)
cd bin
../src/apery <<- EOF
setoption name Threads value 1
isready
go byoyomi 10000
wait
EOF
