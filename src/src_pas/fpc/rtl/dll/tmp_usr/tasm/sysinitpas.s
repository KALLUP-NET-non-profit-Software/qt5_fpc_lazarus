	.386p
	LOCALS @@

	EXTRN	PASCALMAIN
; Begin asmlist al_begin
; End asmlist al_begin
; Begin asmlist al_stabs
; End asmlist al_stabs
; Begin asmlist al_pure_assembler
; End asmlist al_pure_assembler
; Begin asmlist al_procedures

_CODE		SEGMENT	PARA PUBLIC USE32 'CODE'
	ALIGN 16
	PUBLIC	SYSINITPAS_$$_ENTRY
SYSINITPAS_$$_ENTRY:
	PUBLIC	_mainCRTStartup
_mainCRTStartup:
; [sysinitpas.pas]
; [19] begin
		push	ebp
		mov	ebp,esp
; [20] PascalMain;
		call	PASCALMAIN
; [22] end;
		mov	esp,ebp
		pop	ebp
		ret
; End asmlist al_procedures
; Begin asmlist al_globals
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

