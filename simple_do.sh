#!/usr/bin/env sh
cc=$(which clang-3.6||which gcc-4.9||which clang||which gcc)
case $(uname) in
Linux)
    so=$(printf so) 
    ;;
Darwin)
    so=$(printf dylib) 
    ;;
MINGW*)
    so=$(printf lib) 
    ;;
*)
    so=$(printf so) 
    ;;
esac
gcc -c keccak-tiny.c
ar rvs -o libkeccak-tiny.$so