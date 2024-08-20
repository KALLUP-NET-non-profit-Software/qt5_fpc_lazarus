bits 32

extern PASCALMAIN

global SYSINITPAS_$$_ENTRY
SYSINITPAS_$$_ENTRY:
global _mainCRTStartup
_mainCRTStartup:
		push	ebp
		mov	ebp,esp

		call	PASCALMAIN

		mov	esp,ebp
		pop	ebp
		ret
