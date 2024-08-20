bits 32
cpu pentium

extern fpc_initializeunits

section .text
align  16
global PASCALMAIN
PASCALMAIN:
global _main
_main:
		push	ebp
		mov	ebp,esp

		call	fpc_initializeunits

		mov	esp,ebp
		pop	ebp
		ret
