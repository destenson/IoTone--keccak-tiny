#!/usr/bin/env sh
cc=$(which clang-3.6||which gcc-4.9||which clang||which gcc)
so=$(test -f /etc/asl.conf && printf dylib|| printf so)
ccargs='-march=native -Wextra -Wpedantic -Wall -dynamic -shared -fPIC -funroll-loops -funroll-all-loops'
$cc "-Dinline=__attribute__((__always_inline__))" -O3 $ccargs keccak-tiny.c -o libkeccak-tiny.$so
$cc -Os $ccargs keccak-tiny.c -o libkeccak-tiny-small.$so
