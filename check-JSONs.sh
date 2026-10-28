#!/bin/sh

# (try and) have script exit after first failure is detected:
set -e

cd delta
./check-delta-JSON-Schema.js
cd ..

cd metametamodel
./check-serialization.js lioncore.json 2026.1
./check-serialization.js builtins.json 2026.1
cd ..

