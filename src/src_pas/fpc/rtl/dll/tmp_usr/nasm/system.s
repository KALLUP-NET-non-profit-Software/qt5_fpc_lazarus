BITS 32
CPU pentium

SECTION .text
	ALIGN 16
	GLOBAL fpc_libinitializeunits
fpc_libinitializeunits:
		push	ebp
		mov	ebp,esp
		mov	esp,ebp
		pop	ebp
		ret

SECTION .text
	ALIGN 16
	GLOBAL fpc_initializeunits
fpc_initializeunits:
		push	ebp
		mov	ebp,esp
		mov	esp,ebp
		pop	ebp
		ret
