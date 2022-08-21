#!/bin/bash

g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/modtest.o        -c pas_test/modtest.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/dll_main.o       -c src_cpp/dll_main.cc

g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/vcl/TClass.o     -c src_cpp/vcl/TClass.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/vcl/TException.o -c src_cpp/vcl/TException.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/vcl/TObject.o    -c src_cpp/vcl/TObject.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/vcl/IUnknown.o   -c src_cpp/vcl/IUnknown.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC -o .obj/src_cpp/vcl/ISomething.o -c src_cpp/vcl/ISomething.cc

g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o dll_x64/qt5_fpc.dll \
    .obj/src_cpp/vcl/TClass.o     \
    .obj/src_cpp/vcl/TException.o \
    .obj/src_cpp/vcl/TObject.o    \
    .obj/src_cpp/vcl/IUnknown.o   \
    .obj/src_cpp/vcl/ISomething.o \
    \
    .obj/src_cpp/dll_main.o       \
    .obj/src_cpp/modtest.o

strip dll_x64/qt5_fpc.dll
