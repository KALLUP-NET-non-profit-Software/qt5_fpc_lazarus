	.386p
	LOCALS @@

	EXTRN	fpc_initializeunits
	EXTRN	fpc_do_exit
; Begin asmlist al_begin
; End asmlist al_begin
; Begin asmlist al_stabs
; End asmlist al_stabs
; Begin asmlist al_pure_assembler
; End asmlist al_pure_assembler
; Begin asmlist al_procedures

_CODE		SEGMENT	PARA PUBLIC USE32 'CODE'
	ALIGN 16
	PUBLIC	PASCALMAIN
PASCALMAIN:
	PUBLIC	_main
_main:
; [test.pas]
; [15] begin
		push	ebp
		mov	ebp,esp
		call	fpc_initializeunits
; [16] end.
		call	fpc_do_exit
		mov	esp,ebp
		pop	ebp
		ret
; End asmlist al_procedures
; Begin asmlist al_globals
_CODE		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	INITFINAL
INITFINAL	DD	0,0
_DATA		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	FPC_THREADVARTABLES
FPC_THREADVARTABLES	DD	0
_DATA		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES	DD	0
_DATA		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES	DD	0
_DATA		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES	DD	0
_DATA		ENDS

_		SEGMENT	PARA PUBLIC USE32 ''
	ALIGN 16
__fpc_ident		DB	"FPC 3.2.0 [2020/06/04] for i386 - Win32"
_		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	__heapsize
__heapsize	DD	0
_DATA		ENDS

_DATA		SEGMENT	DWORD PUBLIC USE32 'DATA'
	ALIGN 4
	PUBLIC	__fpc_valgrind
__fpc_valgrind	DB	0
; End asmlist al_globals
; Begin asmlist al_const
; End asmlist al_const
; Begin asmlist al_typedconsts
; End asmlist al_typedconsts
; Begin asmlist al_rotypedconsts
; End asmlist al_rotypedconsts
; Begin asmlist al_threadvars
; End asmlist al_threadvars
; Begin asmlist al_imports
; End asmlist al_imports
; Begin asmlist al_exports
_DATA		ENDS

_CODE		SEGMENT	PARA PUBLIC USE32 'CODE'
; End asmlist al_exports
; Begin asmlist al_resources
; End asmlist al_resources
; Begin asmlist al_rtti
; End asmlist al_rtti
; Begin asmlist al_indirectglobals
; End asmlist al_indirectglobals
; Begin asmlist al_dwarf_frame
; End asmlist al_dwarf_frame
; Begin asmlist al_dwarf_info
; End asmlist al_dwarf_info
; Begin asmlist al_dwarf_abbrev
; End asmlist al_dwarf_abbrev
; Begin asmlist al_dwarf_line
; End asmlist al_dwarf_line
; Begin asmlist al_dwarf_aranges
; End asmlist al_dwarf_aranges
; Begin asmlist al_dwarf_ranges
; End asmlist al_dwarf_ranges
; Begin asmlist al_picdata
; End asmlist al_picdata
; Begin asmlist al_indirectpicdata
; End asmlist al_indirectpicdata
; Begin asmlist al_resourcestrings
; End asmlist al_resourcestrings
; Begin asmlist al_objc_data
; End asmlist al_objc_data
; Begin asmlist al_objc_pools
; End asmlist al_objc_pools
; Begin asmlist al_end
; End asmlist al_end
_CODE		ENDS
	END

