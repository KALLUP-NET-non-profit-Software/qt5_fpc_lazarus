@echo off
SET THEFILE=system
echo Assembling %THEFILE%
tasm.exe /m2 /ml  .\tmp_usr\tasm\system.s .\tmp_usr\tasm\system.o
if errorlevel 1 goto asmend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
