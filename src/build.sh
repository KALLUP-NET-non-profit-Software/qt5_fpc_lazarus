#!/bin/bash

FPC="C:/Lazarus/fpc/3.2.2/bin/x86_64-win64"
CCF="-Wfatal-errors -m64 -std=c++2a -O2 -Isrc_cpp/inc -shared -fPIC"
PPF="-Mdelphi -MCLASS -MRESULT -MNESTEDCOMMENTS -MANSISTRINGS -MDEFAULTPARAMETERS -MALLOWINLINE -MEXCEPTIONS \
    -Rintel -Sc -Se1 -Sg -Sh -SIcom -Sx -Cr -Co -D -Twin64 \
    -l- -O2 -Ur -WN"

SRC_DIR="."
SRC_PAS="${SRC_DIR}/src_pas"
SRC_CPP="${SRC_DIR}/src_cpp"

OUT_DIR="${SRC_DIR}/.out_obj"
OUT_PAS="${OUT_DIR}/src_pas"
OUT_CPP="${OUT_DIR}/src_cpp"

# clean temp
rm -rf   ${OUT_DIR}
mkdir -p ${OUT_PAS}/fpc
mkdir -p ${OUT_PAS}/qt5
mkdir -p ${OUT_PAS}/vcl

mkdir -p ${OUT_CPP}/fpc
mkdir -p ${OUT_CPP}/qt5
mkdir -p ${OUT_CPP}/vcl
mkdir -p ${OUT_DIR}/x64_exec

# test case dll
g++ ${CCF} -o ${OUT_CPP}/modtest.o        -c pas_test/modtest.cc
g++ ${CCF} -o ${OUT_CPP}/dll_main.o       -c ${SRC_CPP}/dll_main.cc

# dll
g++ ${CCF} -o ${OUT_CPP}/vcl/TClass.o     -c ${SRC_CPP}/vcl/TClass.cc
g++ ${CCF} -o ${OUT_CPP}/vcl/TException.o -c ${SRC_CPP}/vcl/TException.cc
g++ ${CCF} -o ${OUT_CPP}/vcl/TObject.o    -c ${SRC_CPP}/vcl/TObject.cc
g++ ${CCF} -o ${OUT_CPP}/vcl/IUnknown.o   -c ${SRC_CPP}/vcl/IUnknown.cc
g++ ${CCF} -o ${OUT_CPP}/vcl/ISomething.o -c ${SRC_CPP}/vcl/ISomething.cc

g++ ${CCF} -o ${OUT_DIR}/x64_exec/qt5_fpc.dll \
    ${OUT_CPP}/vcl/TClass.o     \
    ${OUT_CPP}/vcl/TException.o \
    ${OUT_CPP}/vcl/TObject.o    \
    ${OUT_CPP}/vcl/IUnknown.o   \
    ${OUT_CPP}/vcl/ISomething.o \
    \
    ${OUT_CPP}/dll_main.o       \
    ${OUT_CPP}/modtest.o

strip ${OUT_DIR}/x64_exec/qt5_fpc.dll

# test case
${FPC}/fpc ${PPF} -Us -n  \
    -FE${OUT_PAS}/fpc ${SRC_PAS}/fpc/system.pas

${FPC}/fpc ${PPF} -Xs -n  \
    -Fu${OUT_PAS}/fpc -Fu${SRC_PAS}/fpc \
    -FE${OUT_DIR}/x64_exec pas_test/test2.pas
