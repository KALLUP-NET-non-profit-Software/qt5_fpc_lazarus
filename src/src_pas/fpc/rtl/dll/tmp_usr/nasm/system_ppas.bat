@echo off
SET THEFILE=system
echo Assembling %THEFILE%
nasm.exe -f win32 -o .\tmp_usr\nasm\system.o -w-orphan-labels  .\tmp_usr\nasm\system.s
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
