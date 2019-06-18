#!/bin/bash

if [ -e apery_rust ]; then
	git clone https://github.com/HiraokaTakuya/apery_rust.git
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
fi
