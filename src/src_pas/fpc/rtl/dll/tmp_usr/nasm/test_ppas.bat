@echo off
SET THEFILE=sysinitpas
echo Assembling %THEFILE%
tasm.exe /m2 /ml  .\tmp_usr\nasm\sysinitpas.s .\tmp_usr\nasm\sysinitpas.o
if errorlevel 1 goto asmend
SET THEFILE=test
echo Assembling %THEFILE%
tasm.exe /m2 /ml  .\tmp_usr\nasm\test.s .\tmp_usr\nasm\test.o
if errorlevel 1 goto asmend
SET THEFILE=.\tmp_usr\nasm\test.exe
echo Linking %THEFILE%
ld.exe -b pei-i386 -m i386pe    -s  --entry=_mainCRTStartup    -o .\tmp_usr\nasm\test.exe .\tmp_usr\nasm\test_link.res
if errorlevel 1 goto linkend
postw32.exe --subsystem console --input .\tmp_usr\nasm\test.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
