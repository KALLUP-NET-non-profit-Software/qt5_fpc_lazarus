# Virtual Box von Oracle installieren
# Linux installieren
# Netzwerk einrichten
#  ggf. Test's (ping, ...)
# notepad installieren
#  ./cross-compile.env anpassen ...
#  ./Makefile          anpassen ...
#
# update machen      : # sudo apt-get update     (  3 MB)
# mc    installieren : # sudo apt install make   (  2 MB)
# make  installieren : # sudo apt install make   (  4 MB)
# gcc   installieren : # sudo apt install gcc    (270 MB)
# g++   installieren : # sudo apt install g++    (180 MB)
# bison installieren : # sudo apt install bison  (  3 MB)
# flex  installieren : # sudo apt install flex   (  2 MB)
# cmake installieren : # sudo apt install cmake  ( 28 MB)
# git   installieren : # sudo apt install git    ( 21 MB)


# ----------------------------------------------------------------
# This file is part of RTL.
#
# (c) Copyright 2022 Jens Kallup - paule32
# only for non-profit usage !!!
#
# This Makefile was hand-coded. So if you found bugs, please
# let it me know, and write a bug report to: <kallup-dev@web.de>
# This project and all it's content are tested under:
# - Microsoft Windows 10 Pro 64-Bit Edition.
# -
# I don't give any gurantees of correct, and stable using!
# YOU USE IT, AT YOUR OWN RISK !
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# OS_PLATFORM: currently only WINDOWS.
# PRJ_DRV:     project disk drive.
# ----------------------------------------------------------------
APP_TYPE    = console
FPC_VERSION = 3.2.0
OS_PLATFORM = WINDOWS
PRJ_DRV     = G

# --------------------------------------------------
# this section is user/developer speciefic.
# you have to set on your own ...
# --------------------------------------------------
CC        = gcc        # i used MinGW-64 8.6.0
FPC       = ppcrossx64 # tests with 3.2.0
GDB       = gdb        # command line
ASM       = as         # GNU assembler
DLLTOOL   = dlltool    # Windows 11 .DEF / .DLL tool
EXIT      = exit       # MS-Dos exit batch file
NM        = nm

# ---------------------------------------------------------
# the command's below should be come with the MinGW Utils.
# ---------------------------------------------------------
RM        = rm -rf
MKDIR     = mkdir
MOVE      = mv
COPY      = cp
ECHO      = echo
SED       = sed
STRIP     = strip

# ----------------------------------------
# gnu c/c++ speciefied compiler flags.
# default: win64
# ----------------------------------------
CFLAGS    = -m64 -I. -O2 -DAPP_TYPE=$(APP_TYPE) -D$(OS_PLATFORM) \
            -Wno-delete-incomplete \
            -Wno-write-strings
FPC_FLAGS = -CF32 -a -al -n -sh -st -Ur -Xd -Xe -Xm -WA -WR \
            -O2 -Mdelphi -OoPEEPHOLE -OoREMOVEEMPTYPROCS \
            -Px86_64 -Twin64
GDB_FLAG  = -ggdb

# -----------------------------------------------------
# there are 3 possible functions: info, warning, error
# currently, only WINDOWS is supported.
# -----------------------------------------------------
ifeq ($(OS_PLATFORM),)
$(error OS_PLATFORM not set!)
all:
endif
ifeq ($(OS_PLATFORM),WINDOWS)
all: compile_windows
else ifeq ($(OS_PLATFORM),LINUX)
all: compile_linux:
else
$(error no supported platform.)
all:
endif

# -----------------------
# temporary settings ...
# -----------------------
ASM_DIR  = .asm
OBJ_DIR  = .obj

# ---------------------------
# the source directories ...
# ---------------------------
SRC_DIR  = src

TETT ?= \
	zuzu \
	pupu \
	lupu
    
$(TETT):
	[ -d $0 ] || echo "hallllooo"

compile_windows: $(TETT)
	@echo "start..."
	$(shell pwd)
	@echo "done,"

# -------------------------------------------
# this target, remove all temporary files ...
# -------------------------------------------
clean:
	$(ECHO) delete source folder crap ...
	$(RM)   sample/*.exe
	$(RM)   sample/*.dll
	$(foreach folder,$(PRE_FOLDERS),$(RM) $(OBJ_DIR)/$(CPP_SRC)/$(folder) && ) true
	$(foreach folder,$(PRE_FOLDERS),$(RM) $(OBJ_DIR)/$(PAS_SRC)/$(folder) && ) true
	$(foreach folder,$(PRE_FOLDERS),$(RM) $(ASM_DIR)/$(CPP_SRC)/$(folder) && ) true
	$(foreach folder,$(PRE_FOLDERS),$(RM) $(ASM_DIR)/$(PAS_SRC)/$(folder) && ) true
	$(foreach folder,$(DIR_FOLDERS),$(RM) $(folder) && ) true
	$(RM) $(DLL_DIR)
