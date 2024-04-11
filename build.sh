#!/bin/bash

set -e # Stop on error

# Build the WASM module
echo "Building WASM module..."
cargo build --target wasm32-unknown-unknown --release

# Strip the WASM file to reduce its size
echo "Stripping WASM file..."
wasm-strip target/wasm32-unknown-unknown/release/world_computer.wasm

# # Optimize the WASM file with wasm-opt
echo "Optimizing WASM file..."
wasm-opt -o target/wasm32-unknown-unknown/release/world_computer.wasm -Oz target/wasm32-unknown-unknown/release/world_computer.wasm

# Output the file size

ls -lh target/wasm32-unknown-unknown/release/world_computer.wasm | awk '{print "\033[0;95mwasm size: " $5 "\033[0m"}'
ls -lh docs/index.html | awk '{print "\033[0;91mindex.html size: " $5 "\033[0m"}'
