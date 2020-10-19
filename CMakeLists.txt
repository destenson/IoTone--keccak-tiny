cmake_minimum_required(VERSION 3.16)
project(keccak_tiny C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(keccak_tiny
        define-macros.h
#        keccak-tiny-unrolled.c
        keccak-tiny.c
        keccak-tiny.h
        main.cpp
    )
