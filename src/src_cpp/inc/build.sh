#!/bin/bash

g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o dll_main.o   -c dll_main.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o TClass.o     -c TClass.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o TException.o -c TException.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o TObject.o    -c TObject.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o IUnknown.o   -c IUnknown.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o ISomething.o -c ISomething.cc
g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o modtest.o    -c modtest.cc

g++ -Wfatal-errors -m64 -std=c++2a -O2 -I. -shared -fPIC -o test1.dll \
    TClass.o     \
    TException.o \
    TObject.o    \
    IUnknown.o   \
    ISomething.o \
    dll_main.o   modtest.o
