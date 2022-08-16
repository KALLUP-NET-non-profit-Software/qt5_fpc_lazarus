# ----------------------------------------------------------------
# This file is part of RTL.
#
# (c) Copyright 2022 Jens Kallup - paule32
# only for non-profit usage !!!
# ----------------------------------------------------------------
.all:                    build
.PHONY: clean boot check build

# --------------------------------------------------
# this section is user/developer speciefic.
# you have to set on your own ...
# --------------------------------------------------
FPC_DIR   = C:/Lazarus/fpc/3.2.2/bin/x86_64-win64
DEV_PWD   = E:/Projekte/extern

GCC       = gcc              # i used MinGW-64 10.0.0
GXX       = g++              # ...
FPC       = $(FPC_DIR)/fpc   # tests with 3.2.2
GDB       = gdb              # command line

DEV_TERM  = $(shell echo $$MSYSTEM)
DEV_OS    = $(shell echo $$OS)
DEV_LANG  = $(shell powershell get-uiculture | grep de | awk '{print $$2}')

DEV_CCVER = $(shell $(GCC) -dumpversion | cut -f1 -d.)
DEV_PPVER = $(shell $(GXX) -dumpversion | cut -f1 -d.)

# ---------------------------------------------------------
# determine the gcc version level. the smallest supported
# version is 7 ...
# ---------------------------------------------------------
GCC_FOUND = 0
ifeq ($(shell [[ $(DEV_CCVER) == 10 && $(DEV_PPVER) == 10 ]] && echo true),true)
GCC_FOUND = 1
GXX_FOUND = 1
endif
ifeq ($(shell [[ $(DEV_CCVER) ==  9 && $(DEV_PPVER) ==  9 ]] && echo true),true)
GCC_FOUND = 1
GXX_FOUND = 1
endif
ifeq ($(shell [[ $(DEV_CCVER) ==  8 && $(DEV_PPVER) ==  8 ]] && echo true),true)
GCC_FOUND = 1
GXX_FOUND = 1
endif
ifeq ($(shell [[ $(DEV_CCVER) ==  7 && $(DEV_PPVER) ==  7 ]] && echo true),true)
GCC_FOUND = 1
GXX_FOUND = 1
endif

# ---------------------------------------------------------
# the command's below should be come with the MinGW Utils.
# ---------------------------------------------------------
RM        = rm -rf
MKDIR     = mkdir -p
COPY      = cp
ECHO      = echo
SED       = sed
STRIP     = strip

# ----------------------------------------
# gnu c/c++ speciefied compiler flags.
# default: win64
# ----------------------------------------
CFLAGS    = -m64 -I. -O2 -DWINDOWS
FPC_FLAGS = -l- -Ur -WN -O2
GDB_FLAGS = -ggdb

# -----------------------
# temporary settings ...
# -----------------------
ASM_DIR  = $(DEV_PWD)/.asm
OBJ_DIR  = $(DEV_PWD)/.obj

# ---------------------------
# the source directories ...
# ---------------------------
SRC_DIR  = $(DEV_PWD)/src
ASM_SRC  = $(SRC_DIR)_asm
PAS_SRC  = $(SRC_DIR)_pas
CPP_SRC  = $(SRC_DIR)_cpp
# ---- #
PAS_OUT  = $(OBJ_DIR)/src_pas
CPP_OUT  = $(OBJ_DIR)/src_cpp

INCLUDE  = $(CPP_SRC)/inc

CFLAGS    += \
	-I$(INCLUDE)
FPC_FLAGS +=

# -------------------------------------
# the entiere source files ...
# -------------------------------------
CPP_SRC_FILES = \
	$(CPP_SRC)/qt5/qt5.QObject.cc
#
PAS_SRC_FILES = \
	$(PAS_SRC)/qt5/qt5.QObject.pas

# -------------------------------------
# the corresponding .o bject files ...
# -------------------------------------
CPP_OBJ_FILES = \
	$(CPP_OUT)/qt5/qt5.QObject.o
#
PAS_OBJ_FILES = \
    $(PAS_OUT)/qt5/qt5.QObject.o

SRC_FILES = $(CPP_SRC_FILES) $(PAS_SRC_FILES)
OBJ_FILES = $(CPP_OBJ_FILES) $(PAS_OBJ_FILES)

# ------------------------------------------
# now, hand sorted .dll .o bject files ...
# ------------------------------------------
QT5_DLLOF = \
	$(CPP_OUT)/qt5/qt5.QObject.o

# ---------------------------------------------------------------------
# i hard hand-code the .def file, because the automatic
# procedure get many extra informations, that are not needed;
# so the size of the .dll file is smaller.
# ----------------------------------------------------------------------
define qt5dll_def =
	@$(ECHO) EXPORTS                        > $(1)
endef

# --------------------------------------------------------
# that you can use the compiled fpc / c / c++ unit codes,
# we have to create an .a rchive file, which contains the
# "import" symbols to call the functions in the .dll file
# --------------------------------------------------------
define dll_a =
	@dlltool \
		--def        $(subst /,\\\,$(2))                    \
		--dllname    $(subst /,\\\,$(subst .def,.dll,$(2))) \
		--output-lib $(subst /,\\\,$(1)) > /dev/null 2>&1
	@$(STRIP)        $(subst /,\\\,$(subst .def,.dll,$(2)))
endef

# ------------------------------------------------------
# i had think, to reduce the size of this Makefile, and
# to have a better maintain, i create this macro that
# assemble the given .dll in parameter 1 with the given
# .o bject's in parameter 2.
# ------------------------------------------------------
define make_dll    =
	@$(ECHO) $(MAKE_CREATE1) DLL $(subst /,\,$(1)) ...
	@$(GXX) $(CFLAGS) -shared -fPIC -o $(1) $(2)
endef

define pas_compile =
	@$(FPC) $(FPC_FLAGS) -o$(1) $(2)
endef

define cc_compile  =
 	@$(GXX) $(CFLAGS) -shared -fPIC -o $(1) -c $(2)
endef

# ------------------------------------------------------
# this section is Windows 10 Pro 64-Bit specialized ...
# $(OBJ_FILES) $(DLL_FILE).def
# ------------------------------------------------------
REDI_NULL = > nul:
DLL_DIR   = $(DEV_PWD)/dll_x64

DLL_FILES = \
	$(DLL_DIR)/qt5_fpc.dll

DEF_FILES = \
	$(DLL_DIR)/qt5_fpc.def

ALD_FILES = \
	$(DLL_DIR)/libqt5_fpc.a

# ---------------------------------------------
# template: create .dll from .o bject files.
# $(OBJ_FILES)
# ---------------------------------------------
$(DLL_FILES):
$(DLL_DIR)/qt5_fpc.dll: $(QT5_DLLOF) ; $(call make_dll,$@,$^)

# ---------------------------------------------
# template: create .def inition file for linker
# ---------------------------------------------
$(DEF_FILES):
$(DLL_DIR)/qt5_fpc.def: $(DLL_DIR)/qt5_fpc.dll ; $(call qt5dll_def,$@)

# ---------------------------------------------
# template: create .a rchive file for linker.
# ---------------------------------------------
$(ALD_FILES):
$(DLL_DIR)/libqt5_fpc.a: $(DLL_DIR)/qt5_fpc.def ; $(call dll_a,$@,$<)

# ---------------------------------------------
# template: compile .pas to .o object file.
# ---------------------------------------------
$(PAS_OUT)/qt5/%.o: $(PAS_SRC)/qt5/%.pas ; $(call pas_compile,$@,$<)

# ---------------------------------------------
# template: compile .cc to .o object file.
# ---------------------------------------------
$(CPP_OUT)/qt5/%.o: $(CPP_SRC)/qt5/%.cc ; $(call cc_compile,$@,$<)

# ---------------------------------------------
# Makefile: default entry point ...
# ---------------------------------------------
compile: compile_notice                     \
	$(SRC_FILES) $(OBJ_FILES)               \
	$(DLL_FILES) $(DEF_FILES) $(ALD_FILES)
compile_notice:
	@$(call Write,$(MAKE_COMNOTE))

build: check clean boot compile
	@$(RM) tmp.0
	@$(call Write,$(MAKE_DONE))

# ---------------------------------------------
# check, if we on Windows with MinGW-64 ...
# ---------------------------------------------
check:
	@$(call Write,$(MAKE_WELCOME))
	@$(call Write,$(MAKE_CHKSYS)"\\\n")
ifndef DEV_TERM
	@$(call WriteError,"$(MAKE_WRONGP)$(MAKE_NL)$(MAKE_ABORT))
else
    ifeq ("$(findstring Windows,$(DEV_OS))","Windows")
        ifeq ("$(DEV_TERM)","MINGW632")
			$(call WriteError,"32 bit version" $(MAKE_NOSUPP))
        endif
        ifeq ("$(DEV_TERM)","MINGW64")
			@$(call WriteSuccess,\
			@$(call Write,$(call moveback,$(MAKE_SUCCOK))))
        else
			@$(call WriteError,$(MAKE_NOSFRM))
        endif
        ifeq ($(GCC_FOUND),0)
			@$(call WriteError,$(MAKE_NOCC))
        endif
        ifeq ($(GXX_FOUND),0)
			@$(call WriteError,$(MAKE_NOPP))
        endif
    endif
endif

# --------------------------------------------------
# this section, create/remove temporary folder's ...
# --------------------------------------------------
DIR_FOLDERS = \
    $(OBJ_DIR)/$(CPP_SRC) \
    $(OBJ_DIR)/$(PAS_SRC) \
    $(OBJ_DIR)

PRE_FOLDERS = fpc qt5

# -------------------------------------------
# this target, create all temporary files ...
# -------------------------------------------
boot:
	@$(call Write,$(MAKE_CREATE))
	@$(foreach folder,$(PRE_FOLDERS),$(MKDIR) $(CPP_OUT)/$(folder) && ) true
	@$(foreach folder,$(PRE_FOLDERS),$(MKDIR) $(PAS_OUT)/$(folder) && ) true
	@$(MKDIR) $(OBJ_DIR)/ppunits
	@$(MKDIR) $(DLL_DIR)

# -------------------------------------------
# this target, remove all temporary files ...
# -------------------------------------------
clean:
	@$(call Write,$(MAKE_REMOVE))
	@$(foreach folder,$(PRE_FOLDERS),$(RM) $(CPP_OUT)/$(folder) && ) true
	@$(foreach folder,$(PRE_FOLDERS),$(RM) $(PAS_OUT)/$(folder) && ) true
	@$(RM) $(OBJ_DIR)/ppunits
	@$(RM) $(DLL_DIR)

# --------------------------------------------------
# this section describe the locales strings for the
# Makefile session. Currently support is for:
# ENGLISH, and GERMAN
# --------------------------------------------------
ifeq ("$(DEV_LANG)","en-US")
MAKE_LANG    = "Entlish"
MAKE_ERROR   = "Error"
MAKE_SUCCESS = "Success"
MAKE_HASERR  = "build contain error(s) !"
MAKE_ABORT   = "build process aborted."
MAKE_WRONGP  = "DEVTERM missing or has wrong parameter."
MAKE_WELCOME = "Welcome"
MAKE_CHKSYS  = "check the system for needed settings, and tools ..."
MAKE_COMNOTE = "compile source code's:"
MAKE_TMPDIRS = "temp object folders"
MAKE_CREATE1 = "create"
MAKE_CREATE  = "$(MAKE_CREATE1) $(MAKE_TMPDIRS) ..."
MAKE_REMOVE  = "delete $(MAKE_TMPDIRS) crap ..."
MAKE_DEVENV  = "development environment"
MAKE_NOSFRM  = "$(NOAUPP) $(MAKE_DEVENV) $(MAKE_FOUND)."
MAKE_HAVDEV  = "$(MAKE_DEVENV) $(MAKE_FOUND)"
MAKE_NOCCOMP = "Compiler not $(MAKE_FOUND)"
MAKE_NOPPDEV = "C++ $(MAKE_NOCCOMP)."
MAKE_NOCCDEV = "C $(MAKE_NOCCOMP)."
MAKE_NOSUPP  = "not supported"
MAKE_FOUND   = "found"
MAKE_AND     = "and"
MAKE_DONE    = "done."
# ---------------------------
# mapped big   gernan umlauts
# ---------------------------
CHAR_BIGAE   = "AE"
CHAR_BIGOE   = "OE"
CHAR_BIGUE   = "UE"
CHAR_BIGSZ   = "SZ"
# ---------------------------
# mapped small gernan umlauts
# ---------------------------
CHAR_MINAE   = "ae"
CHAR_MINOE   = "oe"
CHAR_MINUE   = "ue"
CHAR_MINSZ   = "sz"
endif
ifeq ("$(DEV_LANG)","de-DE")
MAKE_LANG    = "Deutsch"
MAKE_ERROR   = "Fehler"
MAKE_SUCCESS = "Erfolgreich"
MAKE_HASERR  = "Erstellung enthält Fehler !"
MAKE_ABORT   = "Erstell-Prozess wurde unterbrochen."
MAKE_WRONGP  = "DEVTERM fehlt oder hat falsche Parameter."
MAKE_WELCOME = "Willkommen"
MAKE_CHKSYS  = "System-Überprüfung auf benötigte Einstellungen und Tools ..."
MAKE_COMNOTE = "Quelldateien übersetzen:"
MAKE_OBJDIRS = "temporäre Object-Datei-Verzeichnisse ..."
MAKE_CREATE1 = "erstelle"
MAKE_CREATE  = $(MAKE_CREATE1) $(MAKE_OBJDIRS)
MAKE_REMOVE  = "Lösche" $(MAKE_OBJDIRS)
MAKE_DEVENV  = "Entwicklungs-Umgebung"
MAKE_NOSFRM  = "keine unterstütze" $(MAKE_DEVENV) $(MAKE_FOUND)"."
MAKE_HAVDEV  = $(MAKE_DEVENV) $(MAKE_FOUND)
MAKE_NOCCOMP = "Compiler $(MAKE_FOUND)."
MAKE_NOPPDEV = "kein C++ $(MAKE_NOCCOMP)"
MAKE_NOCCDEV = "kein C $(MAKE_NOCCOMP)"
MAKE_NOSUPP  = "wird nicht unterstützt"
MAKE_FOUND   = "gefunden"
MAKE_AND     = "und"
MAKE_DONE    = "fertig."

# ----------------------------
# string place holders ...
# ----------------------------
MAKE_SUCCOK  = $(color_info)$(MAKE_OKAY) $(MAKE_HAVDEV)":"  \
               $(color_white)"$(DEV_OS)"$(MAKE_COMMA)       \
               "$(DEV_TERM)"$(MAKE_COMMA) $(MAKE_AND)       \
               $(MAKE_LANG) $(color_normal)
MAKE_NOCC    = $(call moveback,$(MAKE_NOCCDEV))
MAKE_NOPP    = $(call moveback,$(MAKE_NOPPDEV))

# ----------------------------
# unicode big   gernan umlauts
# ----------------------------
CHAR_BIGAE  = "\\\u00c4"
CHAR_BIGOE  = "\\\u00d6"
CHAR_BIGUE  = "\\\u00dc"
CHAR_BIGSZ  = "\\\u00df"
# ----------------------------
# unicode small gernan umlauts
# ----------------------------
CHAR_MINAE  = "\\\u00e4"
CHAR_MINOE  = "\\\u00f6"
CHAR_MINUE  = "\\\u00fc"
CHAR_MINSZ  = "\\\u00df"
endif
MAKE_NL     = "\\\n"
MAKE_COMMA  = ","
MAKE_OKAY   = "ok"$(MAKE_COMMA)

# --------------------------------------------------
# this section describe the terminal colors that you
# can use, if you have ANSI supported console ...
# --------------------------------------------------
color_normal = "\\033[0;37;40m"
color_error  = "\\033[1;37;44m"
color_info   = "\\033[1;93;40m"
color_white  = "\\033[1;37;40m"

# --------------------------------------------------
# this section provide internal use tool functions:
# --------------------------------------------------

# --------------------------------------------------
# convert german umlauts from ANSI to UNICODE, and
# write the string $(1) on terminal device ...
# --------------------------------------------------
define Write
    echo -e \
    $(subst ü,$(CHAR_MINUE),\
    $(subst ö,$(CHAR_MINOE),\
    $(subst ä,$(CHAR_MINAE),\
    $(subst Ü,$(CHAR_BIGUE),\
    $(subst Ö,$(CHAR_BIGOE),\
    $(subst Ä,$(CHAR_BIGAE),\
    $(subst ß,$(CHAR_MINSZ),\
    $(1))))))))
endef

# --------------------------------------------------
# moveback erase the current line, and move cursor
# to the start column of the terninal device ...
# --------------------------------------------------
define moveback
    "\\\033[2K\\\r"$(1)
endef

# --------------------------------------------------
# WriteError is used to print out error message on
# the current terminal device ...
# --------------------------------------------------
define WriteSuccess
    $(call Write,$(call moveback,$(color_error)$(MAKE_SUCCESS)":"\
    $(color_normal)$(MAKE_NL)$(color_info)$(1)$(color_normal)))
    true
endef

# --------------------------------------------------
# WriteError is used to print out error message on
# the current terminal device ...
# --------------------------------------------------
define WriteError
    $(call Write,$(call moveback,$(color_error)$(MAKE_ERROR)":"\
    $(color_normal)$(MAKE_NL)$(color_info)$(1)$(color_normal)))
    false
endef
