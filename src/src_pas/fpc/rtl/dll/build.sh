#!/bin/bash
# -------------------------------------------------------------------
# RTL.PAS - this file is part of the Objective FPC Runtime.
#
# (c) 2022 by Jens Kallup
# all rights reserved.
#
# only for education, and non-profit use !!!
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# absolute path's of used compiler programs "fpc", and "g++"
# -------------------------------------------------------------------
FPC="C:/fpc/3.2.0/bin/i386-win32"
GCC="E:/msys64/mingw64/bin/gcc.exe"
GPP="E:/msys64/mingw64/bin/g++.exe"

rm -rf tmp_dev
rm -rf tmp_usr

mkdir -p  tmp_dev/tasm
mkdir -p  tmp_dev/nasm

mkdir -p  tmp_usr/tasm
mkdir -p  tmp_usr/nasm

${FPC}/fpc -Si -CD -CX -D -O3 -n -Xd -Us \
    -Fl./tmp_dev \
    -FE./tmp_dev \
    -Fi./tmp_dev \
    -Fo./tmp_dev \
    -Fu./dev \
    -FU./tmp_dev dev/system.pas

${FPC}/fpc -Si -CD -CX -D -O3 -n -Xd \
    -Fl./tmp_dev \
    -FE./tmp_dev \
    -Fi./tmp_dev \
    -Fo./tmp_dev \
    -Fu./dev \
    -FU./tmp_dev rtl.pas
    
${FPC}/fpc -Si -CD -CX -D -O3 -n -Xd \
    -Fl./tmp_dev \
    -FE./tmp_dev \
    -Fi./tmp_dev \
    -Fo./tmp_dev \
    -Fu./dev \
    -FU./tmp_dev fpc_dll.pas

#######################################################################
#gendef fpc_dll.dll
#dlltool.exe -d fpc_dll.def -D fpc_dll.dll -l libfpc_dll.a

#${FPC}/fpc -a -Fl./ -CD -n -FUtmp fpc_rtl.pas
#gendef fpc_rtl.dll
#dlltool.exe -d fpc_rtl.def -D fpc_rtl.dll -l libfpc_rtl.a
#######################################################################
#-Si -CD -CX -D -O3 -n -Xd -Us -a
${FPC}/fpc -al -sh -st -Atasm \
    -Fl./tmp_usr \
    -FE./tmp_usr/tasm \
    -Fi./tmp_usr \
    -Fo./tmp_usr/tasm \
    -Fu./usr \
    -FU./tmp_usr/tasm usr/system.pas
###
${FPC}/fpc -al -sh -st -Anasm \
    -Fl./tmp_usr \
    -FE./tmp_usr/nasm \
    -Fi./tmp_usr \
    -Fo./tmp_usr/nasm \
    -Fu./usr \
    -FU./tmp_usr/nasm usr/system.pas


#-O3 -n -Xd -a
${FPC}/fpc -al -sh -st -Atasm \
    -Fl./tmp_usr \
    -FE./tmp_usr/tasm \
    -Fi./tmp_usr \
    -Fo./tmp_usr/tasm \
    -Fu./usr \
    -FU./tmp_usr/tasm test.pas
###
${FPC}/fpc -al -sh -st -Atasm \
    -Fl./tmp_usr \
    -FE./tmp_usr/nasm \
    -Fi./tmp_usr \
    -Fo./tmp_usr/nasm \
    -Fu./usr \
    -FU./tmp_usr/nasm test.pas
