#!/usr/bin/env sh

name='keccak-tiny'

cc=$(which clang-3.6||which gcc-4.9||which clang||which gcc)
case $(uname) in
Linux)
    # ARFLAGS='rvs -o'
    # CFLAGS='-O3'
    CFLAGS='-Os -std=c11 -Wextra -Wpedantic -Wall -funroll-loops -fPIC -dynamic -shared'
    so=$(printf so)
    $cc $name.c $CFLAGS -o lib$name.$so
    ;;
Darwin)
    so=$(printf dylib)
    ARFLAGS=rcs
    ;;
MINGW*)
    so=$(printf lib)
    ARFLAGS='rcs -o'
    ;;
*)
    so=$(printf so)
    ARFLAGS='rvs -o'
    ;;
esac
# TODO: Fix the compiler to work with any of the above compilers $cc

case $(uname) in
Linux)
    # nothing needs to be done
    ;;
*)
    $cc -c $name.c -o lib$name.$so
    ar $ARFLAGS libkeccak-tiny.$so keccak-tiny.o
    ;;
esac
