#!/usr/bin/env sh
cc=$(which clang-3.6||which gcc-4.9||which clang||which gcc)
so=$(test -f /etc/asl.conf && printf dylib|| printf so)
$cc "-Dinline=__attribute__((__always_inline__))" -O3 -march=native -std=c11 -Wextra -Wpedantic -Wall -dynamic -shared keccak-tiny.c -fPIC -o libkeccak-tiny.$so -D"memset_s(W,WL,V,OL)=memset(W,V,OL)"
$cc -Os -march=native -std=c11 -Wextra -Wpedantic -Wall -dynamic -shared keccak-tiny.c -fPIC -o libkeccak-tiny-small.$so -D"memset_s(W,WL,V,OL)=memset(W,V,OL)"
