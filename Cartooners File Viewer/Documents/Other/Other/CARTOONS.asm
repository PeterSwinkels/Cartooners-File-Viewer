; ---------------------------------------------------------------------------

REGS		union ;	(sizeof=0xE, align=0x2,	standard type)
					; XREF:	sub_1A746:loc_1A822w
					; sub_1A746:loc_1A827w	...
x		WORDREGS ?
h		BYTEREGS ?
REGS		ends

; ---------------------------------------------------------------------------

WORDREGS	struc ;	(sizeof=0xE, align=0x2,	standard type) ; XREF: REGSr
_ax		dw ?
_bx		dw ?
_cx		dw ?
_dx		dw ?
_si		dw ?
_di		dw ?
cflag		dw ?
WORDREGS	ends

; ---------------------------------------------------------------------------

BYTEREGS	struc ;	(sizeof=0x8, standard type) ; XREF: REGSr
_al		db ?
_ah		db ?
_bl		db ?
_bh		db ?
_cl		db ?
_ch		db ?
_dl		db ?
_dh		db ?
BYTEREGS	ends

; ---------------------------------------------------------------------------

SREGS		struc ;	(sizeof=0x8, align=0x2,	standard type) ; XREF: _statr
					; sub_270A8r ...
_es		dw ?
_cs		dw ?
_ss		dw ?
_ds		dw ?
SREGS		ends

; ---------------------------------------------------------------------------

stat		struc ;	(sizeof=0x1E, align=0x2, standard type)	; XREF:	sub_22E75r
st_dev		dw ?
st_ino		dw ?
st_mode		dw ?
st_nlink	dw ?
st_uid		dw ?
st_gid		dw ?
st_rdev		dw ?
st_size		dd ?
st_atime	dd ?
st_mtime	dd ?
st_ctime	dd ?
stat		ends

; ---------------------------------------------------------------------------

_find_t		struc ;	(sizeof=0x2C, align=0x2, standard type)	; XREF:	sub_1FAA3r
					; sub_1FCD6r ...
reserved	db 21 dup(?)
attrib		db ?
wr_time		dw ?
wr_date		dw ?
size		dd ?
name		db 13 dup(?)
		db ? ; undefined
_find_t		ends

; ---------------------------------------------------------------------------

_diskfree_t	struc ;	(sizeof=0x8, align=0x2,	standard type) ; XREF: sub_22E75r
total_clusters	dw ?
avail_clusters	dw ?
sectors_per_cluster dw ?
bytes_per_sector dw ?
_diskfree_t	ends

;
; Input	MD5   :	158DC426ABF2710BD35861581CDFA2F2
; Input	CRC32 :	7378F3C0

; File Name   :	C:\temp\cartooners_dev\CARTOONS.unp.EXE
; Format      :	MS-DOS executable (EXE)
; Base Address:	1000h Range: 10000h-4F260h Loaded length: 37120h
; Entry	Point :	2F82:3BEC
; OS type	  :  MS	DOS
; Application type:  Executable	16bit

		.686p
		.mmx
		.model large

; ===========================================================================

; Segment type:	Pure code
seg000		segment	byte public 'CODE' use16
		assume cs:seg000
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; =============== S U B	R O U T	I N E =======================================


sub_10000	proc far		; CODE XREF: start+7FP
		xor	ax, ax
		call	__chkstk
		retf
sub_10000	endp

; ---------------------------------------------------------------------------
		push	ax
		push	cx
		push	dx
		push	bx
		push	sp
		push	bp
		push	si
		push	di
		push	ds
		push	es
		mov	ax, seg	dseg
		mov	ds, ax
		cld
		mov	word_4E946, 1
		pop	es
		pop	ds
		pop	di
		pop	si
		pop	bp
		pop	bx
		pop	bx
		pop	dx
		pop	cx
		pop	ax
		iret

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn bp-based	frame

; int __cdecl main(int argc, const char	**argv,	const char **envp)
_main		proc far		; CODE XREF: start+9FP

var_16		= dword	ptr -16h
var_12		= byte ptr -12h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		push	di
		push	si
		mov	ax, 0CF84h
		push	ds
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_10052
		sub	ax, ax
		push	ax		; int
		call	far ptr	_exit
; ---------------------------------------------------------------------------
		add	sp, 2

loc_10052:				; CODE XREF: _main+1Cj
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1006E
		push	cs
		call	near ptr sub_10336
; ---------------------------------------------------------------------------

loc_1006E:				; CODE XREF: _main+3Fj
		mov	ax, 1
		cwd
		push	dx
		push	ax		; void (__cdecl	*)(int)
		mov	ax, 2
		push	ax		; int
		call	_signal
		add	sp, 6
		mov	ax, 1Bh
		push	ax		; unsigned int
		call	__dos_getvect
		add	sp, 2
		mov	word_47124, ax
		mov	word_47126, dx
		mov	ax, 8
		mov	dx, seg	seg000
		push	dx
		push	ax		; void (__cdecl	__far far *)()
		mov	ax, 1Bh
		push	ax		; unsigned int
		call	__dos_setvect
		add	sp, 6
		mov	ax, 6F6h
		mov	dx, seg	seg000
		push	dx
		push	ax		; void (*)(void)
		call	_atexit
		add	sp, 4
		mov	ax, 51Ch
		mov	dx, seg	seg000
		push	dx
		push	ax		; void (__cdecl	__far far *)(unsigned int, unsigned int, unsigned int far *)
		call	__harderr
		add	sp, 4
		mov	ax, 6D5h
		mov	dx, seg	seg000
		push	dx
		push	ax		; void (*)(void)
		call	_atexit
		add	sp, 4
		mov	word_4DF94, 0
		sub	ax, ax
		mov	word ptr [bp+var_16+2],	ax
		mov	word ptr [bp+var_16], ax
		jmp	short loc_10127
; ---------------------------------------------------------------------------

loc_100E7:				; CODE XREF: _main+F6j
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		jmp	short loc_10127
; ---------------------------------------------------------------------------

loc_100F9:				; CODE XREF: _main+101j
		add	word ptr [bp+arg_2], 4
		les	bx, [bp+arg_2]
		les	bx, es:[bx]
		mov	cx, 2
		mov	di, 63h	; 'c'
		mov	si, bx
		push	ds
		push	ds
		push	es
		pop	ds
		pop	es
		shr	cx, 1
		sbb	ax, ax
		cmp	cx, cx
		repe cmpsw
		jnz	short loc_1011E
		sub	cx, ax
		repe cmpsb

loc_1011E:				; CODE XREF: _main+EFj
		pop	ds
		jnz	short loc_100E7
		mov	word_4DF94, 1

loc_10127:				; CODE XREF: _main+BCj	_main+CEj
		dec	[bp+arg_0]
		jnz	short loc_100F9
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16] ; char *
		call	sub_23F23
		mov	ax, 6ACh
		mov	dx, seg	seg000
		push	dx
		push	ax		; void (*)(void)
		call	_atexit
		add	sp, 4
		call	sub_256A4
		call	sub_2362A
		call	sub_2329F
		sub	ax, ax
		push	ax		; int
		call	far ptr	_exit
_main		endp

; ---------------------------------------------------------------------------
		add	sp, 2
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10167	proc far		; CODE XREF: sub_2362A+58P
					; seg001:3792P

var_28		= word ptr -28h
var_26		= byte ptr -26h
var_14		= byte ptr -14h
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		call	sub_2329F
		cmp	[bp+arg_0], 0
		jz	short loc_10197
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_181DF
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_10197:				; CODE XREF: sub_10167+14j
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1B2AF
		mov	word_490A0, 0
		mov	ax, 0A3C6h
		push	ds
		push	ax
		call	sub_20A92
		nop
		push	cs
		call	near ptr sub_1CE72
		nop
		push	cs
		call	near ptr sub_1373A
		call	sub_2A016
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D
		mov	word_4E930, 1
		mov	word_49098, 1FFFh
		mov	word_4909A, 0
		mov	word_4B3A0, 0
		call	sub_23285
		jmp	loc_10289
; ---------------------------------------------------------------------------

loc_101ED:				; CODE XREF: sub_10167+129j
		lea	ax, [bp+var_14]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_10208
		jmp	loc_10289
; ---------------------------------------------------------------------------

loc_10208:				; CODE XREF: sub_10167+9Cj
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_23CFB
		mov	[bp+var_2], ax
		cmp	ax, 3
		jnz	short loc_10221
		jmp	loc_102B2
; ---------------------------------------------------------------------------

loc_10221:				; CODE XREF: sub_10167+B5j
		cmp	ax, 5
		jnz	short loc_10229
		jmp	loc_102B2
; ---------------------------------------------------------------------------

loc_10229:				; CODE XREF: sub_10167+BDj
		cmp	ax, 7
		jnz	short loc_10231
		jmp	loc_102D8
; ---------------------------------------------------------------------------

loc_10231:				; CODE XREF: sub_10167+C5j
		cmp	ax, 11h
		jz	short loc_10240
		cmp	ax, 13h
		jz	short loc_10293
		cmp	ax, 19h
		jnz	short loc_10284

loc_10240:				; CODE XREF: sub_10167+CDj
		cmp	word_4E930, 0
		jz	short loc_10274
		lea	ax, [bp+var_26]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_10274
		mov	ax, word_49096
		mov	[bp+var_28], ax
		push	ax
		push	word_49094
		nop
		push	cs
		call	near ptr sub_1C5B3
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_10274:				; CODE XREF: sub_10167+DEj
					; sub_10167+F6j
		sub	ax, ax
		push	ax
		push	[bp+var_28]
		nop
		push	cs
		call	near ptr sub_1D414

loc_1027F:				; CODE XREF: sub_10167+131j
					; sub_10167+149j ...
		call	sub_2708A

loc_10284:				; CODE XREF: sub_10167+D7j
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_10289:				; CODE XREF: sub_10167+83j
					; sub_10167+9Ej
		cmp	word_4B3A0, 0
		jnz	short loc_102EC
		jmp	loc_101ED
; ---------------------------------------------------------------------------

loc_10293:				; CODE XREF: sub_10167+D2j
		cmp	word_4E930, 0
		jz	short loc_1027F
		mov	ax, 80AEh
		push	ds
		push	ax
		push	word_49092
		push	word_4908C
		push	word_4908A
		nop
		push	cs
		call	near ptr sub_137E6
		jmp	short loc_1027F
; ---------------------------------------------------------------------------

loc_102B2:				; CODE XREF: sub_10167+B7j
					; sub_10167+BFj
		cmp	word_4E930, 0
		jz	short loc_1027F
		mov	al, byte_49086
		sub	ah, ah
		push	ax
		push	word_49092
		cmp	[bp+var_2], 5
		jnz	short loc_102CE
		mov	ax, 1
		jmp	short loc_102D0
; ---------------------------------------------------------------------------

loc_102CE:				; CODE XREF: sub_10167+160j
		sub	ax, ax

loc_102D0:				; CODE XREF: sub_10167+165j
		push	ax
		nop
		push	cs
		call	near ptr sub_14619
		jmp	short loc_1027F
; ---------------------------------------------------------------------------

loc_102D8:				; CODE XREF: sub_10167+C7j
		cmp	word_4E930, 0
		jz	short loc_1027F
		mov	al, byte_49086
		sub	ah, ah
		push	ax
		nop
		push	cs
		call	near ptr sub_14883
		jmp	short loc_1027F
; ---------------------------------------------------------------------------

loc_102EC:				; CODE XREF: sub_10167+127j
		nop
		push	cs
		call	near ptr sub_1CE23
		mov	sp, bp
		pop	bp
		retf	2
sub_10167	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_102F7	proc far		; CODE XREF: sub_13524+B6p
					; sub_1632A+38p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	word_490A0, 0
		jz	short loc_1031F
		mov	bx, [bp+arg_0]
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx+1B62h]
		push	word ptr [bx+1B60h]
		push	word_490A0
		push	cs
		call	near ptr sub_1034A
; ---------------------------------------------------------------------------

loc_1031F:				; CODE XREF: sub_102F7+Fj
		pop	bp
		retf	2
sub_102F7	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		cmp	word_490A0, 0
		jz	short locret_10335
		push	cs
		call	near ptr sub_10336
; ---------------------------------------------------------------------------

locret_10335:				; CODE XREF: seg000:032Fj
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_10336	proc far		; CODE XREF: _main+42p	seg000:0332p ...
		xor	ax, ax
		call	__chkstk
		mov	ax, 65h	; 'e'
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	cs
		call	near ptr sub_1034A
sub_10336	endp

; ---------------------------------------------------------------------------
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn bp-based	frame

sub_1034A	proc far		; CODE XREF: sub_102F7+25p
					; sub_10336+10p ...

var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	di
		push	si
		mov	si, 614Eh
		les	di, [bp+arg_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		cmp	[bp+arg_0], 0
		jnz	short loc_10383
		jmp	loc_1043A
; ---------------------------------------------------------------------------

loc_10383:				; CODE XREF: sub_1034A+34j
		cmp	[bp+arg_0], 0FFFFh
		jnz	short loc_1038C
		jmp	loc_1043A
; ---------------------------------------------------------------------------

loc_1038C:				; CODE XREF: sub_1034A+3Dj
		mov	ax, 0Ah
		push	ax		; int
		lea	ax, [bp+var_8]
		push	ss
		push	ax		; char *
		push	[bp+arg_0]	; int
		call	_itoa
		add	sp, 8
		mov	di, 75h	; 'u'
		mov	si, 614Eh
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	bx, ax
		lea	di, [bp+var_8]
		mov	si, bx
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	bx, ax
		mov	word ptr [bp+var_C], bx
		mov	word ptr [bp+var_C+2], dx
		mov	di, 73h	; 's'
		mov	ax, ds
		push	ds
		lds	si, [bp+var_C]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds

loc_1043A:				; CODE XREF: sub_1034A+36j
					; sub_1034A+3Fj
		mov	ax, 614Eh
		mov	word_47128, ax
		mov	word_4712A, ds
		mov	ax, 1
		push	ax		; int
		call	far ptr	_exit
sub_1034A	endp

; ---------------------------------------------------------------------------
		add	sp, 2
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	6

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_10458(__int32, char *)
sub_10458	proc far		; CODE XREF: sub_1827E+27p
					; sub_1A1F0+6Bp

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	ax, word_4E948
		mov	[bp+var_2], ax
		mov	word_4E948, 1
		mov	word_47122, 1

loc_10475:				; CODE XREF: sub_10458+A7j
		mov	word_4712C, 0
		mov	ax, 6
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	far ptr	_access
		add	sp, 6
		or	ax, ax
		jz	short loc_104D9
		cmp	word_4664F, 0Dh
		jnz	short loc_104A5

loc_10498:				; CODE XREF: sub_10458+68j
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_104EE
		call	[bp+arg_0]
		jmp	short loc_10502
; ---------------------------------------------------------------------------

loc_104A5:				; CODE XREF: sub_10458+3Ej
		mov	ax, 180h
		push	ax
		mov	ax, 8101h
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	_open
		add	sp, 8
		mov	[bp+var_4], ax
		or	ax, ax
		jl	short loc_10498
		push	ax		; int
		call	_close
		add	sp, 2
		cmp	word_4712C, 0
		jnz	short loc_104EE

loc_104D2:				; CODE XREF: sub_10458+94j
		mov	[bp+var_6], 1
		jmp	short loc_10507
; ---------------------------------------------------------------------------

loc_104D9:				; CODE XREF: sub_10458+37j
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	far ptr	_remove
		add	sp, 4
		cmp	word_4712C, 0
		jz	short loc_104D2

loc_104EE:				; CODE XREF: sub_10458+46j
					; sub_10458+78j
		push	word_47120	; char
		mov	ax, 42h	; 'B'
		push	ds
		push	ax		; char *
		call	sub_105D3
		cmp	ax, 2
		jz	short loc_10502
		jmp	loc_10475
; ---------------------------------------------------------------------------

loc_10502:				; CODE XREF: sub_10458+4Bj
					; sub_10458+A5j
		mov	[bp+var_6], 0

loc_10507:				; CODE XREF: sub_10458+7Fj
		mov	word_47122, 1
		mov	ax, [bp+var_2]
		mov	word_4E948, ax
		mov	ax, [bp+var_6]
		mov	sp, bp
		pop	bp
		retf	8
sub_10458	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		mov	al, [bp+8]
		sub	ah, ah
		mov	si, ax
		neg	ax
		mov	word_4DF5E, ax
		mov	ax, si
		cmp	ax, 0Ch
		ja	short loc_1058B
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_105B6[bx]
; ---------------------------------------------------------------------------

loc_10542:				; CODE XREF: seg000:053Dj
					; DATA XREF: seg000:off_105B6o
		cmp	word_47122, 0
		jnz	short loc_10556
		push	word ptr [bp+6]
		mov	ax, 42h	; 'B'
		push	ds
		push	ax
		call	sub_1061F
		jmp	short loc_1056D
; ---------------------------------------------------------------------------

loc_10556:				; CODE XREF: seg000:0547j
		mov	ax, [bp+6]
		mov	word_47120, ax
		mov	word_4712C, 1
		sub	ax, ax
		push	ax
		call	__hardresume
		add	sp, 2

loc_1056D:				; CODE XREF: seg000:053Dj seg000:0554j
					; DATA XREF: ...
		push	word ptr [bp+6]
		mov	ax, 121h
		push	ds
		push	ax
		call	sub_1061F

loc_10578:				; CODE XREF: seg000:053Dj
					; DATA XREF: seg000:05BEo ...
		push	word ptr [bp+6]
		mov	ax, 148h
		push	ds
		push	ax
		call	sub_1061F

loc_10583:				; CODE XREF: seg000:053Dj
					; DATA XREF: seg000:05C8o
		mov	ax, 15Dh
		push	ds
		push	ax
		call	sub_10680

loc_1058B:				; CODE XREF: seg000:0538j
		mov	word ptr [bp+8], 0Dh

loc_10590:				; CODE XREF: seg000:053Dj
					; DATA XREF: seg000:05B8o ...
		mov	bl, [bp+8]
		sub	bh, bh
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx+174h]
		mov	dx, [bx+176h]
		mov	word_47128, ax
		mov	word_4712A, dx
		mov	ax, 2
		push	ax
		call	__hardresume
		add	sp, 2
		jmp	short loc_105D0
; ---------------------------------------------------------------------------
off_105B6	dw offset loc_10542	; DATA XREF: seg000:053Dr
		dw offset loc_10590
		dw offset loc_1056D
		dw offset loc_10590
		dw offset loc_10578
		dw offset loc_10590
		dw offset loc_10578
		dw offset loc_10578
		dw offset loc_10578
		dw offset loc_10583
		dw offset loc_10590
		dw offset loc_10590
		dw offset loc_10590
; ---------------------------------------------------------------------------

loc_105D0:				; CODE XREF: seg000:05B4j
		pop	si
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_105D3(char *, char)
sub_105D3	proc near		; CODE XREF: sub_10458+9Fp
					; sub_1061F+22p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	ax, 23h	; '#'
		push	ax		; int
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_strchr
		add	sp, 6
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		les	bx, [bp+var_6]
		assume es:nothing
		mov	al, [bp+arg_4]
		add	al, 41h	; 'A'
		mov	es:[bx], al
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_2558B
		mov	[bp+var_2], ax
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 23h ;	'#'
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retn	6
sub_105D3	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1061F(char *, char)
sub_1061F	proc near		; CODE XREF: seg000:0551p seg000:0575p ...

var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		cmp	word_4712C, 0
		jz	short loc_10638
		cmp	word_4DF5E, 0
		jz	short loc_10649

loc_10638:				; CODE XREF: sub_1061F+10j
		push	word ptr [bp+arg_4] ; char
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	sub_105D3
		mov	[bp+var_2], ax
		jmp	short loc_1064E
; ---------------------------------------------------------------------------

loc_10649:				; CODE XREF: sub_1061F+17j
		mov	[bp+var_2], 1

loc_1064E:				; CODE XREF: sub_1061F+28j
		cmp	[bp+var_2], 1
		jnz	short loc_1065F
		mov	word_4DF5E, 0
		mov	ax, 1
		jmp	short loc_10674
; ---------------------------------------------------------------------------

loc_1065F:				; CODE XREF: sub_1061F+33j
		cmp	word_4E948, 0
		jz	short loc_10671
		mov	ax, 2
		push	ax
		call	sub_34E50
		jmp	short loc_1067A
; ---------------------------------------------------------------------------

loc_10671:				; CODE XREF: sub_1061F+45j
		mov	ax, 2

loc_10674:				; CODE XREF: sub_1061F+3Ej
		push	ax		; int
		call	__hardresume

loc_1067A:				; CODE XREF: sub_1061F+50j
		mov	sp, bp
		pop	bp
		retn	6
sub_1061F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10680	proc near		; CODE XREF: seg000:0588p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		call	sub_255BA
		mov	[bp+var_2], ax
		cmp	ax, 1
		jnz	short loc_1069D
		mov	ax, 1
		jmp	short loc_106A0
; ---------------------------------------------------------------------------

loc_1069D:				; CODE XREF: sub_10680+16j
		mov	ax, 2

loc_106A0:				; CODE XREF: sub_10680+1Bj
		push	ax		; int
		call	__hardresume
		mov	sp, bp
		pop	bp
		retn	4
sub_10680	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		cmp	word_47180, 0
		jnz	short locret_106D4
		mov	word_47180, 1
		nop
		push	cs
		call	near ptr sub_1CF11
		call	sub_26C7C
		call	sub_20A8A
		nop
		push	cs
		call	near ptr sub_1ADC2

locret_106D4:				; CODE XREF: seg000:06B8j
		retf
; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	ax, word_47128
		or	ax, word_4712A
		jz	short locret_106F5
		push	word_4712A
		push	word_47128
		call	_puts
		add	sp, 4

locret_106F5:				; CODE XREF: seg000:06E3j
		retf
; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		push	word_47126
		push	word_47124
		mov	ax, 1Bh
		push	ax
		call	__dos_setvect
		add	sp, 6
		retf

; =============== S U B	R O U T	I N E =======================================


sub_10712	proc far		; CODE XREF: sub_23F23+110P
		xor	ax, ax
		call	__chkstk
		retf
sub_10712	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1071A	proc far		; CODE XREF: sub_18143+93p

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1074E
		call	sub_23285
		call	sub_2523A
		nop
		push	cs
		call	near ptr sub_1B0EC
		jmp	short loc_107A9
; ---------------------------------------------------------------------------

loc_1074E:				; CODE XREF: sub_1071A+21j
		mov	ax, 8914h
		push	ax
		call	sub_2BFC6
		mov	word_4B45F, 0
		mov	ax, 8914h
		push	ax
		call	sub_24565
		mov	[bp+var_18], 77BCh
		mov	ax, word_49916
		mov	dx, word_49918
		mov	[bp+var_16], ax
		mov	[bp+var_14], dx

loc_10778:				; CODE XREF: sub_1071A+88j
		push	ds
		push	[bp+var_18]
		call	sub_10FFD
		push	ds
		push	[bp+var_18]
		push	[bp+var_14]
		push	[bp+var_16]
		push	cs
		call	near ptr sub_110E4
		push	[bp+var_18]
		nop
		push	cs
		call	near ptr sub_176C9
		add	[bp+var_18], 26h ; '&'
		add	[bp+var_16], 0Eh
		cmp	[bp+var_18], 80A4h
		jb	short loc_10778
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_107A9:				; CODE XREF: sub_1071A+32j
		mov	sp, bp
		pop	bp
		retf
sub_1071A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_107AD	proc far		; CODE XREF: sub_2BFC6+A5P

var_12		= byte ptr -12h
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 12h
		call	__chkstk
		mov	ax, 46h	; 'F'
		push	ax		; size_t
		mov	ax, 244h
		push	ds
		push	ax		; void *
		push	ds
		push	word ptr [bp+arg_0] ; void *
		call	_memmove
		add	sp, 0Ah
		mov	ax, 20h	; ' '
		push	ax		; size_t
		mov	ax, 0A481h
		push	ds
		push	ax		; void *
		push	ds
		push	word ptr [bp+arg_0] ; void *
		call	_memmove
		add	sp, 0Ah
		call	sub_278AF
		or	dx, dx
		jg	short loc_1080C
		jl	short loc_107F2
		cmp	ax, 25A3h
		jnb	short loc_1080C

loc_107F2:				; CODE XREF: sub_107AD+3Ej
					; sub_107AD+75j
		mov	bx, word ptr [bp+arg_0]
		mov	word ptr [bx+20h], 0
		mov	bx, word ptr [bp+arg_0]
		sub	ax, ax
		mov	[bx+4Ah], ax
		mov	[bx+48h], ax
		nop
		push	cs
		call	near ptr sub_1B0EC
		jmp	short loc_10885
; ---------------------------------------------------------------------------

loc_1080C:				; CODE XREF: sub_107AD+3Cj
					; sub_107AD+43j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_107F2
		mov	ax, 25A3h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	bx, word ptr [bp+arg_0]
		mov	[bx+48h], ax
		mov	[bx+4Ah], dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		mov	ax, 25A3h
		push	ax		; size_t
		mov	ax, 11FEh
		mov	dx, seg	seg003
		push	dx
		push	ax		; void *
		mov	bx, word ptr [bp+arg_0]
		les	bx, [bx+48h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		call	_memmove
		add	sp, 0Ah
		push	word ptr [bp+arg_0]
		call	sub_2C4C3
		push	word ptr [bp+arg_0]
		call	sub_2C586
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr [bx+4Ch], 0
		mov	bx, word ptr [bp+arg_0]
		mov	word ptr [bx+46h], 2

loc_10885:				; CODE XREF: sub_107AD+5Dj
		mov	sp, bp
		pop	bp
		retf	2
sub_107AD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1088B	proc far		; CODE XREF: sub_282A4+3DP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		mov	ax, 0Eh
		imul	[bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	cx, [bx+22h]
		mov	si, [bx+24h]
		add	cx, ax
		push	si
		push	cx
		mov	ax, 26h	; '&'
		imul	[bp+arg_0]
		add	ax, 77BCh
		push	ds
		push	ax
		push	word ptr [bx+0DFh]
		mov	ax, bx
		add	ax, 0E1h ; '�'
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	cs
		call	near ptr sub_108CB
		pop	si
		pop	bp
		retf	4
sub_1088B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_108CB	proc far		; CODE XREF: sub_1088B+38p
					; sub_16EE2+5Cp

var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+8]
		imul	word ptr es:[bx+0Ah]
		mov	[bp+var_2], ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_10916
		les	bx, es:[bx]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jnz	short loc_1093E
		les	bx, [bp+arg_C]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1B4C0
		cmp	word_490A0, 0
		jz	short loc_1093E
		nop
		push	cs
		call	near ptr sub_1B0EC
		jmp	short loc_1093E
; ---------------------------------------------------------------------------

loc_10916:				; CODE XREF: sub_108CB+20j
		les	bx, [bp+arg_C]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		push	[bp+var_2]
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		les	bx, [bp+arg_C]
		mov	es:[bx], ax
		mov	es:[bx+2], dx

loc_1093E:				; CODE XREF: sub_108CB+2Cj
					; sub_108CB+42j ...
		push	word ptr [bp+arg_C+2]
		push	word ptr [bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	al, [bp+arg_0]
		sub	ah, ah
		push	ax
		push	cs
		call	near ptr sub_10963
		mov	sp, bp
		pop	bp
		retf	10h
sub_108CB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10963	proc far		; CODE XREF: sub_108CB+8Fp
					; sub_16FA8+54p

var_22		= byte ptr -22h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		mov	ax, 22h	; '"'
		call	__chkstk
		push	di
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+8]
		imul	word ptr es:[bx+0Ah]
		mov	[bp+var_10], ax
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_C]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_E], ax
		mov	word ptr [bp+var_E+2], dx
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+8]
		mov	[bp+var_A], ax
		sub	ax, ax
		mov	[bp+var_8], ax
		mov	[bp+var_6], ax
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_2], ax
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_4], ax
		mov	cx, [bp+var_10]
		les	di, [bp+var_E]
		mov	al, [bp+arg_0]
		repne stosb
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_109F7
		push	[bp+arg_A]
		push	[bp+arg_8]
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		sub	ax, ax
		push	ax
		call	sub_10A53
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_10A1C
; ---------------------------------------------------------------------------

loc_109F7:				; CODE XREF: sub_10963+7Aj
		les	bx, [bp+arg_C]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1B063
		les	bx, [bp+arg_C]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1B34B
		nop
		push	cs
		call	near ptr sub_1B0EC
		jmp	short loc_10A4C
; ---------------------------------------------------------------------------

loc_10A1C:				; CODE XREF: sub_10963+92j
		cmp	[bp+arg_6], 0
		jz	short loc_10A3D
		push	[bp+arg_4]
		push	[bp+arg_2]
		les	bx, [bp+arg_C]
		les	bx, es:[bx]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	[bp+var_10]
		call	sub_321D3

loc_10A3D:				; CODE XREF: sub_10963+BDj
		les	bx, [bp+arg_C]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1B063

loc_10A4C:				; CODE XREF: sub_10963+B7j
		pop	di
		mov	sp, bp
		pop	bp
		retf	10h
sub_10963	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10A53	proc near		; CODE XREF: sub_10963+8Ap

var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_6]
		mov	si, es:[bx]
		or	si, si
		jnz	short loc_10A6D
		jmp	loc_10C8C
; ---------------------------------------------------------------------------

loc_10A6D:				; CODE XREF: sub_10A53+15j
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+1F4h]
		mov	[bp+var_8], ax
		or	ax, ax
		jnz	short loc_10A8A
		mov	bx, word ptr [bp+arg_6]
		mov	ax, es:[bx+0Ah]
		sub	ax, es:[bx+6]
		mov	[bp+var_8], ax

loc_10A8A:				; CODE XREF: sub_10A53+27j
		mov	ax, 9
		mul	[bp+var_8]
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 81h	; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		les	bx, [bp+var_6]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		les	bx, [bp+arg_6]
		cmp	word ptr es:[bx], 1
		jz	short loc_10AC2
		jmp	loc_10B9E
; ---------------------------------------------------------------------------

loc_10AC2:				; CODE XREF: sub_10A53+6Aj
		les	bx, [bp+var_16]
		mov	byte ptr es:[bx+8], 0
		les	bx, [bp+var_16]
		mov	word ptr es:[bx], 0
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+0Ch]
		sub	ax, es:[bx+8]
		les	bx, [bp+var_16]
		mov	es:[bx+6], ax
		les	bx, [bp+var_16]
		mov	es:[bx+4], ax
		les	bx, [bp+var_16]
		mov	es:[bx+2], ax
		mov	ax, 9
		mul	[bp+var_8]
		mov	si, ax
		les	bx, [bp+var_16]
		mov	ax, bx
		mov	dx, es
		lea	di, [bx+si-9]
		mov	si, ax
		push	ds
		mov	ds, dx
		movsw
		movsw
		movsw
		movsw
		movsb
		pop	ds
		mov	ax, 9
		mul	[bp+var_8]
		mov	si, ax
		les	bx, [bp+var_16]
		mov	al, byte ptr [bp+var_8]
		dec	al
		mov	es:[bx+si-1], al
		les	bx, [bp+var_16]
		mov	ax, bx
		mov	dx, es
		lea	di, [bx+9]
		mov	si, ax
		push	ds
		mov	ds, dx
		movsw
		movsw
		movsw
		movsw
		movsb
		pop	ds
		les	bx, [bp+var_16]
		mov	word ptr es:[bx+0Bh], 2
		les	bx, [bp+var_16]
		mov	ax, es:[bx+6]
		dec	ax
		dec	ax
		mov	es:[bx+0Dh], ax
		les	bx, [bp+var_16]
		mov	byte ptr es:[bx+11h], 1
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		add	ax, 12h
		mov	word ptr [bp+var_12], ax
		mov	word ptr [bp+var_12+2],	dx
		mov	[bp+var_C], 2
		jmp	short loc_10B93
; ---------------------------------------------------------------------------

loc_10B6C:				; CODE XREF: sub_10A53+149j
		les	bx, [bp+var_12]
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		add	ax, 9
		mov	di, bx
		mov	si, ax
		push	ds
		mov	ds, dx
		movsw
		movsw
		movsw
		movsw
		movsb
		pop	ds
		mov	al, byte ptr [bp+var_C]
		mov	es:[bx+8], al
		add	word ptr [bp+var_12], 9
		inc	[bp+var_C]

loc_10B93:				; CODE XREF: sub_10A53+117j
		mov	ax, [bp+var_8]
		dec	ax
		cmp	ax, [bp+var_C]
		jbe	short loc_10BAD
		jmp	short loc_10B6C
; ---------------------------------------------------------------------------

loc_10B9E:				; CODE XREF: sub_10A53+6Cj
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		call	sub_10DF6

loc_10BAD:				; CODE XREF: sub_10A53+147j
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_10CDE
		mov	[bp+var_18], ax
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		mov	word ptr [bp+var_12], ax
		mov	word ptr [bp+var_12+2],	dx
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		jmp	short loc_10BF9
; ---------------------------------------------------------------------------

loc_10BD7:				; CODE XREF: sub_10A53+1AEj
		les	bx, [bp+var_12]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx+4]
		mov	al, es:[bx+8]
		sub	ah, ah
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_18]
		call	sub_10D35
		add	word ptr [bp+var_12], 9

loc_10BF9:				; CODE XREF: sub_10A53+182j
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jnz	short loc_10BD7
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+4]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_10CDE
		mov	[bp+var_18], ax
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		mov	word ptr [bp+var_12], ax
		mov	word ptr [bp+var_12+2],	dx
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		jmp	short loc_10C75
; ---------------------------------------------------------------------------

loc_10C37:				; CODE XREF: sub_10A53+22Aj
		les	bx, [bp+var_12]
		mov	al, es:[bx+8]
		sub	ah, ah
		mov	[bp+var_A], ax
		push	word ptr es:[bx]
		push	word ptr es:[bx+2]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_18]
		call	sub_10D35
		les	bx, [bp+var_12]
		push	word ptr es:[bx+4]
		push	word ptr es:[bx+6]
		push	[bp+var_A]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_18]
		call	sub_10D35
		add	word ptr [bp+var_12], 9

loc_10C75:				; CODE XREF: sub_10A53+1E2j
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jnz	short loc_10C37
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		nop
		push	cs
		call	near ptr sub_1AEAD
		jmp	short loc_10C94
; ---------------------------------------------------------------------------

loc_10C8C:				; CODE XREF: sub_10A53+17j
		sub	ax, ax
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], ax

loc_10C94:				; CODE XREF: sub_10A53+237j
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+1Ah]
		push	word ptr es:[bx+18h]
		nop
		push	cs
		call	near ptr sub_1B047
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1744E
		mov	[bp+var_E], ax
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+1Ah]
		push	word ptr es:[bx+18h]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_E], 0
		jz	short loc_10CD6
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_10CD6:				; CODE XREF: sub_10A53+27Cj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_10A53	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10CDE	proc near		; CODE XREF: sub_10A53+16Ap
					; sub_10A53+1CAp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	[bp+arg_6], 0
		jnz	short loc_10D0A
		cmp	[bp+arg_4], 0
		jz	short loc_10D0A
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_10D03
		mov	[bp+arg_6], 0FF0h
		jmp	short loc_10D2E
; ---------------------------------------------------------------------------

loc_10D03:				; CODE XREF: sub_10CDE+1Cj
		call	sub_20AF6
		jmp	short loc_10D2E
; ---------------------------------------------------------------------------

loc_10D0A:				; CODE XREF: sub_10CDE+Ej
					; sub_10CDE+14j
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_10D26
		mov	ax, [bp+arg_6]
		mov	cl, 4
		shl	ax, cl
		or	[bp+arg_6], ax
		mov	ah, byte ptr [bp+arg_6]
		sub	al, al
		or	[bp+arg_6], ax
		jmp	short loc_10D2E
; ---------------------------------------------------------------------------

loc_10D26:				; CODE XREF: sub_10CDE+32j
		push	[bp+arg_6]
		call	sub_20B78

loc_10D2E:				; CODE XREF: sub_10CDE+23j
					; sub_10CDE+2Aj ...
		mov	ax, [bp+arg_6]
		pop	bp
		retn	8
sub_10CDE	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10D35	proc near		; CODE XREF: sub_10A53+19Fp
					; sub_10A53+201p ...

var_8		= word ptr -8
var_6		= byte ptr -6
var_4		= dword	ptr -4
arg_0		= byte ptr  4
arg_1		= byte ptr  5
arg_2		= dword	ptr  6
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	di
		mov	ax, [bp+arg_8]
		sub	ax, [bp+arg_A]
		mov	[bp+var_8], ax
		or	ax, ax
		jnz	short loc_10D51
		jmp	loc_10DEF
; ---------------------------------------------------------------------------

loc_10D51:				; CODE XREF: sub_10D35+17j
		mov	ax, word ptr [bp+arg_2]
		or	ax, word ptr [bp+arg_2+2]
		jnz	short loc_10D71
		push	[bp+arg_A]
		push	[bp+arg_6]
		call	sub_20892
		push	[bp+var_8]
		sub	ax, ax
		push	ax
		call	sub_2065B
		jmp	short loc_10DEF
; ---------------------------------------------------------------------------

loc_10D71:				; CODE XREF: sub_10D35+22j
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+4]
		mul	[bp+arg_6]
		add	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	cx, [bp+arg_A]
		shr	cx, 1
		add	ax, cx
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		test	byte ptr [bp+arg_6], 1
		jz	short loc_10D9A
		mov	al, [bp+arg_1]
		jmp	short loc_10D9D
; ---------------------------------------------------------------------------

loc_10D9A:				; CODE XREF: sub_10D35+5Ej
		mov	al, [bp+arg_0]

loc_10D9D:				; CODE XREF: sub_10D35+63j
		mov	[bp+var_6], al
		test	byte ptr [bp+arg_A], 1
		jz	short loc_10DBF
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		and	al, 0F0h
		mov	cl, [bp+var_6]
		and	cl, 0Fh
		or	al, cl
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		dec	[bp+var_8]

loc_10DBF:				; CODE XREF: sub_10D35+6Fj
		mov	cx, [bp+var_8]
		sar	cx, 1
		les	di, [bp+var_4]
		mov	al, [bp+var_6]
		repne stosb
		mov	dx, es
		test	byte ptr [bp+var_8], 1
		jz	short loc_10DEF
		mov	ax, [bp+var_8]
		sar	ax, 1
		add	word ptr [bp+var_4], ax
		mov	bx, word ptr [bp+var_4]
		mov	al, es:[bx]
		and	al, 0Fh
		mov	cl, [bp+var_6]
		and	cl, 0F0h
		or	al, cl
		mov	es:[bx], al

loc_10DEF:				; CODE XREF: sub_10D35+19j
					; sub_10D35+3Aj ...
		pop	di
		mov	sp, bp
		pop	bp
		retn	0Ch
sub_10D35	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10DF6	proc near		; CODE XREF: sub_10A53+157p

var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 3Ch	; '<'
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx+20Ch]
		mov	dx, [bx+20Eh]
		mov	[bp+var_1E], ax
		mov	[bp+var_1C], dx
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		shl	bx, 1
		mov	ax, [bx+22Ch]
		mov	[bp+var_1A], ax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		shl	bx, 1
		mov	ax, [bx+1F4h]
		mov	[bp+var_18], ax
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		sub	ax, es:[bx+8]
		mov	[bp+var_C], ax
		shr	ax, 1
		mov	[bp+var_2], ax
		mov	ax, es:[bx+0Ah]
		sub	ax, es:[bx+6]
		mov	[bp+var_34], ax
		mov	bx, es:[bx]
		mov	al, [bx+204h]
		sub	ah, ah
		mov	[bp+var_12], ax
		mov	ax, [bp+var_1E]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		mov	ax, [bp+var_1A]
		add	ax, [bp+var_1E]
		mov	[bp+var_2A], ax
		mov	[bp+var_28], dx
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_6]
		mov	word ptr [bp+var_2E], ax
		mov	word ptr [bp+var_2E+2],	dx
		jmp	loc_10FA5
; ---------------------------------------------------------------------------

loc_10E87:				; CODE XREF: sub_10DF6+D5j
		les	bx, [bp+var_32]
		mov	word ptr es:[bx], 0

loc_10E8F:				; CODE XREF: sub_10DF6+B1j
		les	bx, [bp+var_10]
		mov	al, es:[bx]
		sub	ah, ah
		les	bx, [bp+var_32]
		add	es:[bx], ax
		les	bx, [bp+var_10]
		inc	word ptr [bp+var_10]
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_10E8F
		les	bx, [bp+var_32]
		mov	ax, es:[bx]
		add	[bp+var_22], ax
		les	bx, [bp+var_26]
		mov	ax, [bp+var_22]
		mov	es:[bx], ax
		add	word ptr [bp+var_26], 2
		add	word ptr [bp+var_32], 2

loc_10EC3:				; CODE XREF: sub_10DF6+1D6j
		mov	ax, [bp+var_20]
		dec	[bp+var_20]
		or	ax, ax
		jnz	short loc_10E87
		lea	ax, [bp+var_3C]
		mov	word ptr [bp+var_26], ax
		mov	word ptr [bp+var_26+2],	ss
		mov	[bp+var_20], 4
		jmp	short loc_10EF4
; ---------------------------------------------------------------------------

loc_10EDD:				; CODE XREF: sub_10DF6+106j
		les	bx, [bp+var_26]
		mov	ax, es:[bx]
		mul	[bp+var_2]
		sub	dx, dx
		mov	cx, 0A0h ; '�'
		div	cx
		mov	es:[bx], ax
		add	word ptr [bp+var_26], 2

loc_10EF4:				; CODE XREF: sub_10DF6+E5j
		mov	ax, [bp+var_20]
		dec	[bp+var_20]
		or	ax, ax
		jnz	short loc_10EDD
		cmp	[bp+var_8], 0
		jz	short loc_10F0F
		mov	ax, [bp+var_3A]
		cmp	[bp+var_3C], ax
		jnz	short loc_10F0F
		inc	[bp+var_3A]

loc_10F0F:				; CODE XREF: sub_10DF6+10Cj
					; sub_10DF6+114j
		cmp	[bp+var_4], 0
		jz	short loc_10F20
		mov	ax, [bp+var_36]
		cmp	[bp+var_38], ax
		jnz	short loc_10F20
		dec	[bp+var_38]

loc_10F20:				; CODE XREF: sub_10DF6+11Dj
					; sub_10DF6+125j
		mov	ax, [bp+var_38]
		cmp	[bp+var_3A], ax
		jbe	short loc_10F31
		mov	ax, [bp+var_36]
		mov	[bp+var_38], ax
		mov	[bp+var_3A], ax

loc_10F31:				; CODE XREF: sub_10DF6+130j
		cmp	[bp+var_12], 0
		jz	short loc_10F74
		mov	ax, word ptr [bp+var_2E]
		mov	dx, word ptr [bp+var_2E+2]
		add	ax, 6
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		lea	ax, [bp+var_3C]
		mov	word ptr [bp+var_26], ax
		mov	word ptr [bp+var_26+2],	ss
		jmp	short loc_10F68
; ---------------------------------------------------------------------------

loc_10F51:				; CODE XREF: sub_10DF6+17Cj
		mov	ax, [bp+var_C]
		les	bx, [bp+var_26]
		sub	ax, es:[bx]
		les	bx, [bp+var_16]
		mov	es:[bx], ax
		add	word ptr [bp+var_26], 2
		sub	word ptr [bp+var_16], 2

loc_10F68:				; CODE XREF: sub_10DF6+159j
		lea	ax, [bp+var_34]
		mov	cx, ss
		cmp	word ptr [bp+var_26], ax
		jnb	short loc_10F87
		jmp	short loc_10F51
; ---------------------------------------------------------------------------

loc_10F74:				; CODE XREF: sub_10DF6+13Fj
		mov	cx, 8
		lea	si, [bp+var_3C]
		les	di, [bp+var_2E]
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_10F87:				; CODE XREF: sub_10DF6+17Aj
		les	bx, [bp+var_10]
		mov	al, es:[bx]
		mul	byte ptr [bp+var_34]
		sub	dx, dx
		mov	cx, 0C8h ; '�'
		div	cx
		les	bx, [bp+var_2E]
		mov	es:[bx+8], al
		inc	word ptr [bp+var_10]
		add	word ptr [bp+var_2E], 9

loc_10FA5:				; CODE XREF: sub_10DF6+8Ej
		mov	ax, [bp+var_2A]
		mov	dx, [bp+var_28]
		cmp	word ptr [bp+var_10], ax
		jnb	short loc_10FCF
		mov	[bp+var_22], 0
		lea	ax, [bp+var_3C]
		mov	word ptr [bp+var_26], ax
		mov	word ptr [bp+var_26+2],	ss
		lea	ax, [bp+var_A]
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_32+2],	ss
		mov	[bp+var_20], 4
		jmp	loc_10EC3
; ---------------------------------------------------------------------------

loc_10FCF:				; CODE XREF: sub_10DF6+1B8j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_10DF6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10FD7	proc far		; CODE XREF: sub_18844+112p
					; sub_28D13+5BP

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	[bp+var_2], 77BCh

loc_10FE7:				; CODE XREF: sub_10FD7+20j
		push	ds
		push	[bp+var_2]
		call	sub_10FFD
		add	[bp+var_2], 26h	; '&'
		cmp	[bp+var_2], 80A4h
		jb	short loc_10FE7
		mov	sp, bp
		pop	bp
		retf
sub_10FD7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_10FFD	proc near		; CODE XREF: sub_1071A+62p
					; sub_10FD7+14p ...

var_12		= byte ptr -12h
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 12h
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 3
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0Fh
		les	bx, [bp+arg_0]
		mov	ax, word_4B483
		mov	es:[bx+4], ax
		les	bx, [bp+arg_0]
		mov	ax, word_4B483
		mov	es:[bx+1Ch], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+22h], 0FFFEh
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+24h], 8
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+1Eh], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+20h], 1
		mov	ax, 23Ch
		push	ds
		push	ax
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		add	ax, 6
		push	dx
		push	ax
		call	sub_321A6
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_11126
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+18h]
		or	ax, es:[bx+1Ah]
		jz	short loc_1108A
		push	word ptr es:[bx+1Ah]
		push	word ptr es:[bx+18h]
		nop
		push	cs
		call	near ptr sub_1AEAD

loc_1108A:				; CODE XREF: sub_10FFD+7Ej
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_110C5
		sub	ax, ax
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		mov	es:[bx+1Ah], dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_110D5
; ---------------------------------------------------------------------------

loc_110C5:				; CODE XREF: sub_10FFD+A3j
		push	seg_42B52
		push	word_42B50
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1034A
; ---------------------------------------------------------------------------

loc_110D5:				; CODE XREF: sub_10FFD+C6j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+16h], 0
		mov	sp, bp
		pop	bp
		retn	4
sub_10FFD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_110E4	proc far		; CODE XREF: sub_1071A+70p
					; sub_1116E+19Cp ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Ah]
		sub	ax, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Ch]
		sub	ax, es:[bx+8]
		inc	ax
		sar	ax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		shl	ax, 1
		mov	es:[bx+0Ch], ax
		pop	bp
		retf	8
sub_110E4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11126	proc far		; CODE XREF: sub_10FFD+70p
					; sub_170B6+Ep

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	cl, 3
		shl	ax, cl
		add	ax, 1B4h
		push	ds
		push	ax
		mov	ax, bx
		mov	dx, es
		add	ax, 0Eh
		push	dx
		push	ax
		call	sub_321A6
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		add	ax, 0Eh
		push	dx
		push	ax
		mov	ax, 1ACh
		push	ds
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	dx
		push	ax
		call	sub_20757
		pop	bp
		retf	4
sub_11126	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1116E	proc far		; CODE XREF: sub_1800D+50p

var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= byte ptr -3Ch

		push	bp
		mov	bp, sp
		mov	ax, 52h	; 'R'
		call	__chkstk
		push	di
		push	si
		mov	[bp+var_52], 0
		lea	ax, [bp+var_3C]
		mov	cx, 3Ch	; '<'
		mov	di, ax
		push	ss
		pop	es
		sub	ax, ax
		repne stosb
		mov	dx, es
		mov	[bp+var_46], ax
		jmp	short loc_111D8
; ---------------------------------------------------------------------------

loc_11195:				; CODE XREF: sub_1116E+5Aj
		les	bx, [bp+var_44]
		mov	al, 1Eh
		mul	byte ptr es:[bx]
		mov	bx, ax
		mov	bx, [bx-7F2Eh]
		cmp	word ptr [bx+46h], 2
		jnz	short loc_111BD
		mov	bx, word ptr [bp+var_44]
		mov	si, es:[bx+5]
		cmp	[bp+si+var_3C],	0
		jnz	short loc_111BD
		mov	[bp+si+var_3C],	1
		inc	[bp+var_52]

loc_111BD:				; CODE XREF: sub_1116E+39j
					; sub_1116E+46j
		add	word ptr [bp+var_44], 0Bh

loc_111C1:				; CODE XREF: sub_1116E+A4j
		les	bx, [bp+var_44]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_11195
		push	word ptr [bp+var_4E+2]
		push	word ptr [bp+var_4E]
		nop
		push	cs
		call	near ptr sub_1B063
		inc	[bp+var_46]

loc_111D8:				; CODE XREF: sub_1116E+25j
		mov	ax, word_490B8
		cmp	[bp+var_46], ax
		jg	short loc_11214
		cmp	[bp+var_52], 3Ch ; '<'
		jge	short loc_11214
		mov	bx, [bp+var_46]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_4E], ax
		mov	word ptr [bp+var_4E+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_4E]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_44], ax
		mov	word ptr [bp+var_44+2],	dx
		jmp	short loc_111C1
; ---------------------------------------------------------------------------

loc_11214:				; CODE XREF: sub_1116E+70j
					; sub_1116E+76j
		mov	[bp+var_46], 0
		jmp	short loc_1125E
; ---------------------------------------------------------------------------

loc_1121B:				; CODE XREF: sub_1116E+E0j
		les	bx, [bp+var_44]
		mov	al, 1Eh
		mul	byte ptr es:[bx]
		mov	bx, ax
		mov	bx, [bx-7F2Eh]
		cmp	word ptr [bx+46h], 2
		jnz	short loc_11243
		mov	bx, word ptr [bp+var_44]
		mov	si, es:[bx+5]
		cmp	[bp+si+var_3C],	0
		jnz	short loc_11243
		mov	[bp+si+var_3C],	1
		inc	[bp+var_52]

loc_11243:				; CODE XREF: sub_1116E+BFj
					; sub_1116E+CCj
		add	word ptr [bp+var_44], 0Bh

loc_11247:				; CODE XREF: sub_1116E+12Dj
		les	bx, [bp+var_44]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1121B
		push	word ptr [bp+var_4E+2]
		push	word ptr [bp+var_4E]
		nop
		push	cs
		call	near ptr sub_1B063
		inc	[bp+var_46]

loc_1125E:				; CODE XREF: sub_1116E+ABj
		mov	ax, word_4B396
		cmp	[bp+var_46], ax
		jg	short loc_1129D
		cmp	[bp+var_52], 3Ch ; '<'
		jge	short loc_1129D
		mov	bx, [bp+var_46]
		shl	bx, 1
		shl	bx, 1
		les	si, dword_4E93A
		mov	ax, es:[bx+si]
		mov	dx, es:[bx+si+2]
		mov	word ptr [bp+var_4E], ax
		mov	word ptr [bp+var_4E+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_4E]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_44], ax
		mov	word ptr [bp+var_44+2],	dx
		jmp	short loc_11247
; ---------------------------------------------------------------------------

loc_1129D:				; CODE XREF: sub_1116E+F6j
					; sub_1116E+FCj
		cmp	[bp+var_52], 3Ch ; '<'
		jl	short loc_112A6
		jmp	loc_1132D
; ---------------------------------------------------------------------------

loc_112A6:				; CODE XREF: sub_1116E+133j
		mov	[bp+var_50], 77BCh
		mov	ax, 1E7h
		imul	word_4B45F
		mov	bx, ax
		mov	ax, [bx-76CAh]
		mov	dx, [bx-76C8h]
		mov	word ptr [bp+var_4A], ax
		mov	word ptr [bp+var_4A+2],	dx
		lea	ax, [bp+var_3C]
		mov	word ptr [bp+var_40], ax
		mov	word ptr [bp+var_40+2],	ss

loc_112CB:				; CODE XREF: sub_1116E+1BDj
		les	bx, [bp+var_40]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_11315
		les	bx, [bp+var_4A]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_112F8
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1AEAD
		les	bx, [bp+var_4A]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax

loc_112F8:				; CODE XREF: sub_1116E+170j
		push	ds
		push	[bp+var_50]
		call	sub_10FFD
		push	ds
		push	[bp+var_50]
		push	word ptr [bp+var_4A+2]
		push	word ptr [bp+var_4A]
		push	cs
		call	near ptr sub_110E4
		push	[bp+var_50]
		nop
		push	cs
		call	near ptr sub_176C9

loc_11315:				; CODE XREF: sub_1116E+164j
		add	[bp+var_50], 26h ; '&'
		mov	ax, word ptr [bp+var_4A]
		mov	dx, word ptr [bp+var_4A+2]
		add	word ptr [bp+var_4A], 0Eh
		inc	word ptr [bp+var_40]
		cmp	[bp+var_50], 80A4h
		jb	short loc_112CB

loc_1132D:				; CODE XREF: sub_1116E+135j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_1116E	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11334	proc far		; CODE XREF: sub_123F9+4F9p
					; sub_137E6+6D8p ...

var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_16		= dword	ptr  1Ch

		push	bp
		mov	bp, sp
		mov	ax, 36h	; '6'
		call	__chkstk
		mov	ax, [bp+arg_0]
		mov	cl, 8
		shr	ax, cl
		mov	[bp+var_1E], ax
		or	ax, ax
		jnz	short loc_11352
		mov	[bp+var_1E], 1

loc_11352:				; CODE XREF: sub_11334+17j
		mov	ax, [bp+var_1E]
		shr	ax, 1
		mov	[bp+var_34], ax
		mov	ax, [bp+var_1E]
		dec	ax
		not	ax
		mov	[bp+var_1E], ax
		push	word ptr [bp+arg_A+2]
		push	word ptr [bp+arg_A]
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_321A6
		test	byte ptr [bp+arg_0], 20h
		jz	short loc_11390
		mov	ax, word ptr [bp+arg_A]
		mov	dx, word ptr [bp+arg_A+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		lea	ax, [bp+var_8]
		mov	word ptr [bp+arg_A], ax
		mov	word ptr [bp+arg_A+2], ss
		jmp	short loc_11399
; ---------------------------------------------------------------------------

loc_11390:				; CODE XREF: sub_11334+43j
		lea	ax, [bp+var_8]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], ss

loc_11399:				; CODE XREF: sub_11334+5Aj
		mov	ax, [bp+arg_10]
		mov	[bp+var_30], ax
		mov	ax, [bp+arg_E]
		mov	[bp+var_32], ax
		test	byte ptr [bp+arg_0], 8
		jnz	short loc_113C2
		mov	ax, 0Fh
		push	ax
		call	sub_20B78
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		mov	ax, 1
		push	ax
		push	ax
		call	sub_13470

loc_113C2:				; CODE XREF: sub_11334+75j
		mov	ax, word ptr [bp+arg_16]
		or	ax, word ptr [bp+arg_16+2]
		jz	short loc_113CD
		call	[bp+arg_16]

loc_113CD:				; CODE XREF: sub_11334+94j
		call	sub_232D3
		mov	[bp+var_36], 0
		jmp	loc_114F7
; ---------------------------------------------------------------------------

loc_113DA:				; CODE XREF: sub_11334+1DEj
					; sub_11334+1E9j
		cmp	[bp+var_36], 0
		jz	short loc_113EA
		call	sub_232D3
		mov	[bp+var_36], 0

loc_113EA:				; CODE XREF: sub_11334+AAj
					; sub_11334+1F2j ...
		mov	ax, [bp+var_32]
		mov	dx, [bp+var_30]
		mov	[bp+var_26], ax
		mov	[bp+var_24], dx
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_20A1B
		or	ax, ax
		jz	short loc_11457
		test	byte ptr [bp+arg_0], 2
		jnz	short loc_11421
		mov	ax, [bp+var_30]
		sub	ax, [bp+arg_10]
		add	ax, [bp+var_34]
		and	ax, [bp+var_1E]
		mov	[bp+var_20], ax
		jmp	short loc_11426
; ---------------------------------------------------------------------------

loc_11421:				; CODE XREF: sub_11334+DAj
		mov	[bp+var_20], 0

loc_11426:				; CODE XREF: sub_11334+EBj
		test	byte ptr [bp+arg_0], 1
		jnz	short loc_11437
		mov	ax, [bp+var_32]
		sub	ax, [bp+arg_E]
		mov	[bp+var_22], ax
		jmp	short loc_1143C
; ---------------------------------------------------------------------------

loc_11437:				; CODE XREF: sub_11334+F6j
		mov	[bp+var_22], 0

loc_1143C:				; CODE XREF: sub_11334+101j
		test	byte ptr [bp+arg_0], 10h
		jz	short loc_1145F
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		call	sub_1324C
		jmp	short loc_1145F
; ---------------------------------------------------------------------------

loc_11457:				; CODE XREF: sub_11334+D4j
		sub	ax, ax
		mov	[bp+var_22], ax
		mov	[bp+var_20], ax

loc_1145F:				; CODE XREF: sub_11334+10Cj
					; sub_11334+121j
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		push	word ptr [bp+arg_A+2]
		push	word ptr [bp+arg_A]
		push	[bp+var_20]
		push	[bp+var_22]
		mov	al, byte ptr [bp+arg_0]
		and	al, 4
		cmp	al, 1
		sbb	cx, cx
		neg	cx
		push	cx
		call	sub_13404
		test	byte ptr [bp+arg_0], 10h
		jnz	short loc_11496
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_0]
		call	sub_132B8

loc_11496:				; CODE XREF: sub_11334+14Fj
		les	bx, [bp+var_C]
		mov	ax, [bp+var_28]
		cmp	es:[bx+6], ax
		jnz	short loc_114AB
		mov	ax, [bp+var_2A]
		cmp	es:[bx+4], ax
		jz	short loc_114E6

loc_114AB:				; CODE XREF: sub_11334+16Cj
		test	byte ptr [bp+arg_0], 8
		jnz	short loc_114C5
		push	es
		push	bx
		mov	ax, 1
		push	ax
		push	ax
		call	sub_13470
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		call	sub_201CE

loc_114C5:				; CODE XREF: sub_11334+17Bj
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		call	sub_321A6
		mov	ax, word ptr [bp+arg_16]
		or	ax, word ptr [bp+arg_16+2]
		jz	short loc_114E6
		test	byte ptr [bp+arg_0], 8
		jz	short loc_114E6
		call	[bp+arg_16]

loc_114E6:				; CODE XREF: sub_11334+175j
					; sub_11334+1A7j ...
		mov	ax, word ptr [bp+arg_16]
		or	ax, word ptr [bp+arg_16+2]
		jz	short loc_114F7
		test	byte ptr [bp+arg_0], 8
		jnz	short loc_114F7
		call	[bp+arg_16]

loc_114F7:				; CODE XREF: sub_11334+A3j
					; sub_11334+1B8j ...
		call	sub_26F25
		or	ax, ax
		jz	short loc_1154C
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		call	sub_26E07
		mov	ax, [bp+var_30]
		cmp	[bp+var_24], ax
		jz	short loc_11515
		jmp	loc_113DA
; ---------------------------------------------------------------------------

loc_11515:				; CODE XREF: sub_11334+1DCj
		mov	ax, [bp+var_32]
		cmp	[bp+var_26], ax
		jz	short loc_11520
		jmp	loc_113DA
; ---------------------------------------------------------------------------

loc_11520:				; CODE XREF: sub_11334+1E7j
		cmp	[bp+var_36], 0
		jz	short loc_11529
		jmp	loc_113EA
; ---------------------------------------------------------------------------

loc_11529:				; CODE XREF: sub_11334+1F0j
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		mov	ax, 1B06h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_1153F
		jmp	loc_113EA
; ---------------------------------------------------------------------------

loc_1153F:				; CODE XREF: sub_11334+206j
		call	sub_232B2
		mov	[bp+var_36], 1
		jmp	loc_113EA
; ---------------------------------------------------------------------------

loc_1154C:				; CODE XREF: sub_11334+1CAj
		cmp	[bp+var_36], 0
		jnz	short loc_11557
		call	sub_232B2

loc_11557:				; CODE XREF: sub_11334+21Cj
		mov	ax, 4
		push	ax
		lea	ax, [bp+var_1C]
		push	ss
		push	ax
		call	sub_26E7B
		or	ax, ax
		jz	short loc_11575
		mov	ax, [bp+var_12]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_30], ax

loc_11575:				; CODE XREF: sub_11334+233j
		test	byte ptr [bp+arg_0], 8
		jnz	short loc_11589
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		mov	ax, 1
		push	ax
		push	ax
		call	sub_13470

loc_11589:				; CODE XREF: sub_11334+245j
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_20A1B
		or	ax, ax
		jz	short loc_115EA
		test	byte ptr [bp+arg_0], 2
		jnz	short loc_115B4
		mov	ax, [bp+var_30]
		sub	ax, [bp+arg_10]
		add	ax, [bp+var_34]
		and	ax, [bp+var_1E]
		mov	[bp+var_20], ax
		jmp	short loc_115B9
; ---------------------------------------------------------------------------

loc_115B4:				; CODE XREF: sub_11334+26Dj
		mov	[bp+var_20], 0

loc_115B9:				; CODE XREF: sub_11334+27Ej
		test	byte ptr [bp+arg_0], 1
		jnz	short loc_115CA
		mov	ax, [bp+var_32]
		sub	ax, [bp+arg_E]
		mov	[bp+var_22], ax
		jmp	short loc_115CF
; ---------------------------------------------------------------------------

loc_115CA:				; CODE XREF: sub_11334+289j
		mov	[bp+var_22], 0

loc_115CF:				; CODE XREF: sub_11334+294j
		test	byte ptr [bp+arg_0], 10h
		jz	short loc_115F2
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		call	sub_1324C
		jmp	short loc_115F2
; ---------------------------------------------------------------------------

loc_115EA:				; CODE XREF: sub_11334+267j
		sub	ax, ax
		mov	[bp+var_22], ax
		mov	[bp+var_20], ax

loc_115F2:				; CODE XREF: sub_11334+29Fj
					; sub_11334+2B4j
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	word ptr [bp+arg_A+2]
		push	word ptr [bp+arg_A]
		push	[bp+var_20]
		push	[bp+var_22]
		mov	al, byte ptr [bp+arg_0]
		and	al, 4
		cmp	al, 1
		sbb	cx, cx
		neg	cx
		push	cx
		call	sub_13404
		test	byte ptr [bp+arg_0], 10h
		jnz	short loc_1162B
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_0]
		call	sub_132B8

loc_1162B:				; CODE XREF: sub_11334+2E3j
		mov	ax, word ptr [bp+arg_16]
		or	ax, word ptr [bp+arg_16+2]
		jz	short loc_1163C
		test	byte ptr [bp+arg_0], 8
		jz	short loc_1163C
		call	[bp+arg_16]

loc_1163C:				; CODE XREF: sub_11334+2FDj
					; sub_11334+303j
		mov	word_490A0, 0
		les	bx, [bp+var_C]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_A]
		sub	ax, es:[bx+6]
		mov	dx, ax
		les	bx, [bp+var_C]
		mov	cx, es:[bx+4]
		les	bx, [bp+arg_A]
		sub	cx, es:[bx+4]
		mov	ax, cx
		mov	sp, bp
		pop	bp
		retf	1Ah
sub_11334	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11668	proc far		; CODE XREF: sub_135EB+2Fp
					; sub_14B6B+CAp ...

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	short loc_116D3
; ---------------------------------------------------------------------------

loc_116AC:				; CODE XREF: sub_11668+79j
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_C]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		call	sub_116EF

loc_116D3:				; CODE XREF: sub_11668+42j
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		or	ax, dx
		jnz	short loc_116AC
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4
sub_11668	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_116EF	proc near		; CODE XREF: sub_11668+68p
					; sub_11C58+8Fp ...

var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= byte ptr -36h
var_2E		= byte ptr -2Eh
var_26		= byte ptr -26h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 42h	; 'B'
		call	__chkstk
		push	di
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_1E], ax
		mov	word ptr [bp+var_1E+2],	dx
		les	bx, [bp+var_1E]
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_11723
		jmp	loc_11A37
; ---------------------------------------------------------------------------

loc_11723:				; CODE XREF: sub_116EF+2Fj
		push	dx
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_42]
		push	ss
		push	ax
		lea	ax, [bp+var_40]
		push	ss
		push	ax
		call	sub_1337F
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_233D4
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		call	sub_20483
		les	bx, [bp+var_1E]
		cmp	word ptr es:[bx+14h], 1
		jz	short loc_11762
		jmp	loc_118B1
; ---------------------------------------------------------------------------

loc_11762:				; CODE XREF: sub_116EF+6Ej
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_1176C
		jmp	loc_118B1
; ---------------------------------------------------------------------------

loc_1176C:				; CODE XREF: sub_116EF+78j
		sub	ax, ax
		push	ax
		call	sub_20ADE
		sub	ax, ax
		push	ax
		call	sub_20B78
		les	bx, [bp+var_1E]
		test	byte ptr es:[bx+10h], 2
		jz	short loc_11792
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_201CE
		jmp	short loc_1179C
; ---------------------------------------------------------------------------

loc_11792:				; CODE XREF: sub_116EF+95j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_203F1

loc_1179C:				; CODE XREF: sub_116EF+A1j
		les	bx, [bp+var_1E]
		les	bx, es:[bx+1Ch]
		mov	di, bx
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	[bp+var_A], cx
		mov	ax, [bp+var_C]
		mov	dx, cx
		mov	cl, 3
		shl	dx, cl
		sub	ax, dx
		sub	ax, [bp+var_10]
		shr	ax, 1
		mov	[bp+var_42], ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_12]
		sub	ax, [bp+var_1A]
		sub	ax, [bp+var_18]
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_1A]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_10]
		add	ax, [bp+var_42]
		push	ax
		mov	ax, [bp+var_12]
		add	ax, [bp+var_40]
		push	ax
		les	bx, [bp+var_1E]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		push	[bp+var_A]
		call	sub_133D5
		les	bx, [bp+var_1E]
		mov	al, es:[bx+10h]
		and	al, 3
		cmp	al, 1
		jnz	short loc_11846
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	ax, 2
		push	ax
		push	ax
		call	sub_20513
		les	bx, [bp+var_1E]
		test	byte ptr es:[bx+10h], 2
		jz	short loc_1182D
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_201CE
		jmp	short loc_11837
; ---------------------------------------------------------------------------

loc_1182D:				; CODE XREF: sub_116EF+130j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_203F1

loc_11837:				; CODE XREF: sub_116EF+13Cj
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	ax, 0FFFEh
		push	ax
		push	ax
		call	sub_20513

loc_11846:				; CODE XREF: sub_116EF+117j
		les	bx, [bp+var_1E]
		cmp	byte ptr es:[bx+11h], 0FFh
		jnz	short loc_1185D

loc_11850:				; CODE XREF: sub_116EF:loc_11981j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_23427
		jmp	loc_11A37
; ---------------------------------------------------------------------------

loc_1185D:				; CODE XREF: sub_116EF+15Fj
		les	bx, [bp+var_1E]
		cmp	byte ptr es:[bx+11h], 2
		jz	short loc_1186A
		jmp	loc_11A37
; ---------------------------------------------------------------------------

loc_1186A:				; CODE XREF: sub_116EF+176j
		mov	al, es:[bx+10h]
		and	al, 3
		cmp	al, 1
		jnz	short loc_1187E
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	ax, 3
		jmp	short loc_11886
; ---------------------------------------------------------------------------

loc_1187E:				; CODE XREF: sub_116EF+183j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		mov	ax, 1

loc_11886:				; CODE XREF: sub_116EF+18Dj
		push	ax
		push	ax
		call	sub_20513
		les	bx, [bp+var_1E]
		test	byte ptr es:[bx+10h], 2
		jz	short loc_118A4
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_205C8
		jmp	loc_11A37
; ---------------------------------------------------------------------------

loc_118A4:				; CODE XREF: sub_116EF+1A6j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_205E7
		jmp	loc_11A37
; ---------------------------------------------------------------------------

loc_118B1:				; CODE XREF: sub_116EF+70j
					; sub_116EF+7Aj
		les	bx, [bp+var_1E]
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_118C2
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_118D6

loc_118C2:				; CODE XREF: sub_116EF+1CAj
		cmp	word ptr es:[bx+14h], 3
		jz	short loc_118CC
		jmp	loc_11984
; ---------------------------------------------------------------------------

loc_118CC:				; CODE XREF: sub_116EF+1D8j
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_118D6
		jmp	loc_11984
; ---------------------------------------------------------------------------

loc_118D6:				; CODE XREF: sub_116EF+1D1j
					; sub_116EF+1E2j
		mov	ax, [bp+var_10]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_3E], ax
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_12]
		add	ax, [bp+var_3C]
		mov	[bp+var_38], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_3A], ax
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_11917
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_11917
		lea	ax, [bp+var_3E]
		push	ss
		push	ax
		push	word ptr es:[bx+12h]
		mov	al, es:[bx+11h]
		sub	ah, ah
		push	ax
		call	sub_12BA7
		jmp	short loc_1192D
; ---------------------------------------------------------------------------

loc_11917:				; CODE XREF: sub_116EF+20Aj
					; sub_116EF+211j
		lea	ax, [bp+var_3E]
		push	ss
		push	ax
		les	bx, [bp+var_1E]
		push	word ptr es:[bx+12h]
		mov	al, es:[bx+11h]
		sub	ah, ah
		push	ax
		call	sub_12C2D

loc_1192D:				; CODE XREF: sub_116EF+226j
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_12]
		sub	ax, [bp+var_1A]
		sub	ax, [bp+var_18]
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_14]
		add	ax, [bp+var_1A]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_38]
		add	ax, 8
		push	ax
		mov	ax, [bp+var_12]
		add	ax, [bp+var_40]
		push	ax
		les	bx, [bp+var_1E]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		les	bx, es:[bx+1Ch]
		mov	di, bx
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		call	sub_133D5
		les	bx, [bp+var_1E]
		cmp	byte ptr es:[bx+11h], 0FFh
		jz	short loc_11981
		jmp	loc_11A37
; ---------------------------------------------------------------------------

loc_11981:				; CODE XREF: sub_116EF+28Dj
		jmp	loc_11850
; ---------------------------------------------------------------------------

loc_11984:				; CODE XREF: sub_116EF+1DAj
					; sub_116EF+1E4j
		cmp	word ptr es:[bx+14h], 4
		jz	short loc_1198E
		jmp	loc_11A22
; ---------------------------------------------------------------------------

loc_1198E:				; CODE XREF: sub_116EF+29Aj
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11998
		jmp	loc_11A22
; ---------------------------------------------------------------------------

loc_11998:				; CODE XREF: sub_116EF+2A4j
		push	es
		push	bx
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		lea	ax, [bp+var_36]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_26]
		push	ss
		push	ax
		lea	ax, [bp+var_3E]
		push	ss
		push	ax
		call	sub_12D88
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_233FE
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		les	bx, [bp+var_1E]
		mov	al, es:[bx+10h]
		and	al, 10h
		cmp	al, 10h
		jnz	short loc_119DB
		sub	ax, ax
		jmp	short loc_119DE
; ---------------------------------------------------------------------------

loc_119DB:				; CODE XREF: sub_116EF+2E6j
		mov	ax, 2

loc_119DE:				; CODE XREF: sub_116EF+2EAj
		push	ax
		mov	al, es:[bx+11h]
		sub	ah, ah
		push	ax
		call	sub_12CA2
		lea	ax, [bp+var_36]
		push	ss
		push	ax
		les	bx, [bp+var_1E]
		mov	al, es:[bx+10h]
		and	al, 10h
		cmp	al, 10h
		jnz	short loc_11A00
		mov	ax, 1
		jmp	short loc_11A03
; ---------------------------------------------------------------------------

loc_11A00:				; CODE XREF: sub_116EF+30Aj
		mov	ax, 3

loc_11A03:				; CODE XREF: sub_116EF+30Fj
		push	ax
		mov	al, es:[bx+11h]
		sub	ah, ah
		push	ax
		call	sub_12CA2
		lea	ax, [bp+var_3E]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_26]
		push	ss
		push	ax
		call	sub_134E4
		jmp	short loc_11A37
; ---------------------------------------------------------------------------

loc_11A22:				; CODE XREF: sub_116EF+29Cj
					; sub_116EF+2A6j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		les	bx, [bp+var_1E]
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah

loc_11A37:				; CODE XREF: sub_116EF+31j
					; sub_116EF+16Bj ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		pop	di
		mov	sp, bp
		pop	bp
		retn	4
sub_116EF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11A4F	proc near		; CODE XREF: sub_11C41+10p

var_10		= byte ptr -10h
var_E		= byte ptr -0Eh
var_6		= byte ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_11AA5
		push	dx
		push	ax
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		lea	ax, [bp+var_6]
		push	ss
		push	ax
		call	sub_1337F
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		call	sub_233D4
		les	bx, [bp+var_4]
		or	byte ptr es:[bx+10h], 80h

loc_11AA5:				; CODE XREF: sub_11A4F+2Ej
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retn	4
sub_11A4F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11ABC	proc far		; CODE XREF: sub_137E6+34p
					; sub_15650+17Dp ...

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+2]
		sub	[bp+arg_6], ax
		mov	ax, es:[bx]
		sub	[bp+arg_4], ax
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	[bp+var_8], 0
		jmp	short loc_11B5C
; ---------------------------------------------------------------------------

loc_11B12:				; CODE XREF: sub_11ABC+AEj
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_10]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		call	sub_12255
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_11B5C
		les	bx, [bp+arg_8]
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		mov	ax, [bp+var_6]
		mov	[bp+var_8], ax

loc_11B5C:				; CODE XREF: sub_11ABC+54j
					; sub_11ABC+88j
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jnz	short loc_11B12
		mov	word_490A0, 0
		mov	ax, [bp+var_8]
		mov	sp, bp
		pop	bp
		retf	0Ch
sub_11ABC	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+6]
		les	bx, es:[bx]
		mov	ax, es:[bx+1Ch]
		mov	dx, es:[bx+1Eh]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		mov	sp, bp
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11BC2	proc far		; CODE XREF: sub_15481+28p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		add	ax, 8
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	es
		push	bx
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf	4
sub_11BC2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11C04	proc far		; CODE XREF: sub_137E6+13Bp
					; sub_154F5+28p

var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		mov	ax, es:[bx+12h]
		mov	[bp+var_2], ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf	4
sub_11C04	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11C41	proc far		; CODE XREF: sub_15601+28p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_11A4F
		pop	bp
		retf	4
sub_11C41	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11C58	proc far		; CODE XREF: sub_123F9+66Ap
					; sub_123F9+6F5p ...

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	al, es:[bx+11h]
		sub	ah, ah
		mov	[bp+var_6], ax
		mov	al, byte ptr [bp+arg_4]
		mov	es:[bx+11h], al
		les	bx, [bp+var_4]
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_11C9E
		jmp	loc_11D34
; ---------------------------------------------------------------------------

loc_11C9E:				; CODE XREF: sub_11C58+41j
		mov	ax, [bp+var_6]
		cmp	[bp+arg_4], ax
		jnz	short loc_11CA9
		jmp	loc_11D34
; ---------------------------------------------------------------------------

loc_11CA9:				; CODE XREF: sub_11C58+4Cj
		cmp	word ptr es:[bx+14h], 1
		jnz	short loc_11CB7
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11CE1

loc_11CB7:				; CODE XREF: sub_11C58+56j
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_11CC5
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11CE1

loc_11CC5:				; CODE XREF: sub_11C58+64j
		cmp	word ptr es:[bx+14h], 3
		jnz	short loc_11CD3
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11CE1

loc_11CD3:				; CODE XREF: sub_11C58+72j
		cmp	word ptr es:[bx+14h], 4
		jnz	short loc_11CEC
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_11CEC

loc_11CE1:				; CODE XREF: sub_11C58+5Dj
					; sub_11C58+6Bj ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_116EF
		jmp	short loc_11D34
; ---------------------------------------------------------------------------

loc_11CEC:				; CODE XREF: sub_11C58+80j
					; sub_11C58+87j
		cmp	[bp+var_6], 0FFh
		jz	short loc_11CE1
		cmp	[bp+arg_4], 0FFh
		jz	short loc_11CE1
		cmp	[bp+var_6], 0
		jz	short loc_11D17
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		sub	ax, ax
		push	ax
		push	[bp+var_6]
		push	ax
		les	bx, [bp+var_4]
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah

loc_11D17:				; CODE XREF: sub_11C58+A6j
		cmp	[bp+arg_4], 0
		jz	short loc_11D34
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		sub	ax, ax
		push	ax
		push	[bp+arg_4]
		push	ax
		les	bx, [bp+var_4]
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah

loc_11D34:				; CODE XREF: sub_11C58+43j
					; sub_11C58+4Ej ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	6
sub_11C58	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11D4B	proc far		; CODE XREF: sub_23C12+10P

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		jmp	short loc_11D9C
; ---------------------------------------------------------------------------

loc_11D7E:				; CODE XREF: sub_11D4B+D8j
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	short loc_11D96
; ---------------------------------------------------------------------------

loc_11D8B:				; CODE XREF: sub_11D4B+93j
					; sub_11D4B+A1j ...
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1AEAD

loc_11D96:				; CODE XREF: sub_11D4B+3Ej
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_11D9C:				; CODE XREF: sub_11D4B+31j
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jnz	short loc_11DA9
		jmp	loc_11E29
; ---------------------------------------------------------------------------

loc_11DA9:				; CODE XREF: sub_11D4B+59j
		push	dx
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		cmp	word ptr es:[bx+14h], 1
		jnz	short loc_11DE0
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11D8B

loc_11DE0:				; CODE XREF: sub_11D4B+8Cj
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_11DEE
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11D8B

loc_11DEE:				; CODE XREF: sub_11D4B+9Aj
		cmp	word ptr es:[bx+14h], 3
		jnz	short loc_11DFC
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11D8B

loc_11DFC:				; CODE XREF: sub_11D4B+A8j
		cmp	word ptr es:[bx+14h], 4
		jnz	short loc_11E0A
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_11D8B

loc_11E0A:				; CODE XREF: sub_11D4B+B6j
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 4
		push	ax
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah
		or	ax, ax
		jz	short loc_11E26
		jmp	loc_11D7E
; ---------------------------------------------------------------------------

loc_11E26:				; CODE XREF: sub_11D4B+D6j
		jmp	loc_11D8B
; ---------------------------------------------------------------------------

loc_11E29:				; CODE XREF: sub_11D4B+5Bj
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4
sub_11D4B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_11E4D	proc far		; CODE XREF: sub_13524+2Ep
					; sub_13524+63p ...

var_1A		= byte ptr -1Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah
arg_16		= word ptr  1Ch
arg_18		= dword	ptr  1Eh

		push	bp
		mov	bp, sp
		mov	ax, 1Ah
		call	__chkstk
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_11E73
		jmp	loc_11F4A
; ---------------------------------------------------------------------------

loc_11E73:				; CODE XREF: sub_11E4D+21j
		mov	ax, 24h	; '$'
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		and	ax, 0Fh
		or	al, 8
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, word ptr [bp+arg_18]
		mov	dx, word ptr [bp+arg_18+2]
		mov	es:[bx+4], ax
		mov	es:[bx+6], dx
		push	[bp+arg_16]
		push	[bp+arg_14]
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_321A6
		les	bx, [bp+var_4]
		mov	al, [bp+arg_E]
		mov	es:[bx+10h], al
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx+11h], 0
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_C]
		mov	es:[bx+12h], ax
		les	bx, [bp+var_4]
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	es:[bx+14h], ax
		mov	es:[bx+16h], dx
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx+20h], ax
		mov	es:[bx+22h], dx
		cmp	word ptr [bp+arg_4], 1
		jnz	short loc_11F50
		cmp	word ptr [bp+arg_4+2], 0
		jnz	short loc_11F50
		les	bx, [bp+var_4]
		mov	al, es:[bx+10h]
		and	al, 3
		cmp	al, 1
		jnz	short loc_11F37
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		mov	ax, 0FFFEh
		push	ax
		push	ax
		call	sub_20513

loc_11F37:				; CODE XREF: sub_11E4D+D5j
					; sub_11E4D+10Dj ...
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_10]
		mov	dx, [bp+arg_12]

loc_11F40:				; CODE XREF: sub_11E4D+130j
		mov	es:[bx+1Ch], ax
		mov	es:[bx+1Eh], dx
		jmp	short loc_11FA8
; ---------------------------------------------------------------------------

loc_11F4A:				; CODE XREF: sub_11E4D+23j
		sub	ax, ax
		cwd
		jmp	loc_12001
; ---------------------------------------------------------------------------

loc_11F50:				; CODE XREF: sub_11E4D+C2j
					; sub_11E4D+C8j
		cmp	word ptr [bp+arg_4], 2
		jnz	short loc_11F5C
		cmp	word ptr [bp+arg_4+2], 0
		jz	short loc_11F37

loc_11F5C:				; CODE XREF: sub_11E4D+107j
		cmp	word ptr [bp+arg_4], 3
		jnz	short loc_11F68
		cmp	word ptr [bp+arg_4+2], 0
		jz	short loc_11F37

loc_11F68:				; CODE XREF: sub_11E4D+113j
		cmp	word ptr [bp+arg_4], 4
		jnz	short loc_11F7F
		cmp	word ptr [bp+arg_4+2], 0
		jnz	short loc_11F7F
		les	bx, [bp+var_4]
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_A]
		jmp	short loc_11F40
; ---------------------------------------------------------------------------

loc_11F7F:				; CODE XREF: sub_11E4D+11Fj
					; sub_11E4D+125j
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_10]
		mov	dx, [bp+arg_12]
		mov	es:[bx+1Ch], ax
		mov	es:[bx+1Eh], dx
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_A]
		push	dx
		push	ax
		mov	ax, 3
		push	ax
		call	[bp+arg_4]
		add	sp, 0Ah

loc_11FA8:				; CODE XREF: sub_11E4D+FBj
		push	word ptr [bp+arg_18+2]
		push	word ptr [bp+arg_18]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_18]
		les	bx, es:[bx]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_18]
		les	bx, es:[bx]
		mov	ax, word ptr [bp+var_8]
		mov	dx, word ptr [bp+var_8+2]
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		push	word ptr [bp+arg_18+2]
		push	word ptr [bp+arg_18]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, word ptr [bp+var_8]
		mov	dx, word ptr [bp+var_8+2]

loc_12001:				; CODE XREF: sub_11E4D+100j
		mov	sp, bp
		pop	bp
		retf	1Ch
sub_11E4D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_12007	proc far		; CODE XREF: sub_21E98+D4P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+14h], 1
		jnz	short loc_1203E
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_120BA

loc_1203E:				; CODE XREF: sub_12007+2Ej
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_1204C
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_120BA

loc_1204C:				; CODE XREF: sub_12007+3Cj
		cmp	word ptr es:[bx+14h], 3
		jnz	short loc_1205A
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_120BA

loc_1205A:				; CODE XREF: sub_12007+4Aj
		cmp	word ptr es:[bx+14h], 4
		jnz	short loc_1209E
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_1209E
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_12075
		mov	ax, es:[bx+1Ch]
		mov	[bp+arg_4], ax

loc_12075:				; CODE XREF: sub_12007+65j
		cmp	[bp+arg_6], 0FFFFh
		jnz	short loc_12082
		mov	ax, es:[bx+1Eh]
		mov	[bp+arg_6], ax

loc_12082:				; CODE XREF: sub_12007+72j
		les	bx, [bp+var_4]
		mov	dx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		mov	es:[bx+1Ch], ax
		mov	es:[bx+1Eh], dx
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_131B4
		jmp	short loc_120BA
; ---------------------------------------------------------------------------

loc_1209E:				; CODE XREF: sub_12007+58j
					; sub_12007+5Fj
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		mov	dx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		push	dx
		push	ax
		mov	ax, 0Ah
		push	ax
		les	bx, [bp+var_4]
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah

loc_120BA:				; CODE XREF: sub_12007+35j
					; sub_12007+43j ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	8
sub_12007	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_120D1	proc far		; CODE XREF: sub_1408E+1Cp
					; sub_15BD2+2Bp ...

var_12		= byte ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 12h
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+12h]
		mov	[bp+var_E], ax
		mov	ax, [bp+arg_4]
		mov	es:[bx+12h], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+14h], 1
		jnz	short loc_1212F
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_1212F
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_12123
		jmp	loc_121E4
; ---------------------------------------------------------------------------

loc_12123:				; CODE XREF: sub_120D1+4Dj
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_116EF
		jmp	loc_121E4
; ---------------------------------------------------------------------------

loc_1212F:				; CODE XREF: sub_120D1+3Fj
					; sub_120D1+46j
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_12140
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_1214E

loc_12140:				; CODE XREF: sub_120D1+66j
		cmp	word ptr es:[bx+14h], 3
		jnz	short loc_121AC
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_121AC

loc_1214E:				; CODE XREF: sub_120D1+6Dj
		push	es
		push	bx
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_1337F
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_C]
		add	ax, [bp+var_A]
		mov	[bp+var_6], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_12194
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_12194
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		push	word ptr es:[bx+12h]
		mov	al, es:[bx+11h]
		sub	ah, ah
		push	ax
		call	sub_12BA7
		jmp	short loc_121E4
; ---------------------------------------------------------------------------

loc_12194:				; CODE XREF: sub_120D1+A5j
					; sub_120D1+ACj
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		les	bx, [bp+var_4]
		push	word ptr es:[bx+12h]
		mov	al, es:[bx+11h]
		sub	ah, ah
		push	ax
		call	sub_12C2D
		jmp	short loc_121E4
; ---------------------------------------------------------------------------

loc_121AC:				; CODE XREF: sub_120D1+74j
					; sub_120D1+7Bj
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+14h], 4
		jnz	short loc_121C8
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_121C8
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_131B4
		jmp	short loc_121E4
; ---------------------------------------------------------------------------

loc_121C8:				; CODE XREF: sub_120D1+E3j
					; sub_120D1+EAj
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		mov	dx, [bp+var_E]
		mov	ax, [bp+arg_4]
		push	dx
		push	ax
		mov	ax, 9
		push	ax
		les	bx, [bp+var_4]
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah

loc_121E4:				; CODE XREF: sub_120D1+4Fj
					; sub_120D1+5Bj ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	6
sub_120D1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_121FB	proc far		; CODE XREF: sub_15C06+28p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_1223E
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		jmp	short loc_1224F
; ---------------------------------------------------------------------------

loc_1223E:				; CODE XREF: sub_121FB+2Ej
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+10h], 7Fh
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_116EF

loc_1224F:				; CODE XREF: sub_121FB+41j
		mov	sp, bp
		pop	bp
		retf	4
sub_121FB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_12255	proc near		; CODE XREF: sub_11ABC+80p
					; sub_123F9+85p ...

var_32		= byte ptr -32h
var_2A		= byte ptr -2Ah
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= byte ptr -1Eh
var_16		= byte ptr -16h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= byte ptr -8
arg_0		= dword	ptr  4
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 32h	; '2'
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_E], ax
		mov	word ptr [bp+var_E+2], dx
		mov	ax, [bp+arg_6]
		mov	[bp+var_20], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_22], ax
		les	bx, [bp+var_E]
		cmp	byte ptr es:[bx+11h], 0FFh
		jnz	short loc_12294
		jmp	loc_123DA
; ---------------------------------------------------------------------------

loc_12294:				; CODE XREF: sub_12255+3Aj
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_1229E
		jmp	loc_123DA
; ---------------------------------------------------------------------------

loc_1229E:				; CODE XREF: sub_12255+44j
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		mov	ax, bx
		add	ax, 8
		push	dx
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_122B6
		jmp	loc_123DA
; ---------------------------------------------------------------------------

loc_122B6:				; CODE XREF: sub_12255+5Cj
		les	bx, [bp+var_E]
		cmp	word ptr es:[bx+14h], 1
		jnz	short loc_122CF
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_122CF
		mov	[bp+var_A], 2
		jmp	loc_123DF
; ---------------------------------------------------------------------------

loc_122CF:				; CODE XREF: sub_12255+69j
					; sub_12255+70j
		cmp	word ptr es:[bx+14h], 2
		jnz	short loc_122E5
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_122E5
		mov	[bp+var_A], 3
		jmp	loc_123DF
; ---------------------------------------------------------------------------

loc_122E5:				; CODE XREF: sub_12255+7Fj
					; sub_12255+86j
		cmp	word ptr es:[bx+14h], 3
		jnz	short loc_122FB
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_122FB
		mov	[bp+var_A], 4
		jmp	loc_123DF
; ---------------------------------------------------------------------------

loc_122FB:				; CODE XREF: sub_12255+95j
					; sub_12255+9Cj
		cmp	word ptr es:[bx+14h], 4
		jz	short loc_12305
		jmp	loc_123B9
; ---------------------------------------------------------------------------

loc_12305:				; CODE XREF: sub_12255+ABj
		cmp	word ptr es:[bx+16h], 0
		jz	short loc_1230F
		jmp	loc_123B9
; ---------------------------------------------------------------------------

loc_1230F:				; CODE XREF: sub_12255+B5j
		push	es
		push	bx
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		lea	ax, [bp+var_1E]
		push	ss
		push	ax
		lea	ax, [bp+var_2A]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		call	sub_12D88
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		lea	ax, [bp+var_1E]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_12351
		mov	[bp+var_A], 5
		jmp	loc_123DF
; ---------------------------------------------------------------------------

loc_12351:				; CODE XREF: sub_12255+F2j
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		lea	ax, [bp+var_2A]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_1236B
		mov	[bp+var_A], 6
		jmp	short loc_123DF
; ---------------------------------------------------------------------------

loc_1236B:				; CODE XREF: sub_12255+10Dj
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_12385
		mov	[bp+var_A], 7
		jmp	short loc_123DF
; ---------------------------------------------------------------------------

loc_12385:				; CODE XREF: sub_12255+127j
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_1239F
		mov	[bp+var_A], 8
		jmp	short loc_123DF
; ---------------------------------------------------------------------------

loc_1239F:				; CODE XREF: sub_12255+141j
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_123DA
		mov	[bp+var_A], 81h	; '�'
		jmp	short loc_123DF
; ---------------------------------------------------------------------------

loc_123B9:				; CODE XREF: sub_12255+ADj
					; sub_12255+B7j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		mov	dx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		push	dx
		push	ax
		mov	ax, 2
		push	ax
		les	bx, [bp+var_E]
		call	dword ptr es:[bx+14h]
		add	sp, 0Ah
		mov	[bp+var_A], ax
		jmp	short loc_123DF
; ---------------------------------------------------------------------------

loc_123DA:				; CODE XREF: sub_12255+3Cj
					; sub_12255+46j ...
		mov	[bp+var_A], 0

loc_123DF:				; CODE XREF: sub_12255+77j
					; sub_12255+8Dj ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, [bp+var_A]
		mov	sp, bp
		pop	bp
		retn	8
sub_12255	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_123F9	proc far		; CODE XREF: sub_137E6+9Ep
					; sub_137E6+12Cp ...

var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= byte ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= byte ptr -62h
var_60		= word ptr -60h
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= byte ptr -46h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= byte ptr -3Ah
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, 7Ah	; 'z'
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_2A], ax
		mov	word ptr [bp+var_2A+2],	dx
		push	dx
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_7A]
		push	ss
		push	ax
		lea	ax, [bp+var_6A]
		push	ss
		push	ax
		call	sub_1337F
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_321A6
		les	bx, [bp+var_2A]
		mov	al, es:[bx+10h]
		mov	[bp+var_6C], al
		mov	ax, es:[bx+12h]
		mov	[bp+var_A], ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+arg_A]
		mov	[bp+var_64], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_66], ax
		mov	ax, [bp+arg_A]
		sub	ax, [bp+var_7A]
		push	ax
		mov	ax, [bp+arg_8]
		sub	ax, [bp+var_6A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_12255
		mov	[bp+var_26], ax
		cmp	ax, 4
		jbe	short loc_1248C
		jmp	loc_12B32
; ---------------------------------------------------------------------------

loc_1248C:				; CODE XREF: sub_123F9+8Ej
		cmp	ax, 3
		jb	short loc_12494
		jmp	loc_125E3
; ---------------------------------------------------------------------------

loc_12494:				; CODE XREF: sub_123F9+96j
		or	ax, ax
		jnz	short loc_1249B
		jmp	loc_12B29
; ---------------------------------------------------------------------------

loc_1249B:				; CODE XREF: sub_123F9+9Dj
		cmp	ax, 2
		jz	short loc_124A3
		jmp	loc_12B54
; ---------------------------------------------------------------------------

loc_124A3:				; CODE XREF: sub_123F9+A5j
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		mov	ax, 1
		push	ax
		push	ax
		call	sub_20513
		mov	al, [bp+var_6C]
		and	al, 3
		cmp	al, 1
		jnz	short loc_124CA
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		mov	ax, 2
		push	ax
		push	ax
		call	sub_20513

loc_124CA:				; CODE XREF: sub_123F9+C0j
		mov	[bp+var_78], 1
		test	[bp+var_6C], 2
		jz	short loc_124E1
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_205C8
		jmp	short loc_124EB
; ---------------------------------------------------------------------------

loc_124E1:				; CODE XREF: sub_123F9+DAj
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_205E7

loc_124EB:				; CODE XREF: sub_123F9+E6j
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_1252A
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	[bp+var_26]
		jmp	short loc_12524
; ---------------------------------------------------------------------------

loc_124FE:				; CODE XREF: sub_123F9+17Bj
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_205E7

loc_12508:				; CODE XREF: sub_123F9+164j
					; sub_123F9+16Aj ...
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_1252A
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		cmp	[bp+var_5A], 0
		jz	short loc_12521
		mov	ax, [bp+var_26]
		jmp	short loc_12523
; ---------------------------------------------------------------------------

loc_12521:				; CODE XREF: sub_123F9+121j
		sub	ax, ax

loc_12523:				; CODE XREF: sub_123F9+126j
		push	ax

loc_12524:				; CODE XREF: sub_123F9+103j
		call	[bp+arg_4]
		add	sp, 6

loc_1252A:				; CODE XREF: sub_123F9+F8j
					; sub_123F9+115j
		call	sub_26F25
		or	ax, ax
		jz	short loc_12582
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		call	sub_26E07
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_20A1B
		mov	[bp+var_5A], ax
		or	ax, ax
		jz	short loc_12559
		cmp	[bp+var_78], 0
		jz	short loc_12565

loc_12559:				; CODE XREF: sub_123F9+158j
		cmp	[bp+var_5A], 0
		jnz	short loc_12508
		cmp	[bp+var_78], 0
		jz	short loc_12508

loc_12565:				; CODE XREF: sub_123F9+15Ej
		cmp	[bp+var_78], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_78], ax
		test	[bp+var_6C], 2
		jz	short loc_124FE
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_205C8
		jmp	short loc_12508
; ---------------------------------------------------------------------------

loc_12582:				; CODE XREF: sub_123F9+138j
		mov	ax, 4
		push	ax
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		call	sub_26E7B
		or	ax, ax
		jz	short loc_125A0
		mov	ax, [bp+var_1A]
		mov	[bp+var_66], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_64], ax

loc_125A0:				; CODE XREF: sub_123F9+199j
		cmp	[bp+var_78], 0
		jz	short loc_125C2
		test	[bp+var_6C], 2
		jz	short loc_125B8
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_205C8
		jmp	short loc_125C2
; ---------------------------------------------------------------------------

loc_125B8:				; CODE XREF: sub_123F9+1B1j
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		call	sub_205E7

loc_125C2:				; CODE XREF: sub_123F9+1ABj
					; sub_123F9+1BDj
		mov	word_490A0, 0
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_125DE
		jmp	loc_12A31
; ---------------------------------------------------------------------------

loc_125DE:				; CODE XREF: sub_123F9+1E0j
					; sub_123F9+635j ...
		sub	ax, ax
		jmp	loc_12BA1
; ---------------------------------------------------------------------------

loc_125E3:				; CODE XREF: sub_123F9+98j
		cmp	[bp+var_26], 3
		jnz	short loc_125F0
		mov	[bp+var_54], 2BA7h
		jmp	short loc_125F5
; ---------------------------------------------------------------------------

loc_125F0:				; CODE XREF: sub_123F9+1EEj
		mov	[bp+var_54], 2C2Dh

loc_125F5:				; CODE XREF: sub_123F9+1F5j
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_12]
		add	ax, [bp+var_60]
		mov	[bp+var_5C], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_78], ax
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		push	[bp+var_A]
		push	[bp+var_78]
		call	word ptr [bp-54h]
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_12631
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	[bp+var_26]
		jmp	short loc_1262B
; ---------------------------------------------------------------------------

loc_12628:				; CODE XREF: sub_123F9+29Cj
		sub	ax, ax

loc_1262A:				; CODE XREF: sub_123F9+2A1j
		push	ax

loc_1262B:				; CODE XREF: sub_123F9+22Dj
		call	[bp+arg_4]
		add	sp, 6

loc_12631:				; CODE XREF: sub_123F9+222j
					; sub_123F9+290j
		call	sub_26F25
		or	ax, ax
		jz	short loc_1269C
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		call	sub_26E07
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_20A1B
		mov	[bp+var_5A], ax
		or	ax, ax
		jz	short loc_12660
		cmp	[bp+var_78], 0
		jz	short loc_1266C

loc_12660:				; CODE XREF: sub_123F9+25Fj
		cmp	[bp+var_5A], 0
		jnz	short loc_12683
		cmp	[bp+var_78], 0
		jz	short loc_12683

loc_1266C:				; CODE XREF: sub_123F9+265j
		mov	ax, [bp+var_26]
		sub	ax, [bp+var_78]
		mov	[bp+var_78], ax
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		push	[bp+var_A]
		push	[bp+var_78]
		call	word ptr [bp-54h]

loc_12683:				; CODE XREF: sub_123F9+26Bj
					; sub_123F9+271j
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_12631
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		cmp	[bp+var_5A], 0
		jz	short loc_12628
		mov	ax, [bp+var_26]
		jmp	short loc_1262A
; ---------------------------------------------------------------------------

loc_1269C:				; CODE XREF: sub_123F9+23Fj
		mov	ax, 4
		push	ax
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		call	sub_26E7B
		or	ax, ax
		jz	short loc_126BA
		mov	ax, [bp+var_1A]
		mov	[bp+var_66], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_64], ax

loc_126BA:				; CODE XREF: sub_123F9+2B3j
		cmp	[bp+var_78], 0
		jz	short loc_126CE
		lea	ax, [bp+var_62]
		push	ss
		push	ax
		push	[bp+var_A]
		sub	ax, ax
		push	ax
		call	word ptr [bp-54h]

loc_126CE:				; CODE XREF: sub_123F9+2C5j
		mov	word_490A0, 0
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax

loc_126DE:				; CODE XREF: sub_123F9+447j
		call	sub_20A1B
		or	ax, ax
		jmp	loc_12A2C
; ---------------------------------------------------------------------------

loc_126E8:				; CODE XREF: sub_123F9+743j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_3A]
		push	ss
		push	ax
		lea	ax, [bp+var_46]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		lea	ax, [bp+var_76]
		push	ss
		push	ax
		call	sub_12D88
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_26], 5
		jnz	short loc_12747
		mov	al, [bp+var_6C]
		and	al, 10h
		cmp	al, 10h
		jnz	short loc_1273C
		sub	ax, ax
		jmp	short loc_1273F
; ---------------------------------------------------------------------------

loc_1273C:				; CODE XREF: sub_123F9+33Dj
		mov	ax, 2

loc_1273F:				; CODE XREF: sub_123F9+341j
		mov	[bp+var_68], ax
		lea	ax, [bp+var_3A]
		jmp	short loc_1275E
; ---------------------------------------------------------------------------

loc_12747:				; CODE XREF: sub_123F9+334j
		mov	al, [bp+var_6C]
		and	al, 10h
		cmp	al, 10h
		jnz	short loc_12755
		mov	ax, 1
		jmp	short loc_12758
; ---------------------------------------------------------------------------

loc_12755:				; CODE XREF: sub_123F9+355j
		mov	ax, 3

loc_12758:				; CODE XREF: sub_123F9+35Aj
		mov	[bp+var_68], ax
		lea	ax, [bp+var_46]

loc_1275E:				; CODE XREF: sub_123F9+34Cj
		mov	[bp+var_52], ax
		mov	[bp+var_50], ss
		mov	ax, [bp+var_26]
		mov	[bp+var_78], ax
		push	ss
		push	[bp+var_52]
		push	[bp+var_68]
		push	ax
		call	sub_12CA2
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_12791
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	[bp+var_26]
		jmp	short loc_1278B
; ---------------------------------------------------------------------------

loc_12788:				; CODE XREF: sub_123F9+3FCj
		sub	ax, ax

loc_1278A:				; CODE XREF: sub_123F9+401j
		push	ax

loc_1278B:				; CODE XREF: sub_123F9+38Dj
		call	[bp+arg_4]
		add	sp, 6

loc_12791:				; CODE XREF: sub_123F9+382j
					; sub_123F9+3F0j
		call	sub_26F25
		or	ax, ax
		jz	short loc_127FC
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		call	sub_26E07
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		push	[bp+var_50]
		push	[bp+var_52]
		call	sub_20A1B
		mov	[bp+var_5A], ax
		or	ax, ax
		jz	short loc_127C1
		cmp	[bp+var_78], 0
		jz	short loc_127CD

loc_127C1:				; CODE XREF: sub_123F9+3C0j
		cmp	[bp+var_5A], 0
		jnz	short loc_127E3
		cmp	[bp+var_78], 0
		jz	short loc_127E3

loc_127CD:				; CODE XREF: sub_123F9+3C6j
		mov	ax, [bp+var_26]
		sub	ax, [bp+var_78]
		mov	[bp+var_78], ax
		push	[bp+var_50]
		push	[bp+var_52]
		push	[bp+var_68]
		push	ax
		call	sub_12CA2

loc_127E3:				; CODE XREF: sub_123F9+3CCj
					; sub_123F9+3D2j
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_12791
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		cmp	[bp+var_5A], 0
		jz	short loc_12788
		mov	ax, [bp+var_26]
		jmp	short loc_1278A
; ---------------------------------------------------------------------------

loc_127FC:				; CODE XREF: sub_123F9+39Fj
		mov	ax, 4
		push	ax
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		call	sub_26E7B
		or	ax, ax
		jz	short loc_1281A
		mov	ax, [bp+var_1A]
		mov	[bp+var_66], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_64], ax

loc_1281A:				; CODE XREF: sub_123F9+413j
		cmp	[bp+var_78], 0
		jz	short loc_1282F
		push	[bp+var_50]
		push	[bp+var_52]
		push	[bp+var_68]
		sub	ax, ax
		push	ax
		call	sub_12CA2

loc_1282F:				; CODE XREF: sub_123F9+425j
		mov	word_490A0, 0
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		push	[bp+var_50]
		push	[bp+var_52]
		jmp	loc_126DE
; ---------------------------------------------------------------------------

loc_12843:				; CODE XREF: sub_123F9+750j
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_1285A
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	[bp+var_26]
		call	[bp+arg_4]
		add	sp, 6

loc_1285A:				; CODE XREF: sub_123F9+450j
					; sub_123F9:loc_12866j
		call	sub_26F25
		or	ax, ax
		jnz	short loc_12866
		jmp	loc_12A31
; ---------------------------------------------------------------------------

loc_12866:				; CODE XREF: sub_123F9+468j
		jmp	short loc_1285A
; ---------------------------------------------------------------------------

loc_12868:				; CODE XREF: sub_123F9+758j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_3A]
		push	ss
		push	ax
		lea	ax, [bp+var_46]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		lea	ax, [bp+var_76]
		push	ss
		push	ax
		call	sub_12D88
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_2C]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2E]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_30], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_32], ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		mov	ax, 0FFE2h
		push	ax
		push	ax
		call	sub_20513
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 1B40h
		push	ds
		push	ax
		push	[bp+arg_A]
		push	[bp+arg_8]
		lea	ax, [bp+var_76]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		sub	ax, ax
		push	ax
		push	cs
		call	near ptr sub_11334
		mov	[bp+var_58], ax
		mov	[bp+var_56], dx
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_2A], ax
		mov	word ptr [bp+var_2A+2],	dx
		les	bx, [bp+var_2A]
		mov	ax, es:[bx+1Eh]
		sub	dx, dx
		sub	ax, es:[bx+1Ch]
		sbb	dx, dx
		mov	[bp+var_3E], ax
		mov	[bp+var_3C], dx
		mov	al, es:[bx+10h]
		and	al, 10h
		cmp	al, 10h
		jnz	short loc_1295C
		mov	al, 10h
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		call	unknown_libname_4 ; MS Quick C v1.0/v2.01 & MSC	v5.1 DOS run-time & graphic
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_6]
		sub	ax, [bp+var_70]
		add	ax, [bp+var_74]
		cwd
		mov	[bp+var_4E], ax
		mov	[bp+var_4C], dx
		mov	ax, [bp+var_74]
		sub	ax, [bp+var_6]
		jmp	short loc_1297C
; ---------------------------------------------------------------------------

loc_1295C:				; CODE XREF: sub_123F9+53Aj
		mov	ax, [bp+var_58]
		cwd
		mov	[bp+var_56], dx
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		sub	ax, [bp+var_72]
		add	ax, [bp+var_76]
		cwd
		mov	[bp+var_4E], ax
		mov	[bp+var_4C], dx
		mov	ax, [bp+var_76]
		sub	ax, [bp+var_8]

loc_1297C:				; CODE XREF: sub_123F9+561j
		cwd
		add	ax, [bp+var_58]
		adc	dx, [bp+var_56]
		mov	[bp+var_4A], ax
		mov	[bp+var_48], dx
		mov	ax, [bp+var_4E]
		or	ax, [bp+var_4C]
		jz	short loc_129DF
		push	[bp+var_4C]
		push	[bp+var_4E]
		push	[bp+var_3C]
		push	[bp+var_3E]
		push	dx
		push	[bp+var_4A]
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		les	bx, [bp+var_2A]
		mov	es:[bx+12h], ax
		push	[bp+var_4C]
		push	[bp+var_4E]
		push	[bp+var_3C]
		push	[bp+var_3E]
		push	[bp+var_48]
		push	[bp+var_4A]
		call	__aFlmul
		push	dx
		push	ax
		call	__aFlrem
		or	dx, ax
		jz	short loc_129E8
		les	bx, [bp+var_2A]
		inc	word ptr es:[bx+12h]
		jmp	short loc_129E8
; ---------------------------------------------------------------------------

loc_129DF:				; CODE XREF: sub_123F9+596j
		les	bx, [bp+var_2A]
		mov	word ptr es:[bx+12h], 0

loc_129E8:				; CODE XREF: sub_123F9+5DBj
					; sub_123F9+5E4j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_131B4
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_12A20
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		mov	ax, [bp+var_58]
		or	ax, [bp+var_56]
		jz	short loc_12A17
		mov	ax, [bp+var_26]
		jmp	short loc_12A19
; ---------------------------------------------------------------------------

loc_12A17:				; CODE XREF: sub_123F9+617j
		sub	ax, ax

loc_12A19:				; CODE XREF: sub_123F9+61Cj
		push	ax
		call	[bp+arg_4]
		add	sp, 6

loc_12A20:				; CODE XREF: sub_123F9+609j
		mov	word_490A0, 0
		mov	ax, [bp+var_58]
		or	ax, [bp+var_56]

loc_12A2C:				; CODE XREF: sub_123F9+2ECj
		jnz	short loc_12A31
		jmp	loc_125DE
; ---------------------------------------------------------------------------

loc_12A31:				; CODE XREF: sub_123F9+1E2j
					; sub_123F9+46Aj ...
		mov	ax, [bp+var_26]
		jmp	loc_12BA1
; ---------------------------------------------------------------------------

loc_12A37:				; CODE XREF: sub_123F9+6BEj
		sub	ax, ax

loc_12A39:				; CODE XREF: sub_123F9+6C4j
		mov	[bp+var_5A], ax
		or	ax, ax
		jz	short loc_12A46
		cmp	[bp+var_78], 0
		jz	short loc_12A52

loc_12A46:				; CODE XREF: sub_123F9+645j
		cmp	[bp+var_5A], 0
		jnz	short loc_12A66
		cmp	[bp+var_78], 0
		jz	short loc_12A66

loc_12A52:				; CODE XREF: sub_123F9+64Bj
		mov	ax, [bp+var_26]
		sub	ax, [bp+var_78]
		mov	[bp+var_78], ax
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_11C58

loc_12A66:				; CODE XREF: sub_123F9+651j
					; sub_123F9+657j
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jz	short loc_12A88
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		cmp	[bp+var_5A], 0
		jz	short loc_12A7F
		mov	ax, [bp+var_26]
		jmp	short loc_12A81
; ---------------------------------------------------------------------------

loc_12A7F:				; CODE XREF: sub_123F9+67Fj
		sub	ax, ax

loc_12A81:				; CODE XREF: sub_123F9+684j
		push	ax

loc_12A82:				; CODE XREF: sub_123F9+7A5j
		call	[bp+arg_4]
		add	sp, 6

loc_12A88:				; CODE XREF: sub_123F9+673j
					; sub_123F9+799j
		call	sub_26F25
		or	ax, ax
		jz	short loc_12AC0
		lea	ax, [bp+var_66]
		push	ss
		push	ax
		call	sub_26E07
		mov	ax, [bp+var_64]
		sub	ax, [bp+var_7A]
		push	ax
		mov	ax, [bp+var_66]
		sub	ax, [bp+var_6A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_12255
		cmp	ax, [bp+var_26]
		jz	short loc_12ABA
		jmp	loc_12A37
; ---------------------------------------------------------------------------

loc_12ABA:				; CODE XREF: sub_123F9+6BCj
		mov	ax, 1
		jmp	loc_12A39
; ---------------------------------------------------------------------------

loc_12AC0:				; CODE XREF: sub_123F9+696j
		mov	ax, 4
		push	ax
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		call	sub_26E7B
		or	ax, ax
		jz	short loc_12ADE
		mov	ax, [bp+var_1A]
		mov	[bp+var_66], ax
		mov	ax, [bp+var_18]
		mov	[bp+var_64], ax

loc_12ADE:				; CODE XREF: sub_123F9+6D7j
		cmp	[bp+var_78], 0
		jz	short loc_12AF1
		sub	ax, ax
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_11C58

loc_12AF1:				; CODE XREF: sub_123F9+6E9j
		mov	ax, [bp+var_64]
		sub	ax, [bp+var_7A]
		push	ax
		mov	ax, [bp+var_66]
		sub	ax, [bp+var_6A]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_12255
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		cmp	[bp+var_14], ax
		jnz	short loc_12B1C
		mov	word_490A0, 0
		jmp	loc_12A31
; ---------------------------------------------------------------------------

loc_12B1C:				; CODE XREF: sub_123F9+718j
		push	[bp+var_6E]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_11C58

loc_12B29:				; CODE XREF: sub_123F9+9Fj
		mov	word_490A0, 0
		jmp	loc_125DE
; ---------------------------------------------------------------------------

loc_12B32:				; CODE XREF: sub_123F9+90j
		cmp	ax, 5
		jb	short loc_12B54
		cmp	ax, 6
		ja	short loc_12B3F
		jmp	loc_126E8
; ---------------------------------------------------------------------------

loc_12B3F:				; CODE XREF: sub_123F9+741j
		cmp	ax, 7
		jb	short loc_12B54
		cmp	ax, 8
		ja	short loc_12B4C
		jmp	loc_12843
; ---------------------------------------------------------------------------

loc_12B4C:				; CODE XREF: sub_123F9+74Ej
		cmp	ax, 81h	; '�'
		jnz	short loc_12B54
		jmp	loc_12868
; ---------------------------------------------------------------------------

loc_12B54:				; CODE XREF: sub_123F9+A7j
					; sub_123F9+73Cj ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		mov	al, es:[bx+11h]
		sub	ah, ah
		mov	[bp+var_6E], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_78], ax
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_11C58
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		jnz	short loc_12B95
		jmp	loc_12A88
; ---------------------------------------------------------------------------

loc_12B95:				; CODE XREF: sub_123F9+797j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	[bp+var_26]
		jmp	loc_12A82
; ---------------------------------------------------------------------------

loc_12BA1:				; CODE XREF: sub_123F9+1E7j
					; sub_123F9+63Bj
		mov	sp, bp
		pop	bp
		retf	0Ch
sub_123F9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_12BA7	proc near		; CODE XREF: sub_116EF+223p
					; sub_120D1+BEp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_233D4
		sub	ax, ax
		push	ax
		call	sub_20B78
		cmp	[bp+arg_2], 0
		jz	short loc_12C0A
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, es:[bx+6]
		dec	ax
		push	ax
		mov	ax, es:[bx+4]
		dec	ax
		push	ax
		call	sub_234D7
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		mov	ax, es:[bx+4]
		dec	ax
		push	ax
		mov	ax, es:[bx+6]
		dec	ax
		push	ax
		push	word ptr es:[bx]
		call	sub_234D7

loc_12C0A:				; CODE XREF: sub_12BA7+2Bj
		cmp	[bp+arg_0], 3
		jnz	short loc_12C1E
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		mov	ax, 1
		push	ax
		push	ax
		call	sub_134A3

loc_12C1E:				; CODE XREF: sub_12BA7+67j
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_201CE
		pop	bp
		retn	8
sub_12BA7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_12C2D	proc near		; CODE XREF: sub_116EF+23Bp
					; sub_120D1+D6p

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		lea	ax, [bp+var_A]
		push	ss
		push	ax
		call	sub_321A6
		mov	ax, [bp+var_8]
		add	ax, 0Eh
		mov	[bp+var_4], ax
		mov	ax, [bp+var_A]
		add	ax, 9
		mov	[bp+var_6], ax
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		lea	ax, [bp+var_A]
		push	ss
		push	ax
		call	sub_233D4
		cmp	[bp+arg_0], 4
		jnz	short loc_12C7B
		mov	[bp+var_2], 322h
		jmp	short loc_12C8D
; ---------------------------------------------------------------------------

loc_12C7B:				; CODE XREF: sub_12C2D+45j
		cmp	[bp+arg_2], 0
		jz	short loc_12C88
		mov	[bp+var_2], 2DAh
		jmp	short loc_12C8D
; ---------------------------------------------------------------------------

loc_12C88:				; CODE XREF: sub_12C2D+52j
		mov	[bp+var_2], 292h

loc_12C8D:				; CODE XREF: sub_12C2D+4Cj
					; sub_12C2D+59j
		push	ds
		push	[bp+var_2]
		push	[bp+var_8]
		push	[bp+var_A]
		call	sub_20BBA
		mov	sp, bp
		pop	bp
		retn	8
sub_12C2D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_12CA2	proc near		; CODE XREF: sub_116EF+2F7p
					; sub_116EF+31Cp ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		push	di
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+6]
		cmp	es:[bx+2], ax
		jl	short loc_12CBE
		jmp	loc_12D81
; ---------------------------------------------------------------------------

loc_12CBE:				; CODE XREF: sub_12CA2+17j
		mov	ax, es:[bx]
		cmp	es:[bx+4], ax
		jg	short loc_12CCA
		jmp	loc_12D81
; ---------------------------------------------------------------------------

loc_12CCA:				; CODE XREF: sub_12CA2+23j
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		push	es
		push	bx
		call	sub_233D4
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_233FE
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_20483
		mov	bx, [bp+arg_2]
		shl	bx, 1
		mov	bx, [bx+36Ah]
		mov	di, bx
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	[bp+var_A], cx
		les	bx, [bp+arg_4]
		assume es:nothing
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		mov	dx, cx
		mov	cl, 3
		shl	dx, cl
		sub	ax, dx
		shr	ax, 1
		mov	[bp+var_E], ax
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		sub	ax, [bp+var_8]
		sub	ax, [bp+var_6]
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, [bp+var_8]
		mov	[bp+var_C], ax
		mov	ax, es:[bx+2]
		add	ax, [bp+var_E]
		push	ax
		mov	ax, es:[bx]
		add	ax, [bp+var_C]
		push	ax
		mov	bx, [bp+arg_2]
		shl	bx, 1
		push	ds
		push	word ptr [bx+36Ah]
		push	[bp+var_A]
		call	sub_133D5
		cmp	[bp+arg_0], 5
		jz	short loc_12D73
		cmp	[bp+arg_0], 6
		jz	short loc_12D73
		cmp	[bp+arg_0], 5
		jz	short loc_12D73
		cmp	[bp+arg_0], 6
		jnz	short loc_12D81

loc_12D73:				; CODE XREF: sub_12CA2+BDj
					; sub_12CA2+C3j ...
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		mov	ax, 1
		push	ax
		push	ax
		call	sub_134A3

loc_12D81:				; CODE XREF: sub_12CA2+19j
					; sub_12CA2+25j ...
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_12CA2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_12D88	proc near		; CODE XREF: sub_116EF+2C9p
					; sub_12255+DEp ...

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch
arg_C		= dword	ptr  10h
arg_10		= dword	ptr  14h
arg_14		= dword	ptr  18h
arg_18		= dword	ptr  1Ch

		push	bp
		mov	bp, sp
		mov	ax, 12h
		call	__chkstk
		les	bx, [bp+arg_18]
		mov	ax, es:[bx+1Eh]
		sub	dx, dx
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, es:[bx+1Ch]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		cmp	ax, [bp+var_4]
		ja	short loc_12DB8
		cmp	byte ptr es:[bx+11h], 0FFh
		jnz	short loc_12DC4

loc_12DB8:				; CODE XREF: sub_12D88+27j
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx

loc_12DC4:				; CODE XREF: sub_12D88+2Ej
		mov	ax, [bp+var_4]
		or	ax, [bp+var_2]
		jnz	short loc_12DEC
		mov	ax, [bp+var_8]
		or	ax, [bp+var_6]
		jnz	short loc_12DE0
		mov	ax, 1
		cwd
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		jmp	short loc_12DE6
; ---------------------------------------------------------------------------

loc_12DE0:				; CODE XREF: sub_12D88+4Aj
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]

loc_12DE6:				; CODE XREF: sub_12D88+56j
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx

loc_12DEC:				; CODE XREF: sub_12D88+42j
		les	bx, [bp+arg_18]
		mov	al, es:[bx+10h]
		and	al, 10h
		cmp	al, 10h
		jz	short loc_12DFC
		jmp	loc_12FD9
; ---------------------------------------------------------------------------

loc_12DFC:				; CODE XREF: sub_12D88+6Fj
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		mov	[bp+var_A], ax
		mov	ax, es:[bx]
		les	bx, [bp+arg_C]
		mov	es:[bx], ax
		les	bx, [bp+arg_10]
		mov	es:[bx], ax
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_C]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_10]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_10]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_10]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 4
		jz	short loc_12E56
		les	bx, [bp+arg_10]
		mov	ax, [bp+var_A]
		add	es:[bx+6], ax

loc_12E56:				; CODE XREF: sub_12D88+C2j
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_C]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_C]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 8
		jz	short loc_12E7F
		les	bx, [bp+arg_C]
		mov	ax, [bp+var_A]
		sub	es:[bx+2], ax

loc_12E7F:				; CODE XREF: sub_12D88+EBj
		les	bx, [bp+arg_14]
		mov	ax, es:[bx]
		inc	ax
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		les	bx, [bp+arg_4]
		mov	es:[bx], ax
		les	bx, [bp+arg_8]
		mov	es:[bx], ax
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+4]
		dec	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_4]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_10]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_8]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 4
		jnz	short loc_12ED4
		les	bx, [bp+arg_8]
		inc	word ptr es:[bx+2]

loc_12ED4:				; CODE XREF: sub_12D88+143j
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_4]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 8
		jnz	short loc_12EF3
		les	bx, [bp+arg_4]
		dec	word ptr es:[bx+6]

loc_12EF3:				; CODE XREF: sub_12D88+162j
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_8]
		sub	ax, es:[bx+2]
		cwd
		mov	[bp+var_E], ax
		mov	[bp+var_C], dx
		push	[bp+var_2]
		push	[bp+var_4]
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		mov	[bp+var_12], ax
		cmp	ax, 8
		jge	short loc_12F57
		mov	ax, 8
		sub	ax, [bp+var_12]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	ax, [bp+var_10]
		add	[bp+var_12], ax
		mov	ax, [bp+var_12]
		cwd
		sub	[bp+var_E], ax
		sbb	[bp+var_C], dx

loc_12F57:				; CODE XREF: sub_12D88+1A0j
		les	bx, [bp+arg_18]
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		cmp	ax, es:[bx+12h]
		ja	short loc_12F87
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+6]
		sub	ax, [bp+var_12]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+6]
		jmp	short loc_12FC8
; ---------------------------------------------------------------------------

loc_12F87:				; CODE XREF: sub_12D88+1DCj
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+var_C]
		push	[bp+var_E]
		les	bx, [bp+arg_18]
		sub	ax, ax
		push	ax
		push	word ptr es:[bx+12h]
		call	__aFlmul
		push	dx
		push	ax
		call	__aFuldiv
		les	bx, [bp+arg_8]
		add	ax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, [bp+var_12]

loc_12FC8:				; CODE XREF: sub_12D88+1FDj
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_4]
		mov	es:[bx+2], ax
		jmp	loc_131AE
; ---------------------------------------------------------------------------

loc_12FD9:				; CODE XREF: sub_12D88+71j
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		mov	[bp+var_A], ax
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_C]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_10]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_C]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_10]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_14]
		mov	ax, es:[bx]
		les	bx, [bp+arg_10]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_10]
		mov	es:[bx], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 1
		jz	short loc_13035
		les	bx, [bp+arg_10]
		mov	ax, [bp+var_A]
		add	es:[bx+4], ax

loc_13035:				; CODE XREF: sub_12D88+2A1j
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_C]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_C]
		mov	es:[bx], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 2
		jz	short loc_1305C
		les	bx, [bp+arg_C]
		mov	ax, [bp+var_A]
		sub	es:[bx], ax

loc_1305C:				; CODE XREF: sub_12D88+2C9j
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+2]
		inc	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_4]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_14]
		mov	ax, es:[bx+6]
		dec	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_4]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_10]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_8]
		mov	es:[bx], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 1
		jnz	short loc_130B3
		les	bx, [bp+arg_8]
		inc	word ptr es:[bx]

loc_130B3:				; CODE XREF: sub_12D88+323j
		les	bx, [bp+arg_C]
		mov	ax, es:[bx]
		les	bx, [bp+arg_4]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_18]
		test	byte ptr es:[bx+10h], 2
		jnz	short loc_130D1
		les	bx, [bp+arg_4]
		dec	word ptr es:[bx+4]

loc_130D1:				; CODE XREF: sub_12D88+340j
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_8]
		sub	ax, es:[bx]
		cwd
		mov	[bp+var_E], ax
		mov	[bp+var_C], dx
		push	[bp+var_2]
		push	[bp+var_4]
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		mov	[bp+var_12], ax
		cmp	ax, 8
		jge	short loc_13134
		mov	ax, 8
		sub	ax, [bp+var_12]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	ax, [bp+var_10]
		add	[bp+var_12], ax
		mov	ax, [bp+var_12]
		cwd
		sub	[bp+var_E], ax
		sbb	[bp+var_C], dx

loc_13134:				; CODE XREF: sub_12D88+37Dj
		les	bx, [bp+arg_18]
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		cmp	ax, es:[bx+12h]
		ja	short loc_13163
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+4]
		sub	ax, [bp+var_12]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+4]
		jmp	short loc_131A1
; ---------------------------------------------------------------------------

loc_13163:				; CODE XREF: sub_12D88+3B9j
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+var_C]
		push	[bp+var_E]
		les	bx, [bp+arg_18]
		sub	ax, ax
		push	ax
		push	word ptr es:[bx+12h]
		call	__aFlmul
		push	dx
		push	ax
		call	__aFuldiv
		les	bx, [bp+arg_8]
		add	ax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		les	bx, [bp+arg_8]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		add	ax, [bp+var_12]

loc_131A1:				; CODE XREF: sub_12D88+3D9j
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_4]
		mov	es:[bx], ax

loc_131AE:				; CODE XREF: sub_12D88+24Ej
		mov	sp, bp
		pop	bp
		retn	1Ch
sub_12D88	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_131B4	proc near		; CODE XREF: sub_12007+92p
					; sub_120D1+F2p ...

var_38		= byte ptr -38h
var_36		= byte ptr -36h
var_2E		= byte ptr -2Eh
var_2C		= byte ptr -2Ch
var_24		= byte ptr -24h
var_1C		= byte ptr -1Ch
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_8		= byte ptr -8
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 38h	; '8'
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		les	bx, [bp+var_14]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_1323B
		push	dx
		push	ax
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		lea	ax, [bp+var_38]
		push	ss
		push	ax
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		call	sub_1337F
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		lea	ax, [bp+var_2C]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_1C]
		push	ss
		push	ax
		lea	ax, [bp+var_36]
		push	ss
		push	ax
		call	sub_12D88
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		lea	ax, [bp+var_36]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_1C]
		push	ss
		push	ax
		call	sub_134E4

loc_1323B:				; CODE XREF: sub_131B4+2Ej
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	sp, bp
		pop	bp
		retn	4
sub_131B4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1324C	proc near		; CODE XREF: sub_11334+11Ep
					; sub_11334+2B1p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		les	bx, [bp+arg_8]
		mov	ax, es:[bx]
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], ax
		jle	short loc_13270
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_8]
		mov	es:[bx], ax

loc_13270:				; CODE XREF: sub_1324C+18j
		les	bx, [bp+arg_8]
		mov	ax, es:[bx]
		les	bx, [bp+arg_0]
		cmp	es:[bx+6], ax
		jge	short loc_13289
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_8]
		mov	es:[bx], ax

loc_13289:				; CODE XREF: sub_1324C+31j
		les	bx, [bp+arg_0]
		mov	si, es:[bx]
		les	bx, [bp+arg_4]
		cmp	es:[bx], si
		jge	short loc_1329A
		mov	es:[bx], si

loc_1329A:				; CODE XREF: sub_1324C+49j
		les	bx, [bp+arg_4]
		mov	ax, es:[bx]
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], ax
		jge	short loc_132B3
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_4]
		mov	es:[bx], ax

loc_132B3:				; CODE XREF: sub_1324C+5Bj
		pop	si
		pop	bp
		retn	0Ch
sub_1324C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_132B8	proc near		; CODE XREF: sub_11334+15Fp
					; sub_11334+2F4p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_6]
		sub	ax, es:[bx+6]
		mov	[bp+var_2], ax
		or	ax, ax
		jl	short loc_132F2
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_6]
		sub	ax, es:[bx+2]
		mov	[bp+var_2], ax
		or	ax, ax
		jg	short loc_132F2
		mov	[bp+var_2], 0

loc_132F2:				; CODE XREF: sub_132B8+1Ej
					; sub_132B8+33j
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_6]
		sub	ax, es:[bx+4]
		mov	[bp+var_4], ax
		or	ax, ax
		jl	short loc_1331F
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		les	bx, [bp+arg_6]
		sub	ax, es:[bx]
		mov	[bp+var_4], ax
		or	ax, ax
		jg	short loc_1331F
		mov	[bp+var_4], 0

loc_1331F:				; CODE XREF: sub_132B8+4Dj
					; sub_132B8+60j
		push	es
		push	bx
		push	[bp+var_2]
		push	[bp+var_4]
		mov	al, [bp+arg_0]
		and	al, 4
		cmp	al, 1
		sbb	cx, cx
		neg	cx
		push	cx
		call	sub_13435
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_132B8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1333C	proc far		; CODE XREF: sub_1337F+22p
					; seg001:20ADP	...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_8]
		les	bx, es:[bx]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_4]
		mov	es:[bx], ax
		les	bx, [bp+arg_8]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		nop
		push	cs
		call	near ptr sub_1B063
		pop	bp
		retf	0Ch
sub_1333C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1337F	proc near		; CODE XREF: sub_116EF+45p
					; sub_11A4F+41p ...

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= dword	ptr  10h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_C]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1333C
		mov	ax, word ptr [bp+arg_C]
		mov	dx, word ptr [bp+arg_C+2]
		add	ax, 8
		push	dx
		push	ax
		push	[bp+arg_A]
		push	[bp+arg_8]
		call	sub_321A6
		push	[bp+arg_A]
		push	[bp+arg_8]
		les	bx, [bp+arg_4]
		push	word ptr es:[bx]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		call	sub_208AA
		pop	bp
		retn	10h
sub_1337F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_133D5	proc near		; CODE XREF: sub_116EF+109p
					; sub_116EF+282p ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		call	sub_20AC6
		mov	byte_48766, 0Fh
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_23537
		pop	bp
		retn	0Ah
sub_133D5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_13404	proc near		; CODE XREF: sub_11334+148p
					; sub_11334+2DCp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_C]
		push	[bp+arg_A]
		call	sub_321A6
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_13435
		pop	bp
		retn	0Eh
sub_13404	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_13435	proc near		; CODE XREF: sub_132B8+7Bp
					; sub_13404+2Ap

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		add	es:[bx+6], ax
		les	bx, [bp+arg_6]
		mov	ax, [bp+arg_2]
		add	es:[bx+4], ax
		cmp	[bp+arg_0], 0
		jz	short loc_1346C
		les	bx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		add	es:[bx+2], ax
		les	bx, [bp+arg_6]
		mov	ax, [bp+arg_2]
		add	es:[bx], ax

loc_1346C:				; CODE XREF: sub_13435+22j
		pop	bp
		retn	0Ah
sub_13435	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_13470	proc near		; CODE XREF: sub_11334+8Bp
					; sub_11334+184p ...

arg_0		= byte ptr  4
arg_2		= byte ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 2
		push	ax
		call	sub_20ADE
		call	sub_20AF6
		mov	al, [bp+arg_2]
		mov	byte_490A6, al
		mov	al, [bp+arg_0]
		mov	byte_490B0, al
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_201CE
		pop	bp
		retn	8
sub_13470	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_134A3	proc near		; CODE XREF: sub_12BA7+74p
					; sub_12CA2+DCp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_20513
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_205C8
		push	[bp+arg_6]
		push	[bp+arg_4]
		mov	ax, [bp+arg_2]
		neg	ax
		push	ax
		mov	ax, [bp+arg_0]
		neg	ax
		push	ax
		call	sub_20513
		pop	bp
		retn	8
sub_134A3	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_134E4	proc near		; CODE XREF: sub_116EF+32Ep
					; sub_131B4+84p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_A]
		push	[bp+arg_8]
		call	sub_233D4
		push	[bp+arg_A]
		push	[bp+arg_8]
		call	sub_233FE
		call	sub_20AF6
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_208DF
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_208DF
		pop	bp
		retn	0Ch
sub_134E4	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================


sub_13524	proc far		; CODE XREF: sub_23F23+10BP
		xor	ax, ax
		call	__chkstk
		push	word_4DF86
		push	word_4DF84
		mov	ax, 382h
		push	ds
		push	ax
		mov	ax, 40Ah
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		mov	ax, 1
		cwd
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	word_47190, ax
		mov	word_47192, dx
		or	dx, ax
		jz	short loc_135CF
		push	word_4DF86
		push	word_4DF84
		mov	ax, 392h
		push	ds
		push	ax
		mov	ax, 410h
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		mov	ax, 1
		cwd
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	word_4719E, ax
		mov	word_471A0, dx
		or	dx, ax
		jz	short loc_135CF
		push	word_4DF86
		push	word_4DF84
		mov	ax, 3C2h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 10h
		push	ax
		sub	ax, ax
		push	ax
		mov	ax, 32h	; '2'
		push	ax
		mov	ax, 801h
		push	ax
		mov	ax, 4
		cwd
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	word_47194, ax
		mov	word_47196, dx
		or	dx, ax
		jnz	short loc_135DD

loc_135CF:				; CODE XREF: sub_13524+3Aj
					; sub_13524+6Fj
		or	byte ptr word_490A0+1, 10h
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_102F7

loc_135DD:				; CODE XREF: sub_13524+A9j
		mov	ax, 3524h
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		retf
sub_13524	endp


; =============== S U B	R O U T	I N E =======================================


sub_135EB	proc far		; CODE XREF: sub_1CE72+34p
					; sub_29E66+32P
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF96, 0
		jnz	short loc_135FC
		jmp	locret_13739
; ---------------------------------------------------------------------------

loc_135FC:				; CODE XREF: sub_135EB+Cj
		mov	ax, 372h
		push	ds
		push	ax
		call	sub_233D4
		mov	ax, 372h
		push	ds
		push	ax
		call	sub_233FE
		push	word_4DF86
		push	word_4DF84
		nop
		push	cs
		call	near ptr sub_11668
		mov	ax, 426h
		push	ds
		push	ax
		push	word_4137C
		push	word_4137A
		call	sub_20BBA
		mov	ax, 4DAh
		push	ds
		push	ax
		push	word_41384
		push	word_41382
		call	sub_20BBA
		mov	ax, 73Eh
		push	ds
		push	ax
		push	word_413CC
		push	word_413CA
		call	sub_20BBA
		mov	ax, 58Eh
		push	ds
		push	ax
		push	word_413DC
		push	word_413DA
		call	sub_20BBA
		mov	ax, 61Eh
		push	ds
		push	ax
		push	word_413E4
		push	word_413E2
		call	sub_20BBA
		mov	ax, 6AEh
		push	ds
		push	ax
		push	word_413D4
		push	word_413D2
		call	sub_20BBA
		mov	ax, 37Ah
		push	ds
		push	ax
		mov	ax, 3
		push	ax
		call	sub_14936
		mov	ax, 382h
		push	ds
		push	ax
		mov	ax, 3
		push	ax
		call	sub_14936
		mov	ax, 38Ah
		push	ds
		push	ax
		mov	ax, 3
		push	ax
		call	sub_14936
		mov	ax, 392h
		push	ds
		push	ax
		mov	ax, 3
		push	ax
		call	sub_14936
		mov	ax, 3B2h
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		call	sub_14936
		mov	ax, 3CAh
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		call	sub_14936
		mov	ax, 3DAh
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		call	sub_14936
		mov	ax, 3E2h
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		call	sub_14936
		mov	ax, 3D2h
		push	ds
		push	ax
		mov	ax, 2
		push	ax
		call	sub_14936
		mov	ax, word_4DFA0
		cmp	word_490AE, ax
		jnz	short loc_13710
		mov	ax, 3EAh
		push	ds
		push	ax
		call	sub_205C8
		mov	word_47182, 1
		jmp	short loc_13716
; ---------------------------------------------------------------------------

loc_13710:				; CODE XREF: sub_135EB+111j
		mov	word_47182, 0

loc_13716:				; CODE XREF: sub_135EB+123j
		cmp	word_4B3CA, 0
		jz	short loc_1372F
		mov	ax, 3F2h
		push	ds
		push	ax
		call	sub_205C8
		mov	word_4719C, 1
		jmp	short loc_13735
; ---------------------------------------------------------------------------

loc_1372F:				; CODE XREF: sub_135EB+130j
		mov	word_4719C, 0

loc_13735:				; CODE XREF: sub_135EB+142j
		push	cs
		call	near ptr sub_1408E

locret_13739:				; CODE XREF: sub_135EB+Ej
		retf
sub_135EB	endp


; =============== S U B	R O U T	I N E =======================================


sub_1373A	proc far		; CODE XREF: sub_10167+52p
					; sub_16592+4D2p
		xor	ax, ax
		call	__chkstk
		retf
sub_1373A	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		mov	ax, 61A4h
		push	ds
		push	ax
		call	sub_29DCE
		push	ds
		push	word_47198
		mov	ax, 1B06h
		push	ds
		push	ax
		lea	ax, [bp-0Ah]
		push	ss
		push	ax
		call	sub_20E76
		or	ax, ax
		jz	short loc_137E2
		call	sub_232D3
		mov	ax, [bp-4]
		sub	ax, [bp-8]
		mov	[bp-2],	ax
		push	word ptr [bp-8]
		push	word ptr [bp-0Ah]
		push	ax
		mov	ax, [bp-6]
		sub	ax, [bp-0Ah]
		push	ax
		mov	ax, [bp-0Ah]
		mov	bx, word_47198
		sub	ax, [bx]
		les	bx, dword_4718C
		imul	word ptr es:[bx+8]
		mov	cx, [bp-8]
		mov	bx, word_47198
		sub	cx, [bx+2]
		sar	cx, 1
		add	ax, cx
		mov	bx, word ptr dword_4718C
		les	bx, es:[bx]
		add	ax, es:[bx]
		mov	dx, es:[bx+2]
		push	dx
		push	ax
		les	bx, dword_4718C
		mov	ax, es:[bx+8]
		mov	cx, [bp-2]
		sar	cx, 1
		sub	ax, cx
		push	ax
		call	dword_48792
		push	ds
		push	word_47198
		mov	ax, 61A4h
		push	ds
		push	ax
		call	sub_321A6
		call	sub_232B2

loc_137E2:				; CODE XREF: seg000:376Dj
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_137E6	proc far		; CODE XREF: sub_10167+146p

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= byte ptr -28h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 2Ch	; ','
		call	__chkstk
		push	si
		mov	[bp+var_4], 0
		cmp	word_4DF96, 0
		jnz	short loc_13801
		jmp	loc_13965
; ---------------------------------------------------------------------------

loc_13801:				; CODE XREF: sub_137E6+16j
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	word_4DF86
		push	word_4DF84
		nop
		push	cs
		call	near ptr sub_11ABC
		mov	[bp+var_A], ax
		or	ax, ax
		jnz	short loc_13827
		jmp	loc_13965
; ---------------------------------------------------------------------------

loc_13827:				; CODE XREF: sub_137E6+3Cj
		mov	ax, word_4719E
		mov	dx, word_471A0
		cmp	[bp+var_E], ax
		jnz	short loc_1385D
		cmp	[bp+var_C], dx
		jnz	short loc_1385D
		test	byte ptr [bp+arg_4], 80h
		jnz	short loc_13845
		cmp	word_4E956, 0
		jz	short loc_1384B

loc_13845:				; CODE XREF: sub_137E6+56j
		call	sub_1455B
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_1384B:				; CODE XREF: sub_137E6+5Dj
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		push	[bp+var_C]
		push	[bp+var_E]
		call	sub_14445
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_1385D:				; CODE XREF: sub_137E6+4Bj
					; sub_137E6+50j
		mov	ax, word_47190
		mov	dx, word_47192
		cmp	[bp+var_E], ax
		jnz	short loc_138CB
		cmp	[bp+var_C], dx
		jnz	short loc_138CB
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+var_C]
		push	[bp+var_E]
		nop
		push	cs
		call	near ptr sub_123F9
		or	ax, ax
		jnz	short loc_1388E
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_1388E:				; CODE XREF: sub_137E6+A3j
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_1389B
		cmp	word_4DF5C, 0
		jz	short loc_138A8

loc_1389B:				; CODE XREF: sub_137E6+ACj
		test	byte ptr [bp+arg_4], 80h
		jnz	short loc_138B3
		cmp	word_4DF5C, 0
		jz	short loc_138B3

loc_138A8:				; CODE XREF: sub_137E6+B3j
		sub	ax, ax
		push	ax
		mov	ax, 8FF1h
		mov	dx, seg	seg000
		jmp	short loc_138BD
; ---------------------------------------------------------------------------

loc_138B3:				; CODE XREF: sub_137E6+B9j
					; sub_137E6+C0j
		push	word_4DFA0
		mov	ax, 45DCh
		mov	dx, seg	seg000

loc_138BD:				; CODE XREF: sub_137E6+CBj
		push	dx
		push	ax
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_18DDC
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_138CB:				; CODE XREF: sub_137E6+81j
					; sub_137E6+86j
		mov	ax, word_47194
		mov	dx, word_47196
		cmp	[bp+var_E], ax
		jz	short loc_138DA
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_138DA:				; CODE XREF: sub_137E6+EFj
		cmp	[bp+var_C], dx
		jz	short loc_138E2
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_138E2:				; CODE XREF: sub_137E6+F7j
		mov	ax, [bp+var_A]
		cmp	ax, 7
		jz	short loc_13931
		cmp	ax, 8
		jz	short loc_1394B
		cmp	ax, 81h	; '�'
		jz	short loc_138F7
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_138F7:				; CODE XREF: sub_137E6+10Cj
		call	sub_232B2
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+var_C]
		push	[bp+var_E]
		nop
		push	cs
		call	near ptr sub_123F9
		or	ax, ax
		jz	short loc_13929
		push	[bp+var_C]
		push	[bp+var_E]
		nop
		push	cs
		call	near ptr sub_11C04
		push	ax
		push	cs
		call	near ptr sub_14185

loc_13929:				; CODE XREF: sub_137E6+131j
		call	sub_232D3
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13931:				; CODE XREF: sub_137E6+102j
		mov	ax, 32h	; '2'
		push	ax
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		push	[bp+var_C]
		push	[bp+var_E]
		sub	ax, ax
		push	ax

loc_13944:				; CODE XREF: sub_137E6+1FFj
		push	ax
		call	sub_1435D
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_1394B:				; CODE XREF: sub_137E6+107j
		mov	ax, 32h	; '2'
		push	ax
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		push	[bp+var_C]
		push	[bp+var_E]
		sub	ax, ax
		push	ax

loc_1395E:				; CODE XREF: sub_137E6+28Cj
		push	ax
		call	sub_143D1
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13965:				; CODE XREF: sub_137E6+18j
					; sub_137E6+3Ej
		cmp	word_4DF96, 0
		jz	short loc_139E8
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 39Ah
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_139E8
		test	byte ptr [bp+arg_4], 40h
		jz	short loc_139A6
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 39Ah
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_139A0
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_139A0:				; CODE XREF: sub_137E6+1B5j
					; sub_137E6:loc_13A30j
		sub	ax, ax

loc_139A2:				; CODE XREF: sub_137E6+247j
		push	ax
		jmp	loc_13BE6
; ---------------------------------------------------------------------------

loc_139A6:				; CODE XREF: sub_137E6+19Ej
		test	byte ptr [bp+arg_4], 8
		jnz	short loc_139B3
		cmp	word_4E956, 0
		jz	short loc_139C8

loc_139B3:				; CODE XREF: sub_137E6+1C4j
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_139BE
		mov	ax, 0Ah
		jmp	short loc_139C1
; ---------------------------------------------------------------------------

loc_139BE:				; CODE XREF: sub_137E6+1D1j
		mov	ax, 1

loc_139C1:				; CODE XREF: sub_137E6+1D6j
		push	ax
		call	sub_14496
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_139C8:				; CODE XREF: sub_137E6+1CBj
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_139D3
		mov	ax, 0Ah
		jmp	short loc_139D6
; ---------------------------------------------------------------------------

loc_139D3:				; CODE XREF: sub_137E6+1E6j
		mov	ax, 1

loc_139D6:				; CODE XREF: sub_137E6+1EBj
		push	ax
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 39Ah
		push	ds
		jmp	loc_13944
; ---------------------------------------------------------------------------

loc_139E8:				; CODE XREF: sub_137E6+184j
					; sub_137E6+198j
		cmp	word_4DF96, 0
		jnz	short loc_139F2
		jmp	loc_13A75
; ---------------------------------------------------------------------------

loc_139F2:				; CODE XREF: sub_137E6+207j
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3A2h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_13A75
		test	byte ptr [bp+arg_4], 40h
		jz	short loc_13A33
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3A2h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_13A26
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13A26:				; CODE XREF: sub_137E6+23Bj
		mov	ax, word_490B8
		or	ax, ax
		jl	short loc_13A30
		jmp	loc_139A2
; ---------------------------------------------------------------------------

loc_13A30:				; CODE XREF: sub_137E6+245j
		jmp	loc_139A0
; ---------------------------------------------------------------------------

loc_13A33:				; CODE XREF: sub_137E6+224j
		test	byte ptr [bp+arg_4], 8
		jnz	short loc_13A40
		cmp	word_4E956, 0
		jz	short loc_13A55

loc_13A40:				; CODE XREF: sub_137E6+251j
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_13A4B
		mov	ax, 0Ah
		jmp	short loc_13A4E
; ---------------------------------------------------------------------------

loc_13A4B:				; CODE XREF: sub_137E6+25Ej
		mov	ax, 1

loc_13A4E:				; CODE XREF: sub_137E6+263j
		push	ax
		call	sub_144F8
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13A55:				; CODE XREF: sub_137E6+258j
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_13A60
		mov	ax, 0Ah
		jmp	short loc_13A63
; ---------------------------------------------------------------------------

loc_13A60:				; CODE XREF: sub_137E6+273j
		mov	ax, 1

loc_13A63:				; CODE XREF: sub_137E6+278j
		push	ax
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 3A2h
		push	ds
		jmp	loc_1395E
; ---------------------------------------------------------------------------

loc_13A75:				; CODE XREF: sub_137E6+209j
					; sub_137E6+21Ej
		cmp	word_4DF96, 0
		jz	short loc_13ABB
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3AAh
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_13ABB
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3AAh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_13AAA
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13AAA:				; CODE XREF: sub_137E6+2BFj
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_13AB3
		jmp	loc_13BE2
; ---------------------------------------------------------------------------

loc_13AB3:				; CODE XREF: sub_137E6+2C8j
		call	sub_25CC4
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13ABB:				; CODE XREF: sub_137E6+294j
					; sub_137E6+2A8j
		cmp	word_4DF96, 0
		jz	short loc_13AFF
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3FAh
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_13AFF
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3FAh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_13AF0
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13AF0:				; CODE XREF: sub_137E6+305j
		mov	ax, [bp+arg_4]
		and	ax, 80h
		push	ax
		nop
		push	cs
		call	near ptr sub_1806F
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13AFF:				; CODE XREF: sub_137E6+2DAj
					; sub_137E6+2EEj
		cmp	word_4DF96, 0
		jz	short loc_13B3C
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 402h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_13B3C
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 402h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_13B34
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13B34:				; CODE XREF: sub_137E6+349j
		nop
		push	cs
		call	near ptr sub_16480
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13B3C:				; CODE XREF: sub_137E6+31Ej
					; sub_137E6+332j
		cmp	word_4DF96, 0
		jz	short loc_13B96
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3F2h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_13B96
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3F2h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_13B71
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13B71:				; CODE XREF: sub_137E6+386j
		cmp	word_4B3CA, 1
		sbb	ax, ax
		neg	ax
		mov	word_4B3CA, ax
		cmp	word_4719C, 1
		sbb	ax, ax
		neg	ax
		mov	word_4719C, ax
		mov	ax, 3F2h
		push	ds
		push	ax
		call	sub_205C8
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13B96:				; CODE XREF: sub_137E6+35Bj
					; sub_137E6+36Fj
		cmp	word_4DF96, 0
		jz	short loc_13BFD
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3EAh
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_13BFD
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		mov	ax, 3EAh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jnz	short loc_13BCB
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13BCB:				; CODE XREF: sub_137E6+3E0j
		test	byte ptr [bp+arg_4], 80h
		jz	short loc_13BD9
		call	sub_2625F
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13BD9:				; CODE XREF: sub_137E6+3E9j
		mov	ax, word_490AE
		cmp	word_4DFA0, ax
		jnz	short loc_13BED

loc_13BE2:				; CODE XREF: sub_137E6+2CAj
		push	word_4DF58

loc_13BE6:				; CODE XREF: sub_137E6+1BDj
					; sub_137E6+415j
		push	cs
		call	near ptr sub_14185
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13BED:				; CODE XREF: sub_137E6+3FAj
		cmp	word_490AE, 0
		jge	short loc_13BF7
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13BF7:				; CODE XREF: sub_137E6+40Cj
		push	word_490AE
		jmp	short loc_13BE6
; ---------------------------------------------------------------------------

loc_13BFD:				; CODE XREF: sub_137E6+3B5j
					; sub_137E6+3C9j
		les	bx, [bp+arg_6]
		mov	ax, word_42AEA
		cmp	es:[bx], ax
		jl	short loc_13C0B
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13C0B:				; CODE XREF: sub_137E6+420j
		push	es
		push	bx
		call	sub_249C9
		mov	[bp+var_4], ax
		or	ax, ax
		jnz	short loc_13C1C
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13C1C:				; CODE XREF: sub_137E6+431j
		mov	bx, ax
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		cmp	ax, word_4B45F
		jz	short loc_13C33
		jmp	loc_13CBC
; ---------------------------------------------------------------------------

loc_13C33:				; CODE XREF: sub_137E6+448j
		test	byte ptr [bp+arg_4], 80h
		jnz	short loc_13C66
		mov	ax, bx
		mov	cx, ds
		cmp	ax, word_41754
		jnz	short loc_13CBC
		cmp	cx, word_41756
		jnz	short loc_13CBC
		call	sub_26DFB
		mov	cx, [bp+arg_0]
		mov	bx, [bp+arg_2]
		sub	cx, word_41758
		sbb	bx, word_4175A
		cmp	bx, dx
		ja	short loc_13CBC
		jb	short loc_13C66
		cmp	cx, ax
		jnb	short loc_13CBC

loc_13C66:				; CODE XREF: sub_137E6+451j
					; sub_137E6+47Aj
		mov	ax, word_4879A
		mov	[bp+var_2], ax
		lea	ax, [bp+var_28]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_13CAB
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8
		mov	ax, [bp+var_4]
		mov	word_4879A, ax
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_16592
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13CAB:				; CODE XREF: sub_137E6+49Cj
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8
		mov	ax, [bp+var_2]

loc_13CB6:				; CODE XREF: sub_137E6+634j
		mov	word_4879A, ax
		jmp	loc_13F71
; ---------------------------------------------------------------------------

loc_13CBC:				; CODE XREF: sub_137E6+44Aj
					; sub_137E6+45Bj ...
		cmp	[bp+var_4], 0
		jnz	short loc_13CC5
		jmp	loc_13F7A
; ---------------------------------------------------------------------------

loc_13CC5:				; CODE XREF: sub_137E6+4DAj
		push	word_490A4
		push	word_490A2	; void *
		call	sub_2AA92
		push	[bp+var_4]
		push	word_490A4
		push	word_490A2
		call	sub_2A711
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		add	ax, 0Bh
		push	dx
		push	ax
		call	sub_2AAF2
		push	ax		; size_t
		mov	ax, word ptr [bp+var_8]
		mov	dx, word ptr [bp+var_8+2]
		add	ax, 0Bh
		push	dx
		push	ax		; void *
		push	dx
		push	word ptr [bp+var_8] ; void *
		call	_memmove
		add	sp, 0Ah
		call	sub_232D3
		nop
		push	cs
		call	near ptr sub_1FBD0
		add	ax, 5
		adc	dx, 0
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		sub	ax, ax
		push	ax
		call	sub_2925A
		or	ax, ax
		jge	short loc_13D4C

loc_13D44:				; CODE XREF: sub_137E6+5A1j
					; sub_137E6+5E0j ...
		call	sub_232B2
		jmp	loc_13F97
; ---------------------------------------------------------------------------

loc_13D4C:				; CODE XREF: sub_137E6+55Cj
					; sub_137E6+570j ...
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp+var_2A]
		ja	short loc_13D5D
		jb	short loc_13D4C
		cmp	ax, [bp+var_2C]
		jb	short loc_13D4C

loc_13D5D:				; CODE XREF: sub_137E6+56Ej
		add	[bp+var_2C], 5
		adc	[bp+var_2A], 0
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		or	ax, ax
		jl	short loc_13D44

loc_13D89:				; CODE XREF: sub_137E6+5ADj
					; sub_137E6+5B2j
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp+var_2A]
		ja	short loc_13D9A
		jb	short loc_13D89
		cmp	ax, [bp+var_2C]
		jb	short loc_13D89

loc_13D9A:				; CODE XREF: sub_137E6+5ABj
		add	[bp+var_2C], 5
		adc	[bp+var_2A], 0
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		sub	ax, ax
		push	ax
		call	sub_2925A
		or	ax, ax
		jge	short loc_13DC9
		jmp	loc_13D44
; ---------------------------------------------------------------------------

loc_13DC9:				; CODE XREF: sub_137E6+5DEj
					; sub_137E6+5EDj ...
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp+var_2A]
		ja	short loc_13DDA
		jb	short loc_13DC9
		cmp	ax, [bp+var_2C]
		jb	short loc_13DC9

loc_13DDA:				; CODE XREF: sub_137E6+5EBj
		call	sub_26F25
		or	ax, ax
		jnz	short loc_13E1D
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		or	ax, ax
		jge	short loc_13E0A
		jmp	loc_13D44
; ---------------------------------------------------------------------------

loc_13E0A:				; CODE XREF: sub_137E6+61Fj
		call	sub_232B2
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8
		mov	ax, [bp+var_4]
		jmp	loc_13CB6
; ---------------------------------------------------------------------------

loc_13E1D:				; CODE XREF: sub_137E6+5FBj
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_26E07
		push	word_413F6
		push	word_413FA
		push	word_413F4
		push	word_413F8
		call	sub_26F94
		push	[bp+var_10]
		push	[bp+var_12]
		call	sub_27043
		mov	ax, [bp+var_4]
		add	ax, 0Eh
		mov	word_47198, ax
		mov	bx, [bp+var_4]
		mov	ax, 0Eh
		imul	word ptr [bx+0Ch]
		mov	bx, [bx+16h]
		mov	cx, [bx+22h]
		mov	si, [bx+24h]
		add	cx, ax
		mov	word ptr dword_4718C, cx
		mov	word ptr dword_4718C+2,	si
		push	ds
		push	word_47198
		mov	ax, 61A4h
		push	ds
		push	ax
		call	sub_321A6
		mov	bx, [bp+var_4]
		push	word ptr [bx+16h]
		push	word ptr [bx+0Ch]
		call	sub_278E9
		or	ax, ax
		jnz	short loc_13ED7
		call	sub_232B2
		mov	ax, 3742h
		mov	dx, seg	seg000
		push	dx
		push	ax
		mov	ax, 1B0Eh
		push	ds
		push	ax
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, [bp+var_4]
		add	ax, 0Eh
		push	ds
		push	ax
		mov	ax, 414h
		push	ds
		push	ax
		push	ds
		push	ax
		mov	ax, 228h
		push	ax
		nop
		push	cs
		call	near ptr sub_11334
		mov	[bp+var_16], ax
		mov	[bp+var_14], dx
		mov	bx, [bp+var_4]
		push	word ptr [bx+16h]
		push	word ptr [bx+0Ch]
		call	sub_27957
		jmp	short loc_13EE4
; ---------------------------------------------------------------------------

loc_13ED7:				; CODE XREF: sub_137E6+6A5j
		call	sub_232B2
		sub	ax, ax
		mov	[bp+var_14], ax
		mov	[bp+var_16], ax

loc_13EE4:				; CODE XREF: sub_137E6+6EFj
		mov	ax, [bp+var_16]
		or	ax, [bp+var_14]
		jnz	short loc_13F16
		call	sub_232D3
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2

loc_13F16:				; CODE XREF: sub_137E6+704j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		call	sub_26E07
		sub	ax, ax
		push	ax
		mov	ax, 13Fh
		push	ax
		sub	ax, ax
		push	ax
		mov	ax, 0C7h ; '�'
		push	ax
		call	sub_26F94
		push	[bp+var_10]
		push	[bp+var_12]
		call	sub_27043
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8
		mov	ax, [bp+var_4]
		mov	word_4879A, ax
		call	sub_2A50D
		push	word_4879A
		push	word_4DFA0
		call	sub_2A628
		or	ax, ax
		jnz	short loc_13F71
		mov	bx, word_4879A
		mov	word ptr [bx+2], 1
		mov	word_4879A, 0

loc_13F71:				; CODE XREF: sub_137E6+4D3j
					; sub_137E6+77Aj
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8

loc_13F7A:				; CODE XREF: sub_137E6+62j
					; sub_137E6+74j ...
		cmp	[bp+var_4], 0
		jz	short loc_13F97
		mov	ax, [bp+var_4]
		mov	word_41754, ax
		mov	word_41756, ds
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_41758, ax
		mov	word_4175A, dx

loc_13F97:				; CODE XREF: sub_137E6+563j
					; sub_137E6+798j
		pop	si
		mov	sp, bp
		pop	bp
		retf	0Ah
sub_137E6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_13F9E	proc far		; CODE XREF: sub_137E6+1B0p
					; sub_137E6+236p ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_20A1B
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_13FCC
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_205C8

loc_13FCC:				; CODE XREF: sub_13F9E+21j
		les	bx, [bp+arg_8]
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_2], ax
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_14040
		push	[bp+var_6]
		jmp	short loc_1403D
; ---------------------------------------------------------------------------

loc_13FE9:				; CODE XREF: sub_13F9E+A9j
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		call	sub_26E07
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_20A1B
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_14010
		cmp	[bp+var_6], 0
		jz	short loc_1401C

loc_14010:				; CODE XREF: sub_13F9E+6Aj
		cmp	[bp+var_8], 0
		jnz	short loc_14032
		cmp	[bp+var_6], 0
		jz	short loc_14032

loc_1401C:				; CODE XREF: sub_13F9E+70j
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_205C8
		cmp	[bp+var_6], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_6], ax

loc_14032:				; CODE XREF: sub_13F9E+76j
					; sub_13F9E+7Cj
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_14040
		push	[bp+var_8]

loc_1403D:				; CODE XREF: sub_13F9E+49j
		call	[bp+arg_0]

loc_14040:				; CODE XREF: sub_13F9E+44j
					; sub_13F9E+9Aj
		call	sub_26F25
		or	ax, ax
		jnz	short loc_13FE9
		mov	ax, 4
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_26E7B
		or	ax, ax
		jz	short loc_14067
		mov	ax, word_4908E
		mov	[bp+var_4], ax
		mov	ax, word_49090
		mov	[bp+var_2], ax

loc_14067:				; CODE XREF: sub_13F9E+BBj
		cmp	[bp+var_6], 0
		jz	short loc_14078
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_205C8

loc_14078:				; CODE XREF: sub_13F9E+CDj
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_20A1B
		mov	sp, bp
		pop	bp
		retf	0Ch
sub_13F9E	endp


; =============== S U B	R O U T	I N E =======================================


sub_1408E	proc far		; CODE XREF: sub_135EB+14Bp
					; sub_14185+5Dp ...
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF96, 0
		jz	short locret_140EA
		push	word_4DFA0
		push	word_47196
		push	word_47194
		nop
		push	cs
		call	near ptr sub_120D1
		push	word_4DFA0
		call	sub_140EB
		mov	ax, word_4DFA0
		cmp	word_490AE, ax
		jnz	short loc_140C4
		cmp	word_47182, 0
		jz	short loc_140D4

loc_140C4:				; CODE XREF: sub_1408E+2Dj
		mov	ax, word_4DFA0
		cmp	word_490AE, ax
		jz	short locret_140EA
		cmp	word_47182, 0
		jz	short locret_140EA

loc_140D4:				; CODE XREF: sub_1408E+34j
		mov	ax, 3EAh
		push	ds
		push	ax
		call	sub_205C8
		cmp	word_47182, 1
		sbb	ax, ax
		neg	ax
		mov	word_47182, ax

locret_140EA:				; CODE XREF: sub_1408E+Cj
					; sub_1408E+3Dj ...
		retf
sub_1408E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_140EB	proc near		; CODE XREF: sub_1408E+23p

var_10		= byte ptr -10h
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		mov	ax, 0Ah
		push	ax		; int
		lea	ax, [bp+var_10]
		push	ss
		push	ax		; char *
		mov	ax, [bp+arg_0]
		inc	ax
		push	ax		; int
		call	_itoa
		add	sp, 8
		mov	ax, 3AAh
		push	ds
		push	ax
		call	sub_233D4
		call	sub_234BE
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_20114
		sub	ax, 0B3h ; '�'
		neg	ax
		push	ax
		mov	ax, 0AFh ; '�'
		push	ax
		call	sub_20892
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_20152
		mov	sp, bp
		pop	bp
		retn	2
sub_140EB	endp


; =============== S U B	R O U T	I N E =======================================


sub_14144	proc far		; CODE XREF: sub_181DF+5Dp
					; sub_18844+3FCp
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF96, 0
		jz	short locret_14184
		cmp	word_4B3CA, 0
		jz	short loc_14160
		cmp	word_4719C, 0
		jz	short loc_1416E

loc_14160:				; CODE XREF: sub_14144+13j
		cmp	word_4B3CA, 0
		jnz	short locret_14184
		cmp	word_4719C, 0
		jz	short locret_14184

loc_1416E:				; CODE XREF: sub_14144+1Aj
		mov	ax, 3F2h
		push	ds
		push	ax
		call	sub_205C8
		cmp	word_4719C, 1
		sbb	ax, ax
		neg	ax
		mov	word_4719C, ax

locret_14184:				; CODE XREF: sub_14144+Cj
					; sub_14144+21j ...
		retf
sub_14144	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14185	proc far		; CODE XREF: sub_137E6+140p
					; sub_137E6+401p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4DFA0
		cmp	[bp+arg_0], ax
		jz	short loc_141F3
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		call	sub_232D3
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		mov	bx, [bp+arg_0]
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		mov	ax, [bp+arg_0]
		mov	word_4DFA0, ax
		push	cs
		call	near ptr sub_1408E
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_141F3:				; CODE XREF: sub_14185+10j
		pop	bp
		retf	2
sub_14185	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_141F7	proc far		; CODE XREF: seg000:4271p
					; sub_14496+34p ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_1425D
		cmp	word_4DFA0, 0
		jle	short loc_1425D
		mov	ax, word_4DFA0
		sub	ax, word_4719A
		mov	[bp+var_2], ax
		or	ax, ax
		jge	short loc_14222
		mov	[bp+var_2], 0

loc_14222:				; CODE XREF: sub_141F7+24j
		call	sub_232D3
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2
		mov	ax, [bp+var_2]
		mov	word_4DFA0, ax
		push	cs
		call	near ptr sub_1408E

loc_1425D:				; CODE XREF: sub_141F7+Fj
					; sub_141F7+16j
		mov	sp, bp
		pop	bp
		retf	2
sub_141F7	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_141F7
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14276	proc far		; CODE XREF: seg000:42F2p
					; sub_144F8+34p ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_142DE
		cmp	word_4DFA0, 7CFh
		jge	short loc_142DE
		mov	ax, word_4DFA0
		add	ax, word_4719A
		mov	[bp+var_2], ax
		cmp	ax, 7D0h
		jl	short loc_142A3
		mov	[bp+var_2], 7CFh

loc_142A3:				; CODE XREF: sub_14276+26j
		call	sub_232D3
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2
		mov	ax, [bp+var_2]
		mov	word_4DFA0, ax
		push	cs
		call	near ptr sub_1408E

loc_142DE:				; CODE XREF: sub_14276+Fj
					; sub_14276+17j
		mov	sp, bp
		pop	bp
		retf	2
sub_14276	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_14276
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_142F7	proc far		; CODE XREF: sub_1455B+47p
					; sub_14619+120p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		cmp	[bp+arg_0], 0
		jz	short loc_1435A
		cmp	word_4DFA0, 7CFh
		jge	short loc_1435A
		call	sub_278A3
		mov	word_471A2, ax
		or	ax, ax
		jz	short loc_14351
		inc	word_4DFA0
		call	sub_2A0B3
		call	sub_232D3
		mov	si, word_4DFA0
		mov	cl, 2
		shl	si, cl
		push	word ptr [si-5B56h]
		push	word ptr [si-5B58h]
		push	word ptr [si-5B52h]
		push	word ptr [si-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2
		jmp	short loc_14356
; ---------------------------------------------------------------------------

loc_14351:				; CODE XREF: sub_142F7+23j
		call	sub_25213

loc_14356:				; CODE XREF: sub_142F7+58j
		push	cs
		call	near ptr sub_1408E

loc_1435A:				; CODE XREF: sub_142F7+Fj
					; sub_142F7+17j
		pop	si
		pop	bp
		retf
sub_142F7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1435D	proc near		; CODE XREF: sub_137E6+15Fp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= dword	ptr  0Ch
arg_C		= word ptr  10h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	ax, [bp+arg_C]
		mov	word_4719A, ax
		mov	ax, [bp+arg_4]
		or	ax, [bp+arg_6]
		jz	short loc_143A7
		les	bx, [bp+arg_8]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, 4263h
		mov	dx, seg	seg000
		push	dx
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		nop
		push	cs
		call	near ptr sub_123F9
		jmp	short loc_143BF
; ---------------------------------------------------------------------------

loc_143A7:				; CODE XREF: sub_1435D+29j
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 41F7h
		mov	dx, seg	seg000
		push	dx
		push	ax
		push	cs
		call	near ptr sub_13F9E

loc_143BF:				; CODE XREF: sub_1435D+48j
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		pop	bp
		retn	0Eh
sub_1435D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_143D1	proc near		; CODE XREF: sub_137E6+179p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= dword	ptr  0Ch
arg_C		= word ptr  10h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	ax, [bp+arg_C]
		mov	word_4719A, ax
		mov	ax, [bp+arg_4]
		or	ax, [bp+arg_6]
		jz	short loc_1441B
		les	bx, [bp+arg_8]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, 42E4h
		mov	dx, seg	seg000
		push	dx
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		nop
		push	cs
		call	near ptr sub_123F9
		jmp	short loc_14433
; ---------------------------------------------------------------------------

loc_1441B:				; CODE XREF: sub_143D1+29j
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 4276h
		mov	dx, seg	seg000
		push	dx
		push	ax
		push	cs
		call	near ptr sub_13F9E

loc_14433:				; CODE XREF: sub_143D1+48j
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		pop	bp
		retn	0Eh
sub_143D1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14445	proc near		; CODE XREF: sub_137E6+71p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, 42F7h
		mov	dx, seg	seg000
		push	dx
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_123F9
		call	sub_2A980
		call	sub_2A9D4
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		pop	bp
		retn	8
sub_14445	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14496	proc near		; CODE XREF: sub_137E6+1DCp

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 39Ah
		push	ds
		push	ax
		call	sub_205C8
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	ax, [bp+arg_0]
		mov	word_4719A, ax
		jmp	short loc_144D5
; ---------------------------------------------------------------------------

loc_144C5:				; CODE XREF: sub_14496+44j
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_141F7
		push	cs
		call	near ptr sub_145DC
		or	ax, ax
		jnz	short loc_144DC

loc_144D5:				; CODE XREF: sub_14496+2Dj
		cmp	word_4DFA0, 0
		jg	short loc_144C5

loc_144DC:				; CODE XREF: sub_14496+3Dj
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		mov	ax, 39Ah
		push	ds
		push	ax
		call	sub_205C8
		pop	bp
		retn	2
sub_14496	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_144F8	proc near		; CODE XREF: sub_137E6+269p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 3A2h
		push	ds
		push	ax
		call	sub_205C8
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	ax, [bp+arg_0]
		mov	word_4719A, ax
		jmp	short loc_14537
; ---------------------------------------------------------------------------

loc_14527:				; CODE XREF: sub_144F8+45j
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_14276
		push	cs
		call	near ptr sub_145DC
		or	ax, ax
		jnz	short loc_1453F

loc_14537:				; CODE XREF: sub_144F8+2Dj
		cmp	word_4DFA0, 7CFh
		jl	short loc_14527

loc_1453F:				; CODE XREF: sub_144F8+3Dj
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		mov	ax, 3A2h
		push	ds
		push	ax
		call	sub_205C8
		pop	bp
		retn	2
sub_144F8	endp


; =============== S U B	R O U T	I N E =======================================


sub_1455B	proc near		; CODE XREF: sub_137E6:loc_13845p
		xor	ax, ax
		call	__chkstk
		mov	ax, 2
		push	ax
		push	word_471A0
		push	word_4719E
		nop
		push	cs
		call	near ptr sub_11C58
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	word_4DF98, 0
		jmp	short loc_145B0
; ---------------------------------------------------------------------------

loc_1458E:				; CODE XREF: sub_1455B+5Bj
		cmp	word_4DF98, 0
		jnz	short loc_145B8
		push	word_471A0
		push	word_4719E
		mov	ax, 2
		push	ax
		push	cs
		call	near ptr sub_142F7
		add	sp, 6
		push	cs
		call	near ptr sub_145DC
		or	ax, ax
		jnz	short loc_145B8

loc_145B0:				; CODE XREF: sub_1455B+31j
		cmp	word_4DFA0, 7CFh
		jl	short loc_1458E

loc_145B8:				; CODE XREF: sub_1455B+38j
					; sub_1455B+53j
		call	sub_2A980
		call	sub_2A9D4
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		sub	ax, ax
		push	ax
		push	word_471A0
		push	word_4719E
		nop
		push	cs
		call	near ptr sub_11C58
		retn
sub_1455B	endp


; =============== S U B	R O U T	I N E =======================================


sub_145DC	proc far		; CODE XREF: sub_14496+38p
					; sub_144F8+38p ...
		xor	ax, ax
		call	__chkstk

loc_145E3:				; CODE XREF: sub_145DC+33j
		mov	ax, 40Ah
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_26CF0
		or	ax, ax
		jz	short loc_14616
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_26E7B
		cmp	word_49084, 1
		jz	short loc_14611
		cmp	word_49084, 3
		jnz	short loc_145E3

loc_14611:				; CODE XREF: sub_145DC+2Cj
		mov	ax, 1
		jmp	short locret_14618
; ---------------------------------------------------------------------------

loc_14616:				; CODE XREF: sub_145DC+17j
		sub	ax, ax

locret_14618:				; CODE XREF: sub_145DC+38j
		retf
sub_145DC	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14619	proc far		; CODE XREF: sub_10167+16Cp

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, [bp+arg_4]
		cmp	ax, 56h	; 'V'
		jnz	short loc_1462F
		jmp	loc_14702
; ---------------------------------------------------------------------------

loc_1462F:				; CODE XREF: sub_14619+11j
		jbe	short loc_14634
		jmp	loc_14827
; ---------------------------------------------------------------------------

loc_14634:				; CODE XREF: sub_14619:loc_1462Fj
		cmp	ax, 46h	; 'F'
		jnz	short loc_1463C
		jmp	loc_147C6
; ---------------------------------------------------------------------------

loc_1463C:				; CODE XREF: sub_14619+1Ej
		jbe	short loc_14641
		jmp	loc_147FD
; ---------------------------------------------------------------------------

loc_14641:				; CODE XREF: sub_14619:loc_1463Cj
		cmp	ax, 30h	; '0'
		jnz	short loc_14649
		jmp	loc_14755
; ---------------------------------------------------------------------------

loc_14649:				; CODE XREF: sub_14619+2Bj
		jbe	short loc_1464E
		jmp	loc_147E5
; ---------------------------------------------------------------------------

loc_1464E:				; CODE XREF: sub_14619:loc_14649j
		cmp	ax, 3
		jz	short loc_14656
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14656:				; CODE XREF: sub_14619+38j
		nop
		push	cs
		call	near ptr sub_180E4
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1465E:				; CODE XREF: sub_14619+1E9j
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_14667
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14667:				; CODE XREF: sub_14619+49j
		nop
		push	cs
		call	near ptr sub_17F89
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1466F:				; CODE XREF: sub_14619+209j
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_14678
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14678:				; CODE XREF: sub_14619+5Aj
		nop
		push	cs
		call	near ptr sub_17E89
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14680:				; CODE XREF: sub_14619+1F9j
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_14689
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14689:				; CODE XREF: sub_14619+6Bj
		sub	ax, ax
		push	ax
		mov	ax, 8FF1h
		mov	dx, seg	seg000
		push	dx
		push	ax
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_18DDC
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146A0:				; CODE XREF: sub_14619+219j
					; DATA XREF: sub_14619+222o ...
		cmp	[bp+arg_0], 0
		jz	short loc_146A9
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146A9:				; CODE XREF: sub_14619+8Bj
		cmp	word_4E940, 0
		jnz	short loc_146B3
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146B3:				; CODE XREF: sub_14619+95j
		call	sub_2607A
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146BB:				; CODE XREF: sub_14619+1F1j
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_146C4
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146C4:				; CODE XREF: sub_14619+A6j
		call	sub_2625F
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146CC:				; CODE XREF: sub_14619+219j
					; DATA XREF: sub_14619:off_14837o ...
		cmp	[bp+arg_0], 0
		jz	short loc_146D5
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146D5:				; CODE XREF: sub_14619+B7j
		cmp	word_490AE, 0
		jge	short loc_146DF
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146DF:				; CODE XREF: sub_14619+C1j
		call	sub_2628D
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146E7:				; CODE XREF: sub_14619+1DEj
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_146F0
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146F0:				; CODE XREF: sub_14619+D2j
		cmp	word_490AE, 0
		jge	short loc_146FA
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_146FA:				; CODE XREF: sub_14619+DCj
		call	sub_26308
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14702:				; CODE XREF: sub_14619+13j
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_1470B
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1470B:				; CODE XREF: sub_14619+EDj
		cmp	word_4B488, 0
		jg	short loc_14715
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14715:				; CODE XREF: sub_14619+F7j
		call	sub_26352
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1471D:				; CODE XREF: sub_14619+201j
					; sub_14619+219j
					; DATA XREF: ...
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_142F7
		add	sp, 6
		call	sub_2A980
		call	sub_2A9D4
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14755:				; CODE XREF: sub_14619+2Dj
		cmp	[bp+arg_0], 0
		jz	short loc_1475E
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1475E:				; CODE XREF: sub_14619+140j
		cmp	word_4DF96, 0
		jz	short loc_1476D
		nop
		push	cs
		call	near ptr sub_1CE23
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1476D:				; CODE XREF: sub_14619+14Aj
		nop
		push	cs
		call	near ptr sub_1CE72
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14775:				; CODE XREF: sub_14619+1D7j
		cmp	[bp+arg_0], 0
		jz	short loc_1477E
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_1477E:				; CODE XREF: sub_14619+160j
		cmp	word_4879A, 0
		jnz	short loc_14788
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_14788:				; CODE XREF: sub_14619+16Aj
		mov	ax, [bp+arg_4]
		sub	ax, 31h	; '1'
		mov	[bp+var_4], ax
		mov	ax, word_4879A
		mov	[bp+var_2], ax

loc_14797:				; CODE XREF: sub_14619+195j
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		cmp	[bx+1Ch], ax
		jz	short loc_147B0
		mov	ax, [bx+18h]
		mov	[bp+var_2], ax
		mov	ax, word_4879A
		cmp	[bp+var_2], ax
		jnz	short loc_14797

loc_147B0:				; CODE XREF: sub_14619+187j
		mov	ax, word_4879A
		cmp	[bp+var_2], ax
		jnz	short loc_147BB
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147BB:				; CODE XREF: sub_14619+19Dj
		push	[bp+var_2]
		call	sub_24676
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147C6:				; CODE XREF: sub_14619+20j
					; sub_14619+219j
					; DATA XREF: ...
		cmp	[bp+arg_0], 0
		jz	short loc_147CF
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147CF:				; CODE XREF: sub_14619+1B1j
		cmp	word_4879A, 0
		jnz	short loc_147D9
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147D9:				; CODE XREF: sub_14619+1BBj
		push	word_4879A
		call	sub_24AF4
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147E5:				; CODE XREF: sub_14619+32j
		cmp	ax, 31h	; '1'
		jnb	short loc_147ED
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147ED:				; CODE XREF: sub_14619+1CFj
		cmp	ax, 39h	; '9'
		jbe	short loc_14775
		cmp	ax, 43h	; 'C'
		jnz	short loc_147FA
		jmp	loc_146E7
; ---------------------------------------------------------------------------

loc_147FA:				; CODE XREF: sub_14619+1DCj
		jmp	loc_1487D
; ---------------------------------------------------------------------------

loc_147FD:				; CODE XREF: sub_14619+25j
		cmp	ax, 4Ch	; 'L'
		jnz	short loc_14805
		jmp	loc_1465E
; ---------------------------------------------------------------------------

loc_14805:				; CODE XREF: sub_14619+1E7j
		cmp	ax, 4Dh	; 'M'
		jnz	short loc_1480D
		jmp	loc_146BB
; ---------------------------------------------------------------------------

loc_1480D:				; CODE XREF: sub_14619+1EFj
		cmp	ax, 50h	; 'P'
		jnz	short loc_14815
		jmp	loc_14680
; ---------------------------------------------------------------------------

loc_14815:				; CODE XREF: sub_14619+1F7j
		cmp	ax, 52h	; 'R'
		jnz	short loc_1481D
		jmp	loc_1471D
; ---------------------------------------------------------------------------

loc_1481D:				; CODE XREF: sub_14619+1FFj
		cmp	ax, 53h	; 'S'
		jnz	short loc_14825
		jmp	loc_1466F
; ---------------------------------------------------------------------------

loc_14825:				; CODE XREF: sub_14619+207j
		jmp	short loc_1487D
; ---------------------------------------------------------------------------

loc_14827:				; CODE XREF: sub_14619+18j
		sub	ax, 58h	; 'X'
		cmp	ax, 22h	; '"'
		ja	short loc_1487D
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_14837[bx]
; ---------------------------------------------------------------------------
off_14837	dw offset loc_146CC	; DATA XREF: sub_14619+219r
		dw offset loc_1487D
		dw offset loc_146A0
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_146E7
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_147C6
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_1465E
		dw offset loc_146BB
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_14680
		dw offset loc_1487D
		dw offset loc_1471D
		dw offset loc_1466F
		dw offset loc_1487D
		dw offset loc_1487D
		dw offset loc_14702
		dw offset loc_1487D
		dw offset loc_146CC
		dw offset loc_1487D
		dw offset loc_146A0
; ---------------------------------------------------------------------------

loc_1487D:				; CODE XREF: sub_14619+3Aj
					; sub_14619+42j ...
		mov	sp, bp
		pop	bp
		retf	6
sub_14619	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14883	proc far		; CODE XREF: sub_10167+180p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		cmp	ax, 47h	; 'G'
		jz	short loc_148EA
		cmp	ax, 49h	; 'I'
		jz	short loc_148B1
		cmp	ax, 4Bh	; 'K'
		jz	short loc_148B9
		cmp	ax, 4Dh	; 'M'
		jz	short loc_148FB
		cmp	ax, 4Fh	; 'O'
		jz	short loc_148E3
		cmp	ax, 51h	; 'Q'
		jz	short loc_148F3
		jmp	loc_14932
; ---------------------------------------------------------------------------

loc_148B1:				; CODE XREF: sub_14883+15j
		mov	word_4719A, 0Ah
		jmp	short loc_148BF
; ---------------------------------------------------------------------------

loc_148B9:				; CODE XREF: sub_14883+1Aj
		mov	word_4719A, 1

loc_148BF:				; CODE XREF: sub_14883+34j
		cmp	word_4DFA0, 0
		jle	short loc_14932
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_141F7
		jmp	short loc_14924
; ---------------------------------------------------------------------------

loc_148E3:				; CODE XREF: sub_14883+24j
		mov	ax, word_490B8
		or	ax, ax
		jge	short loc_148EC

loc_148EA:				; CODE XREF: sub_14883+10j
		sub	ax, ax

loc_148EC:				; CODE XREF: sub_14883+65j
		push	ax
		push	cs
		call	near ptr sub_14185
		jmp	short loc_14932
; ---------------------------------------------------------------------------

loc_148F3:				; CODE XREF: sub_14883+29j
		mov	word_4719A, 0Ah
		jmp	short loc_14901
; ---------------------------------------------------------------------------

loc_148FB:				; CODE XREF: sub_14883+1Fj
		mov	word_4719A, 1

loc_14901:				; CODE XREF: sub_14883+76j
		cmp	word_4DFA0, 7CFh
		jge	short loc_14932
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_14276

loc_14924:				; CODE XREF: sub_14883+5Ej
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_14932:				; CODE XREF: sub_14883+2Bj
					; sub_14883+41j ...
		pop	bp
		retf	2
sub_14883	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14936	proc near		; CODE XREF: sub_135EB+A7p
					; sub_135EB+B3p ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	si
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_321A6
		mov	ax, [bp+arg_0]
		neg	ax
		mov	si, ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	si
		push	si
		call	sub_20513
		mov	al, byte ptr [bp+arg_0]
		mov	byte_490A6, al
		mov	byte_490B0, al
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_233FE
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		mov	ax, 0Fh
		push	ax
		call	sub_20B78
		push	[bp+var_6]
		push	[bp+var_8]
		call	sub_20892
		push	[bp+arg_0]
		push	[bp+arg_0]
		call	sub_2065B
		push	[bp+var_6]
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		call	sub_20892
		push	[bp+arg_0]
		mov	ax, [bp+arg_0]
		neg	ax
		push	ax
		call	sub_2065B
		mov	ax, [bp+var_2]
		dec	ax
		push	ax
		push	[bp+var_8]
		call	sub_20892
		mov	ax, [bp+arg_0]
		neg	ax
		push	ax
		push	[bp+arg_0]
		call	sub_2065B
		mov	ax, [bp+var_2]
		dec	ax
		push	ax
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		call	sub_20892
		mov	ax, [bp+arg_0]
		neg	ax
		mov	si, ax
		push	si
		push	si
		call	sub_2065B
		pop	si
		mov	sp, bp
		pop	bp
		retn	6
sub_14936	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================


sub_149FC	proc far		; CODE XREF: sub_23E78+78P
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		push	ax
		call	sub_1532C
		mov	ax, 77Ch
		mov	word_471C6, ax
		mov	word_471C8, ds
		mov	word_471C2, ax
		mov	word_471C4, ds
		mov	word_471BE, ax
		mov	word_471C0, ds
		mov	word_471BA, ax
		mov	word_471BC, ds
		mov	ax, 0FFFFh
		mov	word_471D2, ax
		mov	word_471B2, ax
		mov	word ptr dword_471A8, offset loc_162FC
		mov	word ptr dword_471A8+2,	seg seg000
		mov	word_471B0, 1
		mov	word_490A0, 0
		retf
sub_149FC	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14A4B	proc far		; CODE XREF: sub_21616+3FEP
					; sub_25129+14P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_1618F
		pop	bp
		retf	8
sub_14A4B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14A6C	proc far		; CODE XREF: sub_25149+4BP
					; sub_2528A+67P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0A66h
		push	ds
		push	ax
		call	sub_1618F
		pop	bp
		retf	8
sub_14A6C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14A8E	proc far		; CODE XREF: sub_15564+6Bp
					; sub_1618F+FEp ...

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		les	bx, es:[bx]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		jmp	short loc_14AFD
; ---------------------------------------------------------------------------

loc_14AB4:				; CODE XREF: sub_14A8E+77j
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		nop
		push	cs
		call	near ptr sub_1AEAD
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_14AFD:				; CODE XREF: sub_14A8E+24j
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jnz	short loc_14AB4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		mov	ax, 0FFF8h
		push	ax
		mov	ax, 0FFFCh
		push	ax
		call	sub_20513
		push	[bp+var_2]
		push	[bp+var_4]
		call	dword_471A8
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 8
		push	ax
		mov	ax, 4
		push	ax
		call	sub_20513
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_23C12
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D
		mov	sp, bp
		pop	bp
		retf	4
sub_14A8E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14B6B	proc far		; CODE XREF: sub_15564+87p
					; sub_15AF5+32p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_233D4
		mov	byte_490A6, 4
		mov	byte_490B0, 2
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 0FFFCh
		push	ax
		mov	ax, 0FFFEh
		push	ax
		call	sub_20513
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_233FE
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		mov	ax, 0Fh
		push	ax
		call	sub_20B78
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 0FFFEh
		push	ax
		mov	ax, 0FFFFh
		push	ax
		call	sub_20513
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_201CE
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 0FFFEh
		push	ax
		mov	ax, 0FFFFh
		push	ax
		call	sub_20513
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_233FE
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 8
		push	ax
		mov	ax, 4
		push	ax
		call	sub_20513
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_11668
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4
sub_14B6B	endp


; =============== S U B	R O U T	I N E =======================================


sub_14C44	proc far		; CODE XREF: sub_17551+2Fp
					; sub_21616+1DBP ...
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		mov	word_471B8, ax
		mov	word_471B6, ax
		mov	word_471CC, ax
		mov	word_471B4, ax
		retf
sub_14C44	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14C5A	proc far		; CODE XREF: sub_16592+347p
					; seg001:2854P	...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	[bp+var_2], 0
		nop
		push	cs
		call	near ptr sub_1FBD0
		mov	word_471AC, ax
		mov	word_471AE, dx
		mov	cx, word_471B6
		mov	bx, word_471B8
		add	cx, 1Eh
		adc	bx, 0
		cmp	dx, bx
		jnb	short loc_14C8B
		jmp	loc_14D18
; ---------------------------------------------------------------------------

loc_14C8B:				; CODE XREF: sub_14C5A+2Cj
		ja	short loc_14C94
		cmp	ax, cx
		ja	short loc_14C94
		jmp	loc_14D18
; ---------------------------------------------------------------------------

loc_14C94:				; CODE XREF: sub_14C5A:loc_14C8Bj
					; sub_14C5A+35j
		mov	ax, word_471AC
		mov	dx, word_471AE
		mov	word_471B6, ax
		mov	word_471B8, dx
		cmp	word_471CC, 1
		sbb	ax, ax
		neg	ax
		mov	word_471CC, ax
		mov	[bp+var_2], 1
		cmp	word_471B4, 0
		jz	short loc_14CE5
		mov	ax, word_471CA
		cmp	[bp+arg_4], ax
		jnz	short loc_14CD2
		mov	ax, word_471CE
		cmp	[bp+arg_2], ax
		jnz	short loc_14CD2
		mov	ax, word_471D0
		cmp	[bp+arg_0], ax
		jz	short loc_14CE5

loc_14CD2:				; CODE XREF: sub_14C5A+66j
					; sub_14C5A+6Ej
		mov	ax, 0Fh
		push	ax
		push	word_471CA
		push	word_471CE
		push	word_471D0
		call	sub_14D40

loc_14CE5:				; CODE XREF: sub_14C5A+5Ej
					; sub_14C5A+76j
		mov	ax, [bp+arg_4]
		mov	word_471CA, ax
		mov	ax, [bp+arg_2]
		mov	word_471CE, ax
		mov	ax, [bp+arg_0]
		mov	word_471D0, ax
		cmp	word_471CC, 0
		jz	short loc_14D02
		sub	ax, ax
		jmp	short loc_14D05
; ---------------------------------------------------------------------------

loc_14D02:				; CODE XREF: sub_14C5A+A2j
		mov	ax, 0Fh

loc_14D05:				; CODE XREF: sub_14C5A+A6j
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_14D40
		mov	word_471B4, 1

loc_14D18:				; CODE XREF: sub_14C5A+2Ej
					; sub_14C5A+37j
		mov	sp, bp
		pop	bp
		retf	6
sub_14C5A	endp


; =============== S U B	R O U T	I N E =======================================


sub_14D1E	proc far		; CODE XREF: sub_21616:loc_21CF7P
					; sub_22536+17CP ...
		xor	ax, ax
		call	__chkstk
		cmp	word_471B4, 0
		jz	short locret_14D3F
		mov	ax, 0Fh
		push	ax
		push	word_471CA
		push	word_471CE
		push	word_471D0
		call	sub_14D40

locret_14D3F:				; CODE XREF: sub_14D1E+Cj
		retf
sub_14D1E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14D40	proc near		; CODE XREF: sub_14C5A+88p
					; sub_14C5A+B5p ...

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		call	sub_204C2
		mov	[bp+var_2], ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_20892
		push	[bp+arg_6]
		call	sub_20B78
		sub	ax, ax
		push	ax
		mov	ax, [bp+arg_0]
		sub	ax, [bp+arg_2]
		push	ax
		call	sub_2065B
		push	[bp+var_2]
		call	sub_20B78
		mov	sp, bp
		pop	bp
		retn	8
sub_14D40	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14D83	proc far		; CODE XREF: sub_1744E+E1p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 4
		push	ax
		call	sub_14DB0
		pop	bp
		retf	10h
sub_14D83	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_14DB0	proc near		; CODE XREF: sub_14D83+26p
					; sub_16068+A1p

var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= dword	ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= byte ptr -9Ah
var_72		= word ptr -72h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= word ptr -68h
var_66		= dword	ptr -66h
var_62		= byte ptr -62h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= byte ptr -48h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= dword	ptr  0Ch
arg_C		= word ptr  10h
arg_E		= word ptr  12h
arg_10		= word ptr  14h
arg_4E		= byte ptr  52h

		push	bp
		mov	bp, sp
		mov	ax, 0A4h ; '�'
		call	__chkstk
		push	di
		push	si
		test	[bp+arg_0], 2
		jz	short loc_14DC8
		mov	ax, 0AAEh
		jmp	short loc_14DCB
; ---------------------------------------------------------------------------

loc_14DC8:				; CODE XREF: sub_14DB0+11j
		mov	ax, 0AB4h

loc_14DCB:				; CODE XREF: sub_14DB0+16j
		mov	word ptr [bp+var_5C], ax
		mov	word ptr [bp+var_5C+2],	ds
		lea	ax, [bp+var_18]
		push	ss
		push	ax
		call	sub_20483
		mov	ax, [bp+var_18]
		add	ax, [bp+var_16]
		add	ax, [bp+var_12]
		mov	[bp+var_2], ax
		test	[bp+arg_0], 1
		jz	short loc_14E00
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jnz	short loc_14E00
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		call	sub_233D4

loc_14E00:				; CODE XREF: sub_14DB0+3Bj
					; sub_14DB0+43j
		sub	ax, ax
		push	ax
		call	sub_20ADE
		mov	ax, [bp+arg_C]
		add	ax, [bp+arg_E]
		mov	dx, [bp+arg_10]
		mov	[bp+var_1E], ax
		mov	[bp+var_1C], dx
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		mov	[bp+var_72], ax
		mov	ax, es:[bx]
		add	ax, [bp+var_18]
		mov	[bp+var_54], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_50], ax
		mov	[bp+var_5E], 0
		mov	ax, [bp+arg_E]
		mov	word ptr [bp+var_70], ax
		mov	word ptr [bp+var_70+2],	dx

loc_14E43:				; CODE XREF: sub_14DB0+571j
		test	[bp+arg_0], 4
		jz	short loc_14E6D
		mov	ax, [bp+var_54]
		sub	ax, [bp+var_12]
		add	ax, [bp+var_2]
		les	bx, [bp+arg_8]
		cmp	ax, es:[bx+4]
		jbe	short loc_14E6D
		mov	ax, [bp+var_50]
		add	ax, [bp+var_8]
		push	ax

loc_14E62:				; CODE XREF: sub_14DB0+568j
		push	[bp+var_54]
		call	sub_20892
		jmp	loc_15324
; ---------------------------------------------------------------------------

loc_14E6D:				; CODE XREF: sub_14DB0+97j
					; sub_14DB0+A9j
		sub	ax, ax
		mov	[bp+var_68], ax
		mov	[bp+var_52], ax
		mov	[bp+var_8], ax
		lea	ax, [bp+var_48]
		mov	word ptr [bp+var_66], ax
		mov	word ptr [bp+var_66+2],	ss
		mov	[bp+var_60], 0
		lea	ax, [bp+var_9A]
		mov	cx, 28h	; '('
		mov	di, ax
		push	ss
		pop	es
		mov	ax, 0FFh
		repne stosb
		mov	dx, es

loc_14E98:				; CODE XREF: sub_14DB0+38Bj
					; sub_14DB0+394j ...
		mov	[bp+var_6], 0
		cmp	[bp+var_5E], 0
		jz	short loc_14EA6
		jmp	loc_14F86
; ---------------------------------------------------------------------------

loc_14EA6:				; CODE XREF: sub_14DB0+F1j
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_1C]
		cmp	word ptr [bp+var_70], ax
		jb	short loc_14EDF

loc_14EB1:				; CODE XREF: sub_14DB0:loc_14F8Fj
					; sub_14DB0+352j
		les	bx, [bp+var_66]
		mov	byte ptr es:[bx], 0
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+2]
		mov	[bp+var_50], ax
		mov	ax, [bp+arg_6]
		cmp	ax, 0FFFFh
		jnz	short loc_14ECD
		jmp	loc_151C8
; ---------------------------------------------------------------------------

loc_14ECD:				; CODE XREF: sub_14DB0+118j
		or	ax, ax
		jnz	short loc_14ED4
		jmp	loc_15188
; ---------------------------------------------------------------------------

loc_14ED4:				; CODE XREF: sub_14DB0+11Fj
		cmp	ax, 1
		jnz	short loc_14EDC
		jmp	loc_1517D
; ---------------------------------------------------------------------------

loc_14EDC:				; CODE XREF: sub_14DB0+127j
		jmp	loc_15188
; ---------------------------------------------------------------------------

loc_14EDF:				; CODE XREF: sub_14DB0+FFj
		les	bx, [bp+var_70]
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_14EED
		jmp	loc_150A3
; ---------------------------------------------------------------------------

loc_14EED:				; CODE XREF: sub_14DB0+138j
		cmp	ax, 1
		jnz	short loc_14EF5
		jmp	loc_14F92
; ---------------------------------------------------------------------------

loc_14EF5:				; CODE XREF: sub_14DB0+140j
		cmp	ax, 0Ah
		jz	short loc_14F69
		cmp	ax, 0Dh
		jz	short loc_14F69
		cmp	ax, 20h	; ' '
		jnz	short loc_14F07
		jmp	loc_15004
; ---------------------------------------------------------------------------

loc_14F07:				; CODE XREF: sub_14DB0+152j
		cmp	ax, 5Eh	; '^'
		jnz	short loc_14F0F
		jmp	loc_15057
; ---------------------------------------------------------------------------

loc_14F0F:				; CODE XREF: sub_14DB0+15Aj
		mov	ax, bx
		mov	dx, es
		mov	word ptr [bp+var_A0], ax
		mov	word ptr [bp+var_A0+2],	dx
		push	word ptr [bp+var_5C+2]
		push	word ptr [bp+var_5C] ; char *
		push	dx
		push	ax		; char *
		call	_strcspn
		add	sp, 8
		add	word ptr [bp+var_70], ax
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_1C]
		cmp	word ptr [bp+var_70], ax
		jbe	short loc_14F3F
		mov	word ptr [bp+var_70], ax
		mov	word ptr [bp+var_70+2],	dx

loc_14F3F:				; CODE XREF: sub_14DB0+187j
		mov	ax, word ptr [bp+var_70]
		sub	ax, word ptr [bp+var_A0]
		mov	[bp+var_5E], ax
		mov	cl, 3
		shl	ax, cl
		mov	[bp+var_4A], ax
		test	[bp+arg_0], 4
		jz	short loc_14F86
		add	ax, [bp+var_8]
		add	ax, [bp+var_52]
		cmp	ax, [bp+var_72]
		jbe	short loc_14F86
		cmp	[bp+var_8], 0
		jz	short loc_14F86
		jmp	short loc_14F81
; ---------------------------------------------------------------------------

loc_14F69:				; CODE XREF: sub_14DB0+148j
					; sub_14DB0+14Dj
		inc	word ptr [bp+var_70]
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_1C]
		cmp	word ptr [bp+var_70], ax
		jnz	short loc_14F81
		cmp	word ptr [bp+var_70+2],	dx
		jnz	short loc_14F81
		mov	[bp+var_60], 1

loc_14F81:				; CODE XREF: sub_14DB0+1B7j
					; sub_14DB0+1C5j ...
		mov	[bp+var_6], 1

loc_14F86:				; CODE XREF: sub_14DB0+F3j
					; sub_14DB0+1A4j ...
		cmp	[bp+var_6], 0
		jnz	short loc_14F8F
		jmp	loc_150AE
; ---------------------------------------------------------------------------

loc_14F8F:				; CODE XREF: sub_14DB0+1DAj
		jmp	loc_14EB1
; ---------------------------------------------------------------------------

loc_14F92:				; CODE XREF: sub_14DB0+142j
		les	bx, [bp+var_70]
		mov	al, es:[bx+1]
		cbw
		cmp	ax, 42h	; 'B'
		jz	short loc_14FD6
		cmp	ax, 43h	; 'C'
		jz	short loc_14FB5
		cmp	ax, 46h	; 'F'
		jz	short loc_14FAE
		cmp	ax, 4Ah	; 'J'
		jz	short loc_14FF2

loc_14FAE:				; CODE XREF: sub_14DB0+1F7j
					; sub_14DB0+213j ...
		add	word ptr [bp+var_70], 4
		jmp	loc_150A6
; ---------------------------------------------------------------------------

loc_14FB5:				; CODE XREF: sub_14DB0+1F2j
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_14FC5
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jz	short loc_14FAE

loc_14FC5:				; CODE XREF: sub_14DB0+20Bj
		les	bx, [bp+var_70]
		mov	al, es:[bx+2]
		mov	si, word ptr [bp+var_66]
		sub	si, bp
		mov	byte ptr [bp+si+var_52], al
		jmp	short loc_14FAE
; ---------------------------------------------------------------------------

loc_14FD6:				; CODE XREF: sub_14DB0+1EDj
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_14FE6
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jz	short loc_14FAE

loc_14FE6:				; CODE XREF: sub_14DB0+22Cj
		les	bx, [bp+var_70]
		mov	al, es:[bx+2]
		mov	byte_48766, al
		jmp	short loc_14FAE
; ---------------------------------------------------------------------------

loc_14FF2:				; CODE XREF: sub_14DB0+1FCj
		mov	al, es:[bx+2]
		cbw
		mov	ch, es:[bx+3]
		sub	cl, cl
		or	cx, ax
		mov	[bp+arg_6], cx
		jmp	short loc_14FAE
; ---------------------------------------------------------------------------

loc_15004:				; CODE XREF: sub_14DB0+154j
		mov	ax, bx
		mov	dx, es
		mov	word ptr [bp+var_4E], ax
		mov	word ptr [bp+var_4E+2],	dx
		mov	[bp+var_A2], ds
		lds	si, [bp+var_70]

loc_15015:				; CODE XREF: sub_14DB0+270j
					; sub_14DB0+275j
		inc	si
		cmp	byte ptr [si], 20h ; ' '
		jnz	short loc_15027
		mov	ax, ds
		cmp	si, [bp+var_1E]
		jnz	short loc_15015
		cmp	ax, [bp+var_1C]
		jnz	short loc_15015

loc_15027:				; CODE XREF: sub_14DB0+269j
		mov	word ptr [bp+var_70], si
		mov	word ptr [bp+var_70+2],	ds
		mov	ds, [bp+var_A2]
		mov	ax, si
		sub	ax, word ptr [bp+var_4E]
		mov	[bp+var_68], ax
		mov	cl, 3
		shl	ax, cl
		mov	[bp+var_52], ax
		test	[bp+arg_0], 4
		jnz	short loc_15049
		jmp	loc_14F86
; ---------------------------------------------------------------------------

loc_15049:				; CODE XREF: sub_14DB0+294j
		add	ax, [bp+var_8]
		cmp	ax, [bp+var_72]
		ja	short loc_15054
		jmp	loc_14F86
; ---------------------------------------------------------------------------

loc_15054:				; CODE XREF: sub_14DB0+29Fj
		jmp	loc_14F81
; ---------------------------------------------------------------------------

loc_15057:				; CODE XREF: sub_14DB0+15Cj
		test	[bp+arg_0], 2
		jz	short loc_150A3
		les	bx, [bp+var_70]
		mov	al, es:[bx+1]
		cbw
		sub	ax, 30h	; '0'
		mov	[bp+var_9C], ax
		or	ax, ax
		jl	short loc_150A3
		cmp	ax, 3
		jg	short loc_150A3
		mov	bx, ax
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx+61DAh]
		mov	dx, [bx+61DCh]
		mov	word ptr [bp+var_A0], ax
		mov	word ptr [bp+var_A0+2],	dx
		les	di, [bp+var_A0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	[bp+var_5E], cx
		add	word ptr [bp+var_70], 2
		jmp	loc_14F86
; ---------------------------------------------------------------------------

loc_150A3:				; CODE XREF: sub_14DB0+13Aj
					; sub_14DB0+2ABj ...
		inc	word ptr [bp+var_70]

loc_150A6:				; CODE XREF: sub_14DB0+202j
		mov	[bp+var_5E], 0
		jmp	loc_14F86
; ---------------------------------------------------------------------------

loc_150AE:				; CODE XREF: sub_14DB0+1DCj
		cmp	[bp+var_5E], 0
		jnz	short loc_150B7
		jmp	loc_1513E
; ---------------------------------------------------------------------------

loc_150B7:				; CODE XREF: sub_14DB0+302j
		cmp	[bp+var_68], 0
		jz	short loc_150E8
		push	[bp+var_68]	; size_t
		push	word ptr [bp+var_4E+2]
		push	word ptr [bp+var_4E] ; char *
		push	word ptr [bp+var_66+2]
		push	word ptr [bp+var_66] ; char *
		call	_strncpy
		add	sp, 0Ah
		mov	ax, [bp+var_68]
		add	word ptr [bp+var_66], ax
		mov	ax, [bp+var_52]
		add	[bp+var_8], ax
		sub	ax, ax
		mov	[bp+var_52], ax
		mov	[bp+var_68], ax

loc_150E8:				; CODE XREF: sub_14DB0+30Bj
		test	[bp+arg_0], 4
		jz	short loc_15105
		push	[bp+var_5E]
		mov	ax, [bp+var_72]
		sub	ax, [bp+var_8]
		push	ax
		call	sub_16146
		mov	[bp+var_1A], ax
		or	ax, ax
		jnz	short loc_1510B
		jmp	loc_14EB1
; ---------------------------------------------------------------------------

loc_15105:				; CODE XREF: sub_14DB0+33Cj
		mov	ax, [bp+var_5E]
		mov	[bp+var_1A], ax

loc_1510B:				; CODE XREF: sub_14DB0+350j
		push	[bp+var_1A]	; size_t
		push	word ptr [bp+var_A0+2]
		push	word ptr [bp+var_A0] ; char *
		push	word ptr [bp+var_66+2]
		push	word ptr [bp+var_66] ; char *
		call	_strncpy
		add	sp, 0Ah
		mov	ax, [bp+var_1A]
		mov	cl, 3
		shl	ax, cl
		add	[bp+var_8], ax
		mov	ax, [bp+var_1A]
		add	word ptr [bp+var_66], ax
		sub	[bp+var_5E], ax
		add	word ptr [bp+var_A0], ax
		jmp	loc_14E98
; ---------------------------------------------------------------------------

loc_1513E:				; CODE XREF: sub_14DB0+304j
		cmp	[bp+var_68], 0
		jnz	short loc_15147
		jmp	loc_14E98
; ---------------------------------------------------------------------------

loc_15147:				; CODE XREF: sub_14DB0+392j
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_1C]
		cmp	word ptr [bp+var_70], ax
		jnb	short loc_15155
		jmp	loc_14E98
; ---------------------------------------------------------------------------

loc_15155:				; CODE XREF: sub_14DB0+3A0j
		cmp	[bp+var_5E], 0
		jz	short loc_1515E
		jmp	loc_14E98
; ---------------------------------------------------------------------------

loc_1515E:				; CODE XREF: sub_14DB0+3A9j
		mov	ax, [bp+var_68]
		mov	[bp+var_5E], ax
		mov	ax, word ptr [bp+var_4E]
		mov	dx, word ptr [bp+var_4E+2]
		mov	word ptr [bp+var_A0], ax
		mov	word ptr [bp+var_A0+2],	dx
		sub	ax, ax
		mov	[bp+var_52], ax
		mov	[bp+var_68], ax
		jmp	loc_14E98
; ---------------------------------------------------------------------------

loc_1517D:				; CODE XREF: sub_14DB0+129j
		mov	ax, [bp+var_72]
		sub	ax, [bp+var_8]
		shr	ax, 1

loc_15185:				; CODE XREF: sub_14DB0+41Ej
		add	[bp+var_50], ax

loc_15188:				; CODE XREF: sub_14DB0+121j
					; sub_14DB0:loc_14EDCj
		test	byte ptr [bp+var_50], 1
		jz	short loc_15191
		inc	[bp+var_50]

loc_15191:				; CODE XREF: sub_14DB0+3DCj
		mov	ax, word ptr [bp+var_66]
		mov	dx, word ptr [bp+var_66+2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		sub	ax, bp
		add	ax, 48h	; 'H'
		mov	[bp+var_4], ax
		lea	ax, [bp+var_48]
		mov	word ptr [bp+var_66], ax
		mov	word ptr [bp+var_66+2],	ss
		lea	ax, [bp+var_9A]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	ss
		mov	si, [bp+var_4]
		lea	ax, [bp+si+var_9A]
		mov	word ptr [bp+var_58], ax
		mov	word ptr [bp+var_58+2],	ss
		jmp	loc_152C2
; ---------------------------------------------------------------------------

loc_151C8:				; CODE XREF: sub_14DB0+11Aj
		mov	ax, [bp+var_72]
		sub	ax, [bp+var_8]
		jmp	short loc_15185
; ---------------------------------------------------------------------------

loc_151D0:				; CODE XREF: sub_14DB0+42Dj
		cmp	byte ptr es:[di], 0FFh
		jnz	short loc_151DF
		inc	di

loc_151D7:				; CODE XREF: sub_14DB0+527j
		mov	ax, es
		mov	cx, ds
		cmp	di, si
		jb	short loc_151D0

loc_151DF:				; CODE XREF: sub_14DB0+424j
		mov	ds, [bp+var_A4]
		mov	word ptr [bp+var_10], di
		mov	word ptr [bp+var_10+2],	es
		mov	si, di
		sub	si, bp
		lea	ax, [bp+si+arg_4E]
		mov	word ptr [bp+var_6C], ax
		mov	word ptr [bp+var_6C+2],	ss
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jz	short loc_1522D
		les	bx, [bp+var_6C]
		mov	al, es:[bx]
		mov	[bp+var_62], al
		mov	byte ptr es:[bx], 0
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_50]
		push	[bp+var_54]
		push	word ptr [bp+var_66+2]
		push	word ptr [bp+var_66]
		call	sub_1FF54
		les	bx, [bp+var_6C]
		mov	al, [bp+var_62]
		mov	es:[bx], al
		jmp	short loc_15245
; ---------------------------------------------------------------------------

loc_1522D:				; CODE XREF: sub_14DB0+44Cj
		push	[bp+var_50]
		push	[bp+var_54]
		push	word ptr [bp+var_66+2]
		push	word ptr [bp+var_66]
		mov	ax, word ptr [bp+var_6C]
		sub	ax, word ptr [bp+var_66]
		push	ax
		call	sub_23537

loc_15245:				; CODE XREF: sub_14DB0+47Bj
		mov	ax, word ptr [bp+var_6C]
		sub	ax, word ptr [bp+var_66]
		mov	cl, 3
		shl	ax, cl
		add	[bp+var_50], ax
		push	[bp+var_50]
		push	[bp+var_54]
		call	sub_20892
		mov	ax, word ptr [bp+var_58]
		mov	dx, word ptr [bp+var_58+2]
		cmp	word ptr [bp+var_10], ax
		jnz	short loc_152A5
		cmp	word ptr [bp+var_10+2],	dx
		jnz	short loc_152A5
		les	bx, [bp+var_10]
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_15281
		mov	al, es:[bx]
		sub	ah, ah
		push	ax
		call	sub_20AC6

loc_15281:				; CODE XREF: sub_14DB0+4C4j
					; sub_14DB0+51Bj
		cmp	[bp+var_5E], 0
		jz	short loc_1528A
		jmp	loc_1531B
; ---------------------------------------------------------------------------

loc_1528A:				; CODE XREF: sub_14DB0+4D5j
		mov	ax, [bp+var_1E]
		mov	dx, [bp+var_1C]
		cmp	word ptr [bp+var_70], ax
		jnb	short loc_15298
		jmp	loc_1531B
; ---------------------------------------------------------------------------

loc_15298:				; CODE XREF: sub_14DB0+4E3j
		cmp	[bp+arg_6], 1
		jnz	short loc_152DA
		mov	ax, [bp+var_52]
		shr	ax, 1
		jmp	short loc_152DD
; ---------------------------------------------------------------------------

loc_152A5:				; CODE XREF: sub_14DB0+4B6j
					; sub_14DB0+4BBj
		les	bx, [bp+var_10]
		mov	al, es:[bx]
		sub	ah, ah
		push	ax
		call	sub_20AC6
		inc	word ptr [bp+var_10]
		mov	ax, word ptr [bp+var_6C]
		mov	dx, word ptr [bp+var_6C+2]
		mov	word ptr [bp+var_66], ax
		mov	word ptr [bp+var_66+2],	dx

loc_152C2:				; CODE XREF: sub_14DB0+415j
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		cmp	word ptr [bp+var_66], ax
		jnb	short loc_15281
		les	di, [bp+var_10]
		mov	[bp+var_A4], ds
		lds	si, [bp+var_58]
		jmp	loc_151D7
; ---------------------------------------------------------------------------

loc_152DA:				; CODE XREF: sub_14DB0+4ECj
		mov	ax, [bp+var_52]

loc_152DD:				; CODE XREF: sub_14DB0+4F3j
		add	[bp+var_50], ax
		cmp	[bp+var_60], 0
		jnz	short loc_152F2
		les	bx, [bp+arg_8]
		mov	ax, [bp+var_50]
		cmp	es:[bx+6], ax
		jg	short loc_15315

loc_152F2:				; CODE XREF: sub_14DB0+534j
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+2]
		mov	[bp+var_50], ax
		cmp	[bp+arg_6], 1
		jnz	short loc_1530F
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		sar	ax, 1
		add	[bp+var_50], ax

loc_1530F:				; CODE XREF: sub_14DB0+550j
		mov	ax, [bp+var_2]
		add	[bp+var_54], ax

loc_15315:				; CODE XREF: sub_14DB0+540j
		push	[bp+var_50]
		jmp	loc_14E62
; ---------------------------------------------------------------------------

loc_1531B:				; CODE XREF: sub_14DB0+4D7j
					; sub_14DB0+4E5j
		mov	ax, [bp+var_2]
		add	[bp+var_54], ax
		jmp	loc_14E43
; ---------------------------------------------------------------------------

loc_15324:				; CODE XREF: sub_14DB0+BAj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	12h
sub_14DB0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1532C	proc near		; CODE XREF: sub_149FC+Bp

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_1534C
		mov	word ptr dword_471A4, offset loc_15C59
		mov	word ptr dword_471A4+2,	seg seg000
		jmp	short loc_15359
; ---------------------------------------------------------------------------

loc_1534C:				; CODE XREF: sub_1532C+10j
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word ptr dword_471A4, ax
		mov	word ptr dword_471A4+2,	dx

loc_15359:				; CODE XREF: sub_1532C+1Ej
		mov	word_490A0, 0
		pop	bp
		retn	4
sub_1532C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15363	proc far		; CODE XREF: sub_15481+15p
					; sub_154F5+15p ...

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_2]
		les	bx, es:[bx]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		jmp	short loc_153AA
; ---------------------------------------------------------------------------

loc_15389:				; CODE XREF: sub_15363+97j
		les	bx, [bp+var_4]
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]

loc_153AA:				; CODE XREF: sub_15363+24j
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		or	ax, dx
		jz	short loc_15430
		push	dx
		push	word ptr [bp+var_C]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_C]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_4]
		les	bx, es:[bx+20h]
		les	bx, es:[bx]
		mov	ax, [bp+arg_0]
		cmp	es:[bx], ax
		jnz	short loc_15389
		les	bx, [bp+var_4]
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, word ptr [bp+var_C]
		mov	dx, word ptr [bp+var_C+2]
		jmp	short loc_15444
; ---------------------------------------------------------------------------

loc_15430:				; CODE XREF: sub_15363+4Fj
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 150Ch
		sub	ax, ax
		cwd

loc_15444:				; CODE XREF: sub_15363+CBj
		mov	sp, bp
		pop	bp
		retf	6
sub_15363	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1544A	proc far		; CODE XREF: sub_16592+1E4p
					; sub_16592+4B7p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, word ptr dword_471A8
		mov	dx, word ptr dword_471A8+2
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word ptr dword_471A8, ax
		mov	word ptr dword_471A8+2,	dx
		mov	word_490A0, 0
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf	4
sub_1544A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15481	proc far		; CODE XREF: seg001:4E58P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		push	[bp+arg_4]
		push	cs
		call	near ptr sub_15363
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		or	dx, ax
		jz	short loc_154DF
		push	[bp+var_6]
		push	ax
		nop
		push	cs
		call	near ptr sub_11BC2
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_321A6
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		les	bx, [bp+arg_6]
		les	bx, es:[bx]
		push	word ptr es:[bx+2]
		les	bx, [bp+arg_6]
		les	bx, es:[bx]
		push	word ptr es:[bx]
		call	sub_208AA
		jmp	short loc_154EF
; ---------------------------------------------------------------------------

loc_154DF:				; CODE XREF: sub_15481+20j
		les	bx, [bp+arg_0]
		sub	ax, ax
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax

loc_154EF:				; CODE XREF: sub_15481+5Cj
		mov	sp, bp
		pop	bp
		retf	0Ah
sub_15481	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_154F5	proc far		; CODE XREF: sub_210F9+13FP
					; sub_21616+23BP ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_15363
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jz	short loc_15522
		push	[bp+var_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_11C04
		jmp	short loc_15524
; ---------------------------------------------------------------------------

loc_15522:				; CODE XREF: sub_154F5+20j
		sub	ax, ax

loc_15524:				; CODE XREF: sub_154F5+2Bj
		mov	sp, bp
		pop	bp
		retf	6
sub_154F5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1552A	proc near		; CODE XREF: sub_15564+57p
					; sub_1618F+EAp ...

arg_0		= dword	ptr  4
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		mov	ax, bx
		mov	dx, es
		add	ax, 2
		push	dx
		push	ax
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+0Eh]
		push	word ptr es:[bx+0Ch]
		push	word ptr es:[bx+10h]
		push	word ptr es:[bx+12h]
		call	sub_1588B
		pop	bp
		retn	8
sub_1552A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15564	proc far		; CODE XREF: sub_210F9+AEP
					; sub_21616+1A5P ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	si
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		sub	ax, ax
		push	ax
		call	sub_15AF5
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		or	dx, ax
		jnz	short loc_1558B

loc_15586:				; CODE XREF: sub_15564+74j
		sub	ax, ax
		cwd
		jmp	short loc_155FA
; ---------------------------------------------------------------------------

loc_1558B:				; CODE XREF: sub_15564+20j
		mov	[bp+var_4], 0
		jmp	short loc_15595
; ---------------------------------------------------------------------------

loc_15592:				; CODE XREF: sub_15564+62j
		inc	[bp+var_4]

loc_15595:				; CODE XREF: sub_15564+2Cj
		mov	si, [bp+var_4]
		shl	si, 1
		shl	si, 1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+si+0Eh]
		mov	dx, es:[bx+si+10h]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		or	dx, ax
		jz	short loc_155DA
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_A]
		push	ax
		call	sub_1552A
		mov	ax, word_490A0
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_15592
		push	[bp+var_6]
		push	[bp+var_8]
		push	cs
		call	near ptr sub_14A8E
		mov	ax, [bp+var_2]
		mov	word_490A0, ax
		jmp	short loc_15586
; ---------------------------------------------------------------------------

loc_155DA:				; CODE XREF: sub_15564+4Bj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+8], 0
		jz	short loc_155EE
		push	[bp+var_6]
		push	[bp+var_8]
		push	cs
		call	near ptr sub_14B6B

loc_155EE:				; CODE XREF: sub_15564+7Ej
		mov	word_490A0, 0
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]

loc_155FA:				; CODE XREF: sub_15564+25j
		pop	si
		mov	sp, bp
		pop	bp
		retf	4
sub_15564	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15601	proc far		; CODE XREF: sub_21E98+15P
					; sub_24F8E+F2P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_15363
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jz	short loc_1562C
		push	[bp+var_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_11C41

loc_1562C:				; CODE XREF: sub_15601+20j
		mov	sp, bp
		pop	bp
		retf	6
sub_15601	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15632	proc far		; CODE XREF: sub_1618F+147p
					; sub_24E21+40P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_15650
		pop	bp
		retf	8
sub_15632	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15650	proc far		; CODE XREF: sub_15632+17p
					; sub_210F9+1ABP ...

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		mov	[bp+var_4], 0
		call	sub_27172
		mov	[bp+var_18], ax

loc_15668:				; CODE XREF: sub_15650+7Cj
		mov	ax, 0FFFFh
		push	ax
		lea	ax, [bp+var_14]
		push	ss
		push	ax
		call	sub_26E7B
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_156AE
		lea	ax, [bp+var_1E]
		push	ss
		push	ax
		lea	ax, [bp+var_14]
		push	ss
		push	ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	[bp+arg_0]
		add	sp, 0Ch
		or	ax, ax
		jz	short loc_156AE
		mov	word_490A0, 0
		push	[bp+var_18]
		call	sub_2719B
		mov	ax, [bp+var_1E]
		sub	dx, dx
		jmp	loc_15885
; ---------------------------------------------------------------------------

loc_156AE:				; CODE XREF: sub_15650+2Cj
					; sub_15650+46j
		mov	ax, [bp+var_14]
		cmp	ax, 1
		jnz	short loc_156B9
		jmp	loc_15784
; ---------------------------------------------------------------------------

loc_156B9:				; CODE XREF: sub_15650+64j
		cmp	ax, 3
		jz	short loc_156E5
		cmp	ax, 5
		jz	short loc_156E5

loc_156C3:				; CODE XREF: sub_15650+B7j
					; sub_15650+CFj ...
		mov	[bp+var_1E], 0

loc_156C8:				; CODE XREF: sub_15650+224j
		cmp	[bp+var_1E], 0
		jz	short loc_15668
		push	[bp+var_18]
		call	sub_2719B
		mov	word_490A0, 0
		mov	dx, [bp+var_16]
		mov	ax, [bp+var_1E]
		jmp	loc_15885
; ---------------------------------------------------------------------------

loc_156E5:				; CODE XREF: sub_15650+6Cj
					; sub_15650+71j
		cmp	[bp+var_12], 0Dh
		jnz	short loc_15703
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	word_471B0
		push	cs
		call	near ptr sub_15363
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	dx
		or	dx, ax
		jnz	short loc_15721

loc_15703:				; CODE XREF: sub_15650+99j
		cmp	[bp+var_12], 1Bh
		jnz	short loc_156C3
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		mov	ax, 2
		push	ax
		push	cs
		call	near ptr sub_15363
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	dx
		or	dx, ax
		jz	short loc_156C3

loc_15721:				; CODE XREF: sub_15650+B1j
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		nop
		push	cs
		call	near ptr sub_1B047
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_4]
		les	bx, es:[bx]
		mov	ax, es:[bx+2]
		les	bx, [bp+var_24]
		les	bx, es:[bx]
		add	ax, es:[bx+0Ah]
		mov	[bp+var_8], ax
		les	bx, [bp+var_24]
		les	bx, es:[bx]
		mov	ax, es:[bx+8]
		les	bx, [bp+arg_4]
		les	bx, es:[bx]
		add	ax, es:[bx]
		mov	[bp+var_A], ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	[bp+var_14], 1
		mov	[bp+var_4], 1

loc_15784:				; CODE XREF: sub_15650+66j
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		nop
		push	cs
		call	near ptr sub_1B047
		lea	ax, [bp+var_A]
		push	ss
		push	ax
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_20A1B
		mov	[bp+var_20], ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_20], 0
		jnz	short loc_157BA
		jmp	loc_1587A
; ---------------------------------------------------------------------------

loc_157BA:				; CODE XREF: sub_15650+165j
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		push	[bp+var_8]
		push	[bp+var_A]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		nop
		push	cs
		call	near ptr sub_11ABC
		mov	[bp+var_16], ax
		or	ax, ax
		jnz	short loc_157DA
		jmp	loc_156C3
; ---------------------------------------------------------------------------

loc_157DA:				; CODE XREF: sub_15650+185j
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_24]
		les	bx, es:[bx]
		mov	ax, es:[bx+20h]
		mov	dx, es:[bx+22h]
		mov	word ptr [bp+var_1C], ax
		mov	word ptr [bp+var_1C+2],	dx
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_1C]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_28], ax
		mov	word ptr [bp+var_28+2],	dx
		les	bx, [bp+var_28]
		mov	ax, es:[bx+2]
		and	ah, 7Fh
		mov	[bp+var_2], ax
		test	word ptr es:[bx+2], 8000h
		jnz	short loc_15839
		mov	ax, es:[bx]
		jmp	short loc_1583B
; ---------------------------------------------------------------------------

loc_15839:				; CODE XREF: sub_15650+1E2j
		sub	ax, ax

loc_1583B:				; CODE XREF: sub_15650+1E7j
		mov	[bp+var_1E], ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		nop
		push	cs
		call	near ptr sub_1B063
		push	[bp+var_8]
		push	[bp+var_A]
		cmp	[bp+var_2], 0Dh
		jnz	short loc_1585D
		mov	ax, 5CCEh
		mov	dx, seg	seg000
		jmp	short loc_15860
; ---------------------------------------------------------------------------

loc_1585D:				; CODE XREF: sub_15650+203j
		sub	ax, ax
		cwd

loc_15860:				; CODE XREF: sub_15650+20Bj
		push	dx
		push	ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_123F9
		mov	[bp+var_16], ax
		or	ax, ax
		jz	short loc_15877
		jmp	loc_156C8
; ---------------------------------------------------------------------------

loc_15877:				; CODE XREF: sub_15650+222j
		jmp	loc_156C3
; ---------------------------------------------------------------------------

loc_1587A:				; CODE XREF: sub_15650+167j
		mov	ax, 1
		push	ax
		call	dword_471A4
		jmp	loc_156C3
; ---------------------------------------------------------------------------

loc_15885:				; CODE XREF: sub_15650+5Bj
					; sub_15650+92j
		mov	sp, bp
		pop	bp
		retf	8
sub_15650	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1588B	proc near		; CODE XREF: sub_1552A+33p

var_2A		= dword	ptr -2Ah
var_26		= byte ptr -26h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h
arg_E		= word ptr  12h
arg_10		= word ptr  14h
arg_12		= word ptr  16h

		push	bp
		mov	bp, sp
		mov	ax, 2Ah	; '*'
		call	__chkstk
		lea	ax, [bp+var_26]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_158B1
		jmp	loc_15AD6
; ---------------------------------------------------------------------------

loc_158B1:				; CODE XREF: sub_1588B+21j
		mov	ax, 8
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		and	ax, 0Fh
		or	al, 9
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_2A], ax
		mov	word ptr [bp+var_2A+2],	dx
		les	bx, [bp+var_2A]
		mov	ax, [bp+arg_E]
		mov	es:[bx], ax
		les	bx, [bp+var_2A]
		mov	ax, [bp+arg_8]
		mov	es:[bx+2], ax
		les	bx, [bp+var_2A]
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	es:[bx+4], ax
		mov	es:[bx+6], dx
		sub	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_6], ax
		mov	[bp+var_C], ax
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_8]
		and	ah, 7Fh
		sub	ax, 0Ah
		cmp	ax, 0Ch
		jbe	short loc_15927
		jmp	loc_15A65
; ---------------------------------------------------------------------------

loc_15927:				; CODE XREF: sub_1588B+97j
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_15A78[bx]
; ---------------------------------------------------------------------------

loc_1592F:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B:off_15A78o
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], 1
		mov	[bp+var_8], 0
		mov	ax, word_471B0
		cmp	[bp+arg_E], ax
		jz	short loc_15950
		jmp	loc_15A92
; ---------------------------------------------------------------------------

loc_15950:				; CODE XREF: sub_1588B+C0j
		or	byte ptr [bp+arg_0], 1
		jmp	loc_15A92
; ---------------------------------------------------------------------------

loc_15957:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1EFo
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], 2

loc_15968:				; CODE XREF: sub_1588B+F6j
					; sub_1588B+13Fj
		mov	[bp+var_8], 0
		jmp	loc_15A92
; ---------------------------------------------------------------------------

loc_15970:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1F1o
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], 3
		jmp	short loc_15968
; ---------------------------------------------------------------------------

loc_15983:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1F3o
		push	[bp+arg_E]
		push	[bp+arg_12]
		push	[bp+arg_10]
		mov	ax, 1
		push	ax
		call	[bp+arg_4]
		add	sp, 8
		mov	[bp+var_2], ax
		push	[bp+arg_E]
		push	[bp+arg_12]
		push	[bp+arg_10]
		mov	ax, 2
		push	ax
		call	[bp+arg_4]
		add	sp, 8
		mov	[bp+var_C], ax
		push	[bp+arg_E]
		push	[bp+arg_12]
		push	[bp+arg_10]
		mov	ax, 3
		push	ax
		call	[bp+arg_4]
		add	sp, 8
		mov	[bp+arg_2], ax
		mov	[bp+var_A], 4
		jmp	short loc_15968
; ---------------------------------------------------------------------------

loc_159CC:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1F5o
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]

loc_159D2:				; CODE XREF: sub_1588B+1C0j
		mov	[bp+var_A], ax
		mov	[bp+var_8], dx
		jmp	loc_15A92
; ---------------------------------------------------------------------------

loc_159DB:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1F7o
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], offset loc_15DCB
		mov	[bp+var_8], seg	seg000
		jmp	loc_15A92
; ---------------------------------------------------------------------------

loc_159F4:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1FDo
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], offset loc_15FA0
		mov	[bp+var_8], seg	seg000
		jmp	loc_15A92
; ---------------------------------------------------------------------------

loc_15A0D:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+201o
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], offset loc_15EDE
		mov	[bp+var_8], seg	seg000
		jmp	short loc_15A92
; ---------------------------------------------------------------------------

loc_15A25:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+203o
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	ax, es:[bx+8]
		mov	[bp+var_C], ax
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_2], ax
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		jmp	short loc_159D2
; ---------------------------------------------------------------------------

loc_15A4D:				; CODE XREF: sub_1588B+9Fj
					; DATA XREF: sub_1588B+1F9o ...
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	[bp+var_A], offset loc_15E4E
		mov	[bp+var_8], seg	seg000
		jmp	short loc_15A92
; ---------------------------------------------------------------------------

loc_15A65:				; CODE XREF: sub_1588B+99j
					; sub_1588B+9Fj
					; DATA XREF: ...
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1AEAD
		mov	word_490A0, 150Ah
		jmp	short loc_15AEF
; ---------------------------------------------------------------------------
off_15A78	dw offset loc_1592F	; DATA XREF: sub_1588B+9Fr
		dw offset loc_15957
		dw offset loc_15970
		dw offset loc_15983
		dw offset loc_159CC
		dw offset loc_159DB
		dw offset loc_15A4D
		dw offset loc_15A65
		dw offset loc_159F4
		dw offset loc_15A65
		dw offset loc_15A0D
		dw offset loc_15A25
		dw offset loc_15A4D
; ---------------------------------------------------------------------------

loc_15A92:				; CODE XREF: sub_1588B+C2j
					; sub_1588B+C9j ...
		push	[bp+arg_12]
		push	[bp+arg_10]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+arg_0]
		push	[bp+arg_2]
		push	[bp+var_2]
		push	[bp+var_C]
		push	[bp+var_8]
		push	[bp+var_A]
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		or	ax, dx
		jnz	short loc_15ADE
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1AEAD

loc_15AD6:				; CODE XREF: sub_1588B+23j
		mov	word_490A0, 150Bh
		jmp	short loc_15AEF
; ---------------------------------------------------------------------------

loc_15ADE:				; CODE XREF: sub_1588B+23Ej
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0

loc_15AEF:				; CODE XREF: sub_1588B+1EBj
					; sub_1588B+251j
		mov	sp, bp
		pop	bp
		retn	14h
sub_1588B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15AF5	proc near		; CODE XREF: sub_15564+15p
					; sub_1618F+96p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_23C3C
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jnz	short loc_15B1A
		sub	ax, ax
		cwd
		jmp	short loc_15B42
; ---------------------------------------------------------------------------

loc_15B1A:				; CODE XREF: sub_15AF5+1Ej
		cmp	[bp+arg_0], 0
		jz	short loc_15B2A
		push	[bp+var_2]
		push	[bp+var_4]
		push	cs
		call	near ptr sub_14B6B

loc_15B2A:				; CODE XREF: sub_15AF5+29j
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D
		mov	word_490A0, 0
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_15B42:				; CODE XREF: sub_15AF5+23j
		mov	sp, bp
		pop	bp
		retn	6
sub_15AF5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15B48	proc far		; CODE XREF: sub_250FA+26P
					; sub_2581E+10P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0A7Eh
		push	ds
		push	ax
		call	sub_1618F
		pop	bp
		retf	8
sub_15B48	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15B6A	proc far		; CODE XREF: sub_24E21+21P
					; sub_250FA+18P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_C]
		or	ax, [bp+arg_E]
		jz	short loc_15B89
		mov	ax, [bp+arg_C]
		mov	dx, [bp+arg_E]
		mov	word_471BA, ax
		mov	word_471BC, dx

loc_15B89:				; CODE XREF: sub_15B6A+10j
		mov	ax, [bp+arg_8]
		or	ax, [bp+arg_A]
		jz	short loc_15B9E
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_A]
		mov	word_471BE, ax
		mov	word_471C0, dx

loc_15B9E:				; CODE XREF: sub_15B6A+25j
		mov	ax, [bp+arg_4]
		or	ax, [bp+arg_6]
		jz	short loc_15BB3
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_6]
		mov	word_471C2, ax
		mov	word_471C4, dx

loc_15BB3:				; CODE XREF: sub_15B6A+3Aj
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_15BC8
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_471C6, ax
		mov	word_471C8, dx

loc_15BC8:				; CODE XREF: sub_15B6A+4Fj
		mov	word_490A0, 0
		pop	bp
		retf	10h
sub_15B6A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15BD2	proc far		; CODE XREF: sub_21E98+8BP
					; sub_21E98+B6P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_15363
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jz	short loc_15C00
		push	[bp+arg_6]
		push	[bp+var_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_120D1

loc_15C00:				; CODE XREF: sub_15BD2+20j
		mov	sp, bp
		pop	bp
		retf	8
sub_15BD2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15C06	proc far		; CODE XREF: sub_21E98+24P
					; sub_24F8E+122P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_15363
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jz	short loc_15C31
		push	[bp+var_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_121FB

loc_15C31:				; CODE XREF: sub_15C06+20j
		mov	sp, bp
		pop	bp
		retf	6
sub_15C06	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_15C37	proc far		; CODE XREF: sub_24F36+10P
					; seg001:500CP	...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0A96h
		push	ds
		push	ax
		call	sub_1618F
		pop	bp
		retf	8
sub_15C37	endp

; ---------------------------------------------------------------------------

loc_15C59:				; DATA XREF: sub_1532C+12o
		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		cmp	word ptr [bp+6], 0
		jnz	short loc_15CA5
		jmp	short loc_15CC8
; ---------------------------------------------------------------------------

loc_15C6C:				; CODE XREF: seg000:5CB3j
		mov	ax, 5CBCh
		push	ds
		push	ax
		mov	ax, 7
		push	ax
		call	__flsbuf
		add	sp, 6

loc_15C7D:				; CODE XREF: seg000:5CC6j
		cmp	word ptr [bp+6], 0
		jz	short loc_15CA5
		nop
		push	cs
		call	near ptr sub_1FBD0
		add	ax, 14h
		adc	dx, 0
		mov	[bp-4],	ax
		mov	[bp-2],	dx

loc_15C94:				; CODE XREF: seg000:5C9Ej seg000:5CA3j
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp-2]
		ja	short loc_15CA5
		jb	short loc_15C94
		cmp	ax, [bp-4]
		jb	short loc_15C94

loc_15CA5:				; CODE XREF: seg000:5C68j seg000:5C81j ...
		mov	ax, [bp+6]
		dec	word ptr [bp+6]
		or	ax, ax
		jz	short loc_15CC8
		dec	word_46CA0
		js	short loc_15C6C
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_15C7D
; ---------------------------------------------------------------------------

loc_15CC8:				; CODE XREF: seg000:5C6Aj seg000:5CADj
		mov	sp, bp
		pop	bp
		retf	2
; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		cmp	word ptr [bp+6], 0
		jnz	short loc_15CE5

loc_15CDF:				; CODE XREF: seg000:5DA8j
		sub	ax, ax
		cwd
		jmp	loc_15DC7
; ---------------------------------------------------------------------------

loc_15CE5:				; CODE XREF: seg000:5CDDj
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+8]
		assume es:nothing
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		les	bx, [bp-8]
		mov	ax, es:[bx+20h]
		mov	dx, es:[bx+22h]
		mov	[bp-0Ch], ax
		mov	[bp-0Ah], dx
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		mov	[bp-10h], ax
		mov	[bp-0Eh], dx
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp-0Ah]
		push	word ptr [bp-0Ch]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp-0Ch]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-14h], ax
		mov	[bp-12h], dx
		les	bx, [bp-14h]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, es:[bx]
		mov	[bp-16h], ax
		push	word ptr [bp-0Ah] ; CODE XREF: seg000:053Dj
		push	word ptr [bp-0Ch]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+6]
		cmp	ax, 5
		jz	short loc_15D85
		cmp	ax, 6
		jz	short loc_15DAB
		cmp	ax, 7
		jz	short loc_15DB2
		cmp	ax, 8
		jz	short loc_15DB9
		cmp	ax, 81h	; '�'
		jz	short loc_15DC0
		jmp	short loc_15D8A
; ---------------------------------------------------------------------------

loc_15D85:				; CODE XREF: seg000:5D6Dj
		mov	word ptr [bp-18h], 4

loc_15D8A:				; CODE XREF: seg000:5D83j seg000:5DB0j ...
		push	word ptr [bp-16h]
		push	word ptr [bp-0Eh]
		push	word ptr [bp-10h]
		push	word ptr [bp-18h]
		call	dword ptr [bp-4]
		add	sp, 8
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		nop
		push	cs
		call	near ptr sub_120D1
		jmp	loc_15CDF
; ---------------------------------------------------------------------------

loc_15DAB:				; CODE XREF: seg000:5D72j
		mov	word ptr [bp-18h], 5
		jmp	short loc_15D8A
; ---------------------------------------------------------------------------

loc_15DB2:				; CODE XREF: seg000:5D77j
		mov	word ptr [bp-18h], 6
		jmp	short loc_15D8A
; ---------------------------------------------------------------------------

loc_15DB9:				; CODE XREF: seg000:5D7Cj
		mov	word ptr [bp-18h], 7
		jmp	short loc_15D8A
; ---------------------------------------------------------------------------

loc_15DC0:				; CODE XREF: seg000:5D81j
		mov	word ptr [bp-18h], 8
		jmp	short loc_15D8A
; ---------------------------------------------------------------------------

loc_15DC7:				; CODE XREF: seg000:5CE2j
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_15DCB:				; DATA XREF: sub_1588B+15Co
		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	di
		les	bx, [bp+0Ch]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp+6]
		or	ax, ax
		jz	short loc_15DF5
		cmp	ax, 2
		jz	short loc_15E21
		jmp	short loc_15E1D
; ---------------------------------------------------------------------------

loc_15DF5:				; CODE XREF: seg000:5DECj
		mov	ax, [bp+8]
		or	ax, [bp+0Ah]
		jnz	short loc_15E1D
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		les	bx, [bp-4]
		les	bx, es:[bx+1Ch]
		mov	di, bx
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		sub	ax, ax
		push	ax
		call	sub_16068

loc_15E1D:				; CODE XREF: seg000:5DF3j seg000:5DFBj ...
		sub	ax, ax
		jmp	short loc_15E49
; ---------------------------------------------------------------------------

loc_15E21:				; CODE XREF: seg000:5DF1j
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		lea	ax, [bp-8]
		push	ss
		push	ax
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_15E1D
		mov	ax, 9

loc_15E49:				; CODE XREF: seg000:5E1Fj
		pop	di
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_15E4E:				; DATA XREF: sub_1588B+1CEo
		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		les	bx, [bp+0Ch]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp+6]
		or	ax, ax
		jz	short loc_15E7C
		cmp	ax, 2
		jz	short loc_15E9B
		cmp	ax, 9
		jz	short loc_15EC5
		jmp	short loc_15E97
; ---------------------------------------------------------------------------

loc_15E7C:				; CODE XREF: seg000:5E6Ej
		mov	ax, [bp+8]
		or	ax, [bp+0Ah]
		jnz	short loc_15E97
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		les	bx, [bp-4]
		push	word ptr es:[bx+12h]
		sub	ax, ax

loc_15E93:				; CODE XREF: seg000:5ED8j
		push	ax
		call	sub_16068

loc_15E97:				; CODE XREF: seg000:5E7Aj seg000:5E82j ...
		sub	ax, ax
		jmp	short loc_15EDA
; ---------------------------------------------------------------------------

loc_15E9B:				; CODE XREF: seg000:5E73j
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		lea	ax, [bp-8]
		push	ss
		push	ax
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_15E97
		mov	ax, 0Dh
		jmp	short loc_15EDA
; ---------------------------------------------------------------------------

loc_15EC5:				; CODE XREF: seg000:5E78j
		les	bx, [bp-4]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_15E97
		push	es
		push	bx
		push	word ptr es:[bx+12h]
		mov	ax, 1
		jmp	short loc_15E93
; ---------------------------------------------------------------------------

loc_15EDA:				; CODE XREF: seg000:5E99j seg000:5EC3j
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_15EDE:				; DATA XREF: sub_1588B+18Eo
		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		les	bx, [bp+0Ch]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp+6]
		or	ax, ax
		jz	short loc_15F0F
		cmp	ax, 2
		jz	short loc_15F63
		cmp	ax, 9
		jnz	short loc_15F0D
		jmp	loc_15F8D
; ---------------------------------------------------------------------------

loc_15F0D:				; CODE XREF: seg000:5F08j
		jmp	short loc_15F17
; ---------------------------------------------------------------------------

loc_15F0F:				; CODE XREF: seg000:5EFEj
		mov	ax, [bp+8]
		or	ax, [bp+0Ah]
		jz	short loc_15F1C

loc_15F17:				; CODE XREF: seg000:loc_15F0Dj
					; seg000:5F61j	...
		sub	ax, ax
		jmp	loc_15F9C
; ---------------------------------------------------------------------------

loc_15F1C:				; CODE XREF: seg000:5F15j
		les	bx, [bp-4]

loc_15F1F:				; CODE XREF: seg000:loc_15F9Aj
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp-4]
		les	bx, es:[bx+20h]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	[bp-0Ah], ax
		les	bx, [bp-4]
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp-0Ah]
		les	bx, [bp-4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		call	dword ptr es:[bx+1Ch]
		add	sp, 6
		jmp	short loc_15F17
; ---------------------------------------------------------------------------

loc_15F63:				; CODE XREF: seg000:5F03j
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		lea	ax, [bp-8]
		push	ss
		push	ax
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_15F17
		mov	ax, 0Ch
		jmp	short loc_15F9C
; ---------------------------------------------------------------------------

loc_15F8D:				; CODE XREF: seg000:5F0Aj
		les	bx, [bp-4]
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_15F9A
		jmp	loc_15F17
; ---------------------------------------------------------------------------

loc_15F9A:				; CODE XREF: seg000:5F95j
		jmp	short loc_15F1F
; ---------------------------------------------------------------------------

loc_15F9C:				; CODE XREF: seg000:5F19j seg000:5F8Bj
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_15FA0:				; DATA XREF: sub_1588B+175o
		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		les	bx, [bp+0Ch]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp+6]
		or	ax, ax
		jz	short loc_15FC9
		cmp	ax, 2
		jz	short loc_16039
		jmp	short loc_15FD1
; ---------------------------------------------------------------------------

loc_15FC9:				; CODE XREF: seg000:5FC0j
		mov	ax, [bp+8]
		or	ax, [bp+0Ah]
		jz	short loc_15FD6

loc_15FD1:				; CODE XREF: seg000:5FC7j seg000:6037j ...
		sub	ax, ax
		jmp	loc_16064
; ---------------------------------------------------------------------------

loc_15FD6:				; CODE XREF: seg000:5FCFj
		les	bx, [bp-4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp-4]
		les	bx, es:[bx+4]
		les	bx, es:[bx]
		mov	ax, es:[bx+2]
		mov	[bp-0Ch], ax
		les	bx, [bp-4]
		les	bx, es:[bx+4]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	[bp-0Ah], ax
		les	bx, [bp-4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		nop
		push	cs
		call	near ptr sub_1B063
		les	bx, [bp-4]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		mov	ax, es:[bx+0Ah]
		add	ax, [bp-0Ch]
		push	ax
		mov	ax, es:[bx+8]
		add	ax, [bp-0Ah]
		push	ax
		call	sub_20BBA
		jmp	short loc_15FD1
; ---------------------------------------------------------------------------

loc_16039:				; CODE XREF: seg000:5FC5j
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		lea	ax, [bp-8]
		push	ss
		push	ax
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_16061
		jmp	loc_15FD1
; ---------------------------------------------------------------------------

loc_16061:				; CODE XREF: seg000:605Cj
		mov	ax, 0Eh

loc_16064:				; CODE XREF: seg000:5FD3j
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16068	proc near		; CODE XREF: seg000:5E1Ap seg000:5E94p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_4]
		les	bx, es:[bx+4]
		les	bx, es:[bx]
		mov	ax, es:[bx+2]
		mov	[bp+var_4], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+4]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		add	ax, 8
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_208AA
		sub	ax, ax
		push	ax
		call	sub_20AC6
		mov	byte_48766, 0Fh
		sub	ax, ax
		push	ax
		call	sub_20B78
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		push	[bp+arg_2]
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		cmp	[bp+arg_0], ax
		jz	short loc_16105
		mov	ax, 3
		jmp	short loc_16108
; ---------------------------------------------------------------------------

loc_16105:				; CODE XREF: sub_16068+96j
		mov	ax, 2

loc_16108:				; CODE XREF: sub_16068+9Bj
		push	ax
		call	sub_14DB0
		les	bx, [bp+arg_4]
		cmp	byte ptr es:[bx+11h], 0FFh
		jnz	short loc_16124
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		call	sub_23427

loc_16124:				; CODE XREF: sub_16068+ACj
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp+var_4]
		neg	ax
		push	ax
		mov	ax, [bp+var_2]
		neg	ax
		push	ax
		call	sub_208AA
		mov	sp, bp
		pop	bp
		retn	8
sub_16068	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16146	proc near		; CODE XREF: sub_14DB0+348p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		cmp	[bp+arg_0], 0
		jg	short loc_1615B
		sub	ax, ax
		jmp	short loc_16189
; ---------------------------------------------------------------------------

loc_1615B:				; CODE XREF: sub_16146+Fj
		mov	ax, [bp+arg_2]
		mov	cl, 3
		shl	ax, cl
		cmp	ax, [bp+arg_0]
		jbe	short loc_16186
		mov	ax, [bp+arg_2]
		shl	ax, cl
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_0]
		sub	ax, [bp+var_2]
		add	ax, 0FFF9h
		cwd
		mov	cx, 0FFF8h
		idiv	cx
		mov	[bp+var_4], ax
		neg	ax
		add	[bp+arg_2], ax

loc_16186:				; CODE XREF: sub_16146+1Fj
		mov	ax, [bp+arg_2]

loc_16189:				; CODE XREF: sub_16146+13j
		mov	sp, bp
		pop	bp
		retn	4
sub_16146	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1618F	proc near		; CODE XREF: sub_14A4B+1Ap
					; sub_14A6C+1Bp ...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	si
		les	bx, [bp+arg_8]
		mov	ax, word_471B2
		cmp	es:[bx+8], ax
		jnz	short loc_161BA
		inc	word_471D2
		cmp	word_471D2, 3
		jle	short loc_161C7
		mov	word_471D2, 3
		jmp	short loc_161C7
; ---------------------------------------------------------------------------

loc_161BA:				; CODE XREF: sub_1618F+16j
		mov	word_471D2, 0
		mov	ax, es:[bx+8]
		mov	word_471B2, ax

loc_161C7:				; CODE XREF: sub_1618F+21j
					; sub_1618F+29j
		mov	ax, word_471D2
		or	ax, ax
		jz	short loc_161DF
		cmp	ax, 1
		jz	short loc_16201
		cmp	ax, 2
		jz	short loc_1620A
		cmp	ax, 3
		jz	short loc_16213
		jmp	short loc_161E2
; ---------------------------------------------------------------------------

loc_161DF:				; CODE XREF: sub_1618F+3Dj
		les	bx, [bp+arg_8]

loc_161E2:				; CODE XREF: sub_1618F+4Ej
		mov	al, es:[bx+0Ah]

loc_161E6:				; CODE XREF: sub_1618F+79j
					; sub_1618F+82j ...
		sub	ah, ah
		mov	[bp+var_2], ax
		and	ax, 3
		push	ax
		call	dword_471A4
		test	byte ptr [bp+var_2], 80h
		jnz	short loc_1621C
		mov	word_490A0, 0
		jmp	short loc_16232
; ---------------------------------------------------------------------------

loc_16201:				; CODE XREF: sub_1618F+42j
		les	bx, [bp+arg_8]
		mov	al, es:[bx+0Bh]
		jmp	short loc_161E6
; ---------------------------------------------------------------------------

loc_1620A:				; CODE XREF: sub_1618F+47j
		les	bx, [bp+arg_8]
		mov	al, es:[bx+0Ch]
		jmp	short loc_161E6
; ---------------------------------------------------------------------------

loc_16213:				; CODE XREF: sub_1618F+4Cj
		les	bx, [bp+arg_8]
		mov	al, es:[bx+0Dh]
		jmp	short loc_161E6
; ---------------------------------------------------------------------------

loc_1621C:				; CODE XREF: sub_1618F+68j
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		sub	ax, ax
		push	ax
		call	sub_15AF5
		mov	[bp+var_A], ax
		mov	[bp+var_8], dx
		or	dx, ax
		jnz	short loc_16238

loc_16232:				; CODE XREF: sub_1618F+70j
					; sub_1618F+10Dj
		mov	ax, 0FFFFh
		jmp	loc_162F5
; ---------------------------------------------------------------------------

loc_16238:				; CODE XREF: sub_1618F+A1j
		test	byte ptr [bp+var_2], 40h
		jnz	short loc_16243
		mov	ax, 1
		jmp	short loc_16246
; ---------------------------------------------------------------------------

loc_16243:				; CODE XREF: sub_1618F+ADj
		mov	ax, 2

loc_16246:				; CODE XREF: sub_1618F+B2j
		mov	word_471B0, ax
		mov	[bp+var_6], 0
		jmp	short loc_16253
; ---------------------------------------------------------------------------

loc_16250:				; CODE XREF: sub_1618F+F5j
		inc	[bp+var_6]

loc_16253:				; CODE XREF: sub_1618F+BFj
		mov	si, [bp+var_6]
		shl	si, 1
		shl	si, 1
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+si+0Eh]
		mov	dx, es:[bx+si+10h]
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		or	dx, ax
		jz	short loc_1629E
		push	[bp+var_8]
		push	[bp+var_A]
		push	[bp+var_E]
		push	ax
		call	sub_1552A
		mov	ax, word_490A0
		mov	[bp+var_4], ax
		or	ax, ax
		jz	short loc_16250

loc_16286:				; CODE XREF: sub_1618F+12Ej
		push	[bp+var_8]
		push	[bp+var_A]
		push	cs
		call	near ptr sub_14A8E
		mov	ax, [bp+var_4]
		mov	word_490A0, ax
		mov	word_471B0, 1
		jmp	short loc_16232
; ---------------------------------------------------------------------------

loc_1629E:				; CODE XREF: sub_1618F+DEj
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_162BF
		push	[bp+var_8]
		push	[bp+var_A]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1552A
		mov	ax, word_490A0
		mov	[bp+var_4], ax
		or	ax, ax
		jnz	short loc_16286

loc_162BF:				; CODE XREF: sub_1618F+115j
		push	[bp+var_8]
		push	[bp+var_A]
		push	cs
		call	near ptr sub_14B6B
		push	[bp+var_8]
		push	[bp+var_A]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	cs
		call	near ptr sub_15632
		mov	[bp+var_C], ax
		push	[bp+var_8]
		push	[bp+var_A]
		push	cs
		call	near ptr sub_14A8E
		mov	word_471B0, 1
		mov	word_490A0, 0
		mov	ax, [bp+var_C]

loc_162F5:				; CODE XREF: sub_1618F+A6j
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ch
sub_1618F	endp

; ---------------------------------------------------------------------------

loc_162FC:				; DATA XREF: sub_149FC+36o
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================


sub_1630A	proc near		; CODE XREF: sub_16592+256p
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_1D137
		call	sub_1758A
		call	sub_175B6
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		nop
		push	cs
		call	near ptr sub_11668
		retn
sub_1630A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1632A	proc far		; CODE XREF: sub_23F23+115P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		call	sub_204F2
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		nop
		push	cs
		call	near ptr sub_1D391
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, 0B52h
		push	ds
		push	ax
		call	sub_23C3C
		mov	word ptr dword_47268, ax
		mov	word ptr dword_47268+2,	dx
		mov	ax, 2
		push	ax
		nop
		push	cs
		call	near ptr sub_102F7
		mov	ax, 0B52h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_1DEC7
		mov	word_47264, ax
		mov	word_47266, dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1DFB2
		mov	ax, 0B84h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_1DD8F
		mov	word_471EC, ax
		mov	word_471EE, dx
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1D5C5
		mov	ax, 0C4Ch
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_1DD8F
		mov	word_471DE, ax
		mov	word_471E0, dx
		push	dx
		push	ax
		mov	ax, 0Dh
		push	ax
		nop
		push	cs
		call	near ptr sub_1D5C5
		nop
		push	cs
		call	near ptr sub_1D2AA
		mov	word_47230, ax
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		mov	ax, 0B6Ch
		push	ds
		push	ax
		mov	ax, 0B5Ah
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		mov	ax, 1
		cwd
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	word_4722C, ax
		mov	word_4722E, dx
		or	dx, ax
		jz	short loc_1646A
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		mov	ax, 0B74h
		push	ds
		push	ax
		mov	ax, 0B5Eh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		mov	ax, 1
		cwd
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	word_4725C, ax
		mov	word_4725E, dx
		or	dx, ax
		jz	short loc_1646A
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		mov	ax, 0B7Ch
		push	ds
		push	ax
		mov	ax, 0B66h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		mov	ax, 1
		cwd
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_11E4D
		mov	word_47218, ax
		mov	word_4721A, dx
		or	dx, ax
		jz	short loc_1646A
		push	[bp+var_6]
		push	[bp+var_8]
		call	sub_20B07
		push	[bp+var_2]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_1DFB2
		jmp	short loc_1646F
; ---------------------------------------------------------------------------

loc_1646A:				; CODE XREF: sub_1632A+C2j
					; sub_1632A+F4j ...
		or	byte ptr word_490A0+1, 10h

loc_1646F:				; CODE XREF: sub_1632A+13Ej
		mov	ax, 632Ah
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		mov	sp, bp
		pop	bp
		retf
sub_1632A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16480	proc far		; CODE XREF: sub_137E6+350p

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		cmp	word_4B45F, 0
		jge	short loc_16495
		jmp	loc_1658E
; ---------------------------------------------------------------------------

loc_16495:				; CODE XREF: sub_16480+10j
		mov	ax, 1E7h
		imul	word_4B45F
		mov	bx, ax
		mov	ax, [bx-7507h]
		mov	[bp+var_2], ax
		mov	[bp+var_6], 0

loc_164AA:				; CODE XREF: sub_16480+A1j
		push	[bp+var_2]
		push	word_4DFA0
		call	sub_2A628
		or	ax, ax
		jnz	short loc_16508
		mov	bx, [bp+var_2]
		mov	bx, [bx+16h]
		mov	ax, [bx+3Ah]
		mov	bx, [bp+var_2]
		sub	ax, [bx+1Ch]
		dec	ax
		cwd
		mov	cx, 5
		idiv	cx
		imul	cx
		add	ax, [bx+1Ch]
		mov	[bp+var_4], ax
		or	ax, ax
		jl	short loc_164FB
		mov	ax, 26h	; '&'
		imul	[bp+var_4]
		add	ax, 77D2h
		mov	[bp+var_8], ax

loc_164E8:				; CODE XREF: sub_16480+79j
		mov	bx, [bp+var_8]
		cmp	word ptr [bx], 0
		jz	short loc_164FB
		sub	[bp+var_8], 0BEh ; '�'
		sub	[bp+var_4], 5
		jns	short loc_164E8

loc_164FB:				; CODE XREF: sub_16480+5Aj
					; sub_16480+6Ej
		cmp	[bp+var_4], 0
		jl	short loc_16508
		mov	[bp+var_6], 1
		jmp	short loc_16523
; ---------------------------------------------------------------------------

loc_16508:				; CODE XREF: sub_16480+38j
					; sub_16480+7Fj
		mov	bx, [bp+var_2]
		mov	ax, [bx+18h]
		mov	[bp+var_2], ax
		mov	ax, 1E7h
		imul	word_4B45F
		mov	bx, ax
		mov	ax, [bp+var_2]
		cmp	[bx-7507h], ax
		jnz	short loc_164AA

loc_16523:				; CODE XREF: sub_16480+86j
		cmp	[bp+var_6], 0
		jnz	short loc_1656D

loc_16529:				; CODE XREF: sub_16480+EBj
		push	[bp+var_2]
		push	word_4DFA0
		call	sub_2A628
		or	ax, ax
		jz	short loc_16552
		mov	bx, [bp+var_2]
		mov	ax, 26h	; '&'
		imul	word ptr [bx+0Ch]
		mov	bx, ax
		cmp	word ptr [bx+77D2h], 0
		jnz	short loc_16552
		mov	[bp+var_6], 1
		jmp	short loc_1656D
; ---------------------------------------------------------------------------

loc_16552:				; CODE XREF: sub_16480+B7j
					; sub_16480+C9j
		mov	bx, [bp+var_2]
		mov	ax, [bx+18h]
		mov	[bp+var_2], ax
		mov	ax, 1E7h
		imul	word_4B45F
		mov	bx, ax
		mov	ax, [bp+var_2]
		cmp	[bx-7507h], ax
		jnz	short loc_16529

loc_1656D:				; CODE XREF: sub_16480+A7j
					; sub_16480+D0j
		cmp	[bp+var_6], 0
		jz	short loc_16589
		push	[bp+var_2]
		call	sub_24676
		or	ax, ax
		jnz	short loc_1658E
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_16592
		jmp	short loc_1658E
; ---------------------------------------------------------------------------

loc_16589:				; CODE XREF: sub_16480+F1j
		call	sub_2581E

loc_1658E:				; CODE XREF: sub_16480+12j
					; sub_16480+FDj ...
		mov	sp, bp
		pop	bp
		retf
sub_16480	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16592	proc far		; CODE XREF: sub_137E6+4BAp
					; sub_16480+104p ...

var_60		= dword	ptr -60h
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= byte ptr -56h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= byte ptr -40h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 60h	; '`'
		call	__chkstk
		push	di
		push	si
		mov	[bp+var_C], 0
		mov	[bp+var_2E], 0
		mov	bx, word_4879A
		mov	ax, 26h	; '&'
		imul	word ptr [bx+0Ch]
		add	ax, 77BCh
		mov	word ptr [bp+var_60], ax
		mov	ax, 0Eh
		imul	word ptr [bx+0Ch]
		mov	bx, [bx+16h]
		mov	cx, [bx+22h]
		mov	si, [bx+24h]
		add	cx, ax
		mov	word ptr [bp+var_60+2],	cx
		mov	[bp-5Ch], si
		mov	ax, 26h	; '&'
		push	ax		; size_t
		push	ds
		push	word ptr [bp+var_60] ; void *
		mov	ax, 6252h
		push	ds
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		mov	ax, 26h	; '&'
		push	ax		; size_t
		push	ds
		push	word ptr [bp+var_60] ; void *
		mov	ax, 6210h
		push	ds
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		les	bx, [bp+var_60+2]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_1660B
		push	es
		push	bx
		call	sub_16B06

loc_1660B:				; CODE XREF: sub_16592+72j
		sub	ax, ax
		mov	word ptr dword_47228+2,	ax
		mov	word ptr dword_47228, ax
		cmp	[bp+arg_0], ax
		jz	short loc_16644
		lea	ax, [bp+var_56]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_16644
		cmp	[bp+var_2E], 0
		jz	short loc_16639
		jmp	loc_16AAA
; ---------------------------------------------------------------------------

loc_16639:				; CODE XREF: sub_16592+A2j
		mov	[bp+var_2E], 1
		call	sub_17AB7
		jmp	loc_16AAA
; ---------------------------------------------------------------------------

loc_16644:				; CODE XREF: sub_16592+84j
					; sub_16592+9Cj
		call	sub_16EE2
		mov	[bp+var_2E], 1
		call	sub_17AB7
		mov	ax, 6258h
		push	ds
		push	ax
		mov	ax, 1Eh
		push	ax
		mov	ax, 23h	; '#'
		push	ax
		call	sub_208AA
		mov	ax, 6260h
		push	ds
		push	ax
		mov	ax, 1Eh
		push	ax
		mov	ax, 23h	; '#'
		push	ax
		call	sub_208AA
		mov	ax, 7D0h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr dword_4724A, ax
		mov	word ptr dword_4724A+2,	dx
		cmp	[bp+arg_0], 0
		jz	short loc_16698
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_16698:				; CODE XREF: sub_16592+FFj
		mov	bx, word ptr [bp+var_60]
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B047
		mov	bx, word ptr [bp+var_60]
		push	word ptr [bx+16h] ; size_t
		les	bx, [bx+18h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		les	bx, dword_4724A
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		call	_memmove
		add	sp, 0Ah
		mov	bx, word ptr [bp+var_60]
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, 6258h
		push	ds
		push	ax
		mov	ax, 61F4h
		push	ds
		push	ax
		call	sub_321A6
		mov	ax, 61F4h
		push	ds
		push	ax
		mov	ax, 0FFF6h
		push	ax
		mov	ax, 0FFF8h
		push	ax
		call	sub_20513
		mov	ax, 0AC2h
		push	ds
		push	ax
		call	sub_16B7F
		mov	ax, 0ACAh
		push	ds
		push	ax
		call	sub_16B7F
		mov	ax, 0AD2h
		mov	[bp+var_4], ax
		mov	[bp+var_2], ds
		jmp	short loc_16720
; ---------------------------------------------------------------------------

loc_16713:				; CODE XREF: sub_16592+193j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_16B7F
		add	[bp+var_4], 8

loc_16720:				; CODE XREF: sub_16592+17Fj
		cmp	[bp+var_4], 0B52h
		jb	short loc_16713
		call	sub_204F2
		mov	[bp+var_5A], ax
		mov	[bp+var_58], dx
		nop
		push	cs
		call	near ptr sub_1D391
		mov	[bp+var_A], ax
		mov	[bp+var_8], dx
		mov	ax, word_4DF96
		mov	[bp+var_6], ax
		lea	ax, [bp+var_2C]
		push	ss
		push	ax
		call	sub_20460
		nop
		push	cs
		call	near ptr sub_1CE23
		push	word_47266
		push	word_47264
		nop
		push	cs
		call	near ptr sub_1DFB2
		mov	ax, 6B2Fh
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1D858
		mov	ax, 6B2Fh
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1544A
		mov	[bp+var_44], ax
		mov	[bp+var_42], dx
		les	bx, dword_47268
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	di, 6204h
		mov	si, ax
		push	ds
		pop	es
		assume es:dseg
		push	ds
		mov	ds, dx
		movsw
		movsw
		movsw
		movsw
		pop	ds
		mov	ax, 6204h
		push	ds
		push	ax
		call	sub_20B07
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		nop
		push	cs
		call	near ptr sub_14B6B
		mov	ax, 1E7h
		imul	word_4B45F
		add	ax, 8914h
		push	ds
		push	ax
		call	sub_20A92
		lea	ax, [bp+var_40]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_167DC
		jmp	loc_169B2
; ---------------------------------------------------------------------------

loc_167DC:				; CODE XREF: sub_16592+245j
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D
		call	sub_1630A
		call	sub_178EB
		mov	ax, 1
		push	ax
		mov	ax, word_47232
		add	ah, 0Ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		mov	ax, 1
		push	ax
		mov	ax, word_47252
		add	ah, 0Eh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		mov	ax, 1
		push	ax
		call	sub_1799A
		jmp	loc_168FD
; ---------------------------------------------------------------------------

loc_16818:				; CODE XREF: sub_16592+352j
		mov	ax, 80AEh
		push	ds
		push	ax
		mov	ax, 0B52h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_1687A
		mov	ax, word_47230
		add	ax, 9
		cmp	ax, word_4908E
		jl	short loc_16869
		mov	ax, 80A4h
		push	ds
		push	ax
		push	word_47266
		push	word_47264
		nop
		push	cs
		call	near ptr sub_1D879
		cmp	word_49094, 0
		jz	short loc_168A4
		push	word_49096
		push	word_49094
		call	sub_16BC1
		sub	ax, ax
		push	ax
		push	word_49096
		nop
		push	cs
		call	near ptr sub_1D414
		jmp	short loc_168A4
; ---------------------------------------------------------------------------

loc_16869:				; CODE XREF: sub_16592+2A3j
		mov	ax, 80AEh
		push	ds
		push	ax
		push	word_49092
		call	sub_16C4F
		mov	[bp+var_C], ax
		jmp	short loc_168A4
; ---------------------------------------------------------------------------

loc_1687A:				; CODE XREF: sub_16592+297j
		dec	word_46CA0
		js	short loc_16893
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_168A4
; ---------------------------------------------------------------------------

loc_16893:				; CODE XREF: sub_16592+2ECj
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6

loc_168A4:				; CODE XREF: sub_16592+2BCj
					; sub_16592+2D5j ...
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D
		jmp	short loc_168FD
; ---------------------------------------------------------------------------

loc_168B2:				; CODE XREF: sub_16592+36Fj
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_26E7B
		cmp	word_471E2, 0
		jz	short loc_168DC
		push	word_47262
		mov	ax, word_47260
		sub	ax, word_4721E
		push	ax
		push	word_47260
		nop
		push	cs
		call	near ptr sub_14C5A

loc_168DC:				; CODE XREF: sub_16592+333j
		mov	ax, word_49084
		cmp	ax, 1
		jnz	short loc_168E7
		jmp	loc_16818
; ---------------------------------------------------------------------------

loc_168E7:				; CODE XREF: sub_16592+350j
		cmp	ax, 3
		jz	short loc_168F1
		cmp	ax, 5
		jnz	short loc_168FD

loc_168F1:				; CODE XREF: sub_16592+358j
		mov	al, byte_49086
		sub	ah, ah
		push	ax
		call	sub_170C8
		mov	[bp+var_C], ax

loc_168FD:				; CODE XREF: sub_16592+283j
					; sub_16592+31Ej ...
		cmp	[bp+var_C], 0
		jz	short loc_168B2
		cmp	[bp+var_C], 1
		jz	short loc_1690C
		jmp	loc_169AD
; ---------------------------------------------------------------------------

loc_1690C:				; CODE XREF: sub_16592+375j
		mov	ax, 6258h
		push	ds
		push	ax
		mov	ax, 0FFE2h
		push	ax
		mov	ax, 0FFDDh
		push	ax
		call	sub_208AA
		mov	ax, 6260h
		push	ds
		push	ax
		mov	ax, 0FFE2h
		push	ax
		mov	ax, 0FFDDh
		push	ax
		call	sub_208AA
		mov	ax, word ptr [bp+var_60]
		add	ax, 18h
		push	ds
		push	ax
		call	sub_16B06
		push	word_47248
		push	word ptr dword_4724A+2
		push	word ptr dword_4724A
		nop
		push	cs
		call	near ptr sub_1B551
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_102F7
		mov	ax, 26h	; '&'
		push	ax		; size_t
		mov	ax, 6252h
		push	ds
		push	ax		; void *
		push	ds
		push	word ptr [bp+var_60] ; void *
		call	_memmove
		add	sp, 0Ah
		push	ds
		push	word ptr [bp+var_60]
		push	word ptr [bp-5Ch]
		push	word ptr [bp+var_60+2]
		nop
		push	cs
		call	near ptr sub_110E4
		mov	bx, word_4879A
		les	si, [bp+var_60+2]
		assume es:nothing
		mov	ax, es:[si+0Ch]
		mov	si, bx
		add	ax, [si+10h]
		mov	[bx+14h], ax
		mov	bx, word_4879A
		les	si, [bp+var_60+2]
		mov	ax, es:[si+0Ah]
		mov	si, bx
		add	ax, [si+0Eh]
		mov	[bx+12h], ax
		push	word ptr [bp+var_60]
		push	cs
		call	near ptr sub_176C9
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_169D4
; ---------------------------------------------------------------------------

loc_169AD:				; CODE XREF: sub_16592+377j
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_169B2:				; CODE XREF: sub_16592+247j
		mov	ax, 626Ah
		push	ds
		push	ax
		call	sub_16B06
		mov	ax, 26h	; '&'
		push	ax		; size_t
		mov	ax, 6210h
		push	ds
		push	ax		; void *
		push	ds
		push	word ptr [bp+var_60] ; void *
		call	_memmove
		add	sp, 0Ah
		mov	[bp+var_C], 2

loc_169D4:				; CODE XREF: sub_16592+419j
		mov	ax, 6248h
		push	ds
		push	ax
		call	sub_16B06
		mov	word_4B39E, 1
		sub	ax, ax
		push	ax
		mov	ax, word_47232
		add	ah, 0Ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		sub	ax, ax
		push	ax
		mov	ax, word_47256
		add	ah, 0Ch
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		sub	ax, ax
		push	ax
		mov	ax, word_47252
		add	ah, 0Eh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		sub	ax, ax
		push	ax
		call	sub_1799A
		push	[bp+var_58]
		push	[bp+var_5A]
		call	sub_20B07
		lea	ax, [bp+var_2C]
		push	ss
		push	ax
		call	sub_20A92
		mov	ax, 1ADCh
		push	ds
		push	ax
		call	sub_29E66
		mov	ax, 9F16h
		mov	dx, seg	seg001
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1D858
		push	[bp+var_42]
		push	[bp+var_44]
		nop
		push	cs
		call	near ptr sub_1544A
		push	[bp+var_8]
		push	[bp+var_A]
		nop
		push	cs
		call	near ptr sub_1DFB2
		cmp	[bp+var_6], 0
		jz	short loc_16A67
		nop
		push	cs
		call	near ptr sub_1CE72
		nop
		push	cs
		call	near ptr sub_1373A

loc_16A67:				; CODE XREF: sub_16592+4C9j
		mov	ax, 61F4h
		push	ds
		push	ax
		call	sub_16BA0
		mov	ax, 0AC2h
		push	ds
		push	ax
		call	sub_16BA0
		mov	ax, 0ACAh
		push	ds
		push	ax
		call	sub_16BA0
		mov	ax, 0AD2h
		mov	[bp+var_4], ax
		mov	[bp+var_2], ds
		jmp	short loc_16A97
; ---------------------------------------------------------------------------

loc_16A8A:				; CODE XREF: sub_16592+50Aj
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_16BA0
		add	[bp+var_4], 8

loc_16A97:				; CODE XREF: sub_16592+4F6j
		cmp	[bp+var_4], 0B52h
		jb	short loc_16A8A
		cmp	[bp+arg_0], 0
		jz	short loc_16AC5
		cmp	[bp+var_C], 2
		jnz	short loc_16AC5

loc_16AAA:				; CODE XREF: sub_16592+A4j
					; sub_16592+AFj
		push	word_490A4
		push	word_490A2	; void *
		call	sub_2A9F9
		push	word_4879A
		call	sub_2A9AA
		call	sub_2A9D4

loc_16AC5:				; CODE XREF: sub_16592+510j
					; sub_16592+516j
		call	sub_232D3
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2
		cmp	[bp+var_2E], 0
		jz	short loc_16AFE
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8

loc_16AFE:				; CODE XREF: sub_16592+561j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	2
sub_16592	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16B06	proc near		; CODE XREF: sub_16592+76p
					; sub_16592+3A6p ...

arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1AEAD
		les	bx, [bp+arg_0]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		pop	bp
		retn	4
sub_16B06	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr sub_16B4A
		call	sub_1758A
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16B4A	proc far		; CODE XREF: seg000:6B40p
					; sub_16BC1+55p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_233D4
		les	bx, [bp+arg_0]
		mov	ax, word_41AA2
		cmp	es:[bx+4], ax
		jl	short loc_16B7B
		call	sub_175B6
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		nop
		push	cs
		call	near ptr sub_11668

loc_16B7B:				; CODE XREF: sub_16B4A+1Fj
		pop	bp
		retf	4
sub_16B4A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16B7F	proc near		; CODE XREF: sub_16592+16Bp
					; sub_16592+173p ...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Dh
		push	ax
		mov	ax, 9
		push	ax
		call	sub_208AA
		pop	bp
		retn	4
sub_16B7F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16BA0	proc near		; CODE XREF: sub_16592+4DAp
					; sub_16592+4E2p ...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0FFF3h
		push	ax
		mov	ax, 0FFF7h
		push	ax
		call	sub_208AA
		pop	bp
		retn	4
sub_16BA0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16BC1	proc near		; CODE XREF: sub_16592+2C6p

var_2		= word ptr -2
arg_0		= byte ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	al, [bp+arg_0]
		sub	ah, ah
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		cmp	ax, 0Ah
		jz	short loc_16BE8
		cmp	ax, 0Dh
		jz	short loc_16C24
		cmp	ax, 0Eh
		jz	short loc_16C43
		jmp	short loc_16C49
; ---------------------------------------------------------------------------

loc_16BE8:				; CODE XREF: sub_16BC1+19j
		sub	ax, ax
		push	ax
		mov	ax, word_47232
		add	ah, 0Ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		mov	ax, [bp+var_2]
		mov	word_47232, ax
		mov	ax, 1
		push	ax
		mov	ax, word_47232
		add	ah, 0Ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		call	sub_170B6
		mov	ax, 61F4h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_16B4A
		call	sub_16FA8
		call	sub_1758A
		call	sub_175B6
		jmp	short loc_16C49
; ---------------------------------------------------------------------------

loc_16C24:				; CODE XREF: sub_16BC1+1Ej
		cmp	[bp+var_2], 0
		jz	short loc_16C3A
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		dec	cl
		shl	ax, cl
		xor	ax, word_47250
		jmp	short loc_16C3D
; ---------------------------------------------------------------------------

loc_16C3A:				; CODE XREF: sub_16BC1+67j
		mov	ax, [bp+var_2]

loc_16C3D:				; CODE XREF: sub_16BC1+77j
		push	ax
		call	sub_17A03
		jmp	short loc_16C49
; ---------------------------------------------------------------------------

loc_16C43:				; CODE XREF: sub_16BC1+23j
		push	[bp+var_2]
		call	sub_17A2C

loc_16C49:				; CODE XREF: sub_16BC1+25j
					; sub_16BC1+61j ...
		mov	sp, bp
		pop	bp
		retn	4
sub_16BC1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16C4F	proc near		; CODE XREF: sub_16592+2E0p

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+2]
		mov	[bp+var_8], ax
		mov	ax, es:[bx]
		mov	[bp+var_A], ax
		lea	ax, [bp+var_A]
		push	ss
		push	ax
		mov	ax, 61F4h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_16CE5
		mov	ax, 60h	; '`'
		sub	ax, word_471DA
		mov	word_47222, ax
		mov	ax, 58h	; 'X'
		sub	ax, word_471D8
		mov	word_47220, ax
		mov	ax, 132h
		sub	ax, word_471DA
		mov	word_47226, ax
		mov	ax, 0A5h ; '�'
		sub	ax, word_471D8
		mov	word_47224, ax
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 1B0Eh
		push	ds
		push	ax
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, 61F4h
		push	ds
		push	ax
		mov	ax, 6240h
		push	ds
		push	ax
		mov	ax, 0ABAh
		push	ds
		push	ax
		mov	ax, 14h
		push	ax
		nop
		push	cs
		call	near ptr sub_11334
		push	dx
		push	ax
		call	sub_17014
		cmp	word_490A0, 0

loc_16CDA:				; CODE XREF: sub_16C4F+11Cj
		jnz	short loc_16CDF
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16CDF:				; CODE XREF: sub_16C4F:loc_16CDAj
		mov	ax, 2
		jmp	loc_16E5C
; ---------------------------------------------------------------------------

loc_16CE5:				; CODE XREF: sub_16C4F+2Cj
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	word ptr dword_47268+2
		push	word ptr dword_47268
		nop
		push	cs
		call	near ptr sub_11ABC
		or	ax, ax
		jnz	short loc_16D08
		jmp	loc_16DBA
; ---------------------------------------------------------------------------

loc_16D08:				; CODE XREF: sub_16C4F+B4j
		mov	ax, word_4722C
		mov	dx, word_4722E
		cmp	[bp+var_4], ax
		jnz	short loc_16D3F
		cmp	[bp+var_2], dx
		jnz	short loc_16D3F
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_123F9
		or	ax, ax
		jnz	short loc_16D39
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16D39:				; CODE XREF: sub_16C4F+E5j
		mov	ax, 1
		jmp	loc_16E5C
; ---------------------------------------------------------------------------

loc_16D3F:				; CODE XREF: sub_16C4F+C3j
					; sub_16C4F+C8j
		mov	ax, word_4725C
		mov	dx, word_4725E
		cmp	[bp+var_4], ax
		jnz	short loc_16D6E
		cmp	[bp+var_2], dx
		jnz	short loc_16D6E
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_123F9
		or	ax, ax
		jmp	loc_16CDA
; ---------------------------------------------------------------------------

loc_16D6E:				; CODE XREF: sub_16C4F+FAj
					; sub_16C4F+FFj
		mov	ax, word_47218
		mov	dx, word_4721A
		cmp	[bp+var_4], ax
		jz	short loc_16D7D
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16D7D:				; CODE XREF: sub_16C4F+129j
		cmp	[bp+var_2], dx
		jz	short loc_16D85
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16D85:				; CODE XREF: sub_16C4F+131j
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_123F9
		or	ax, ax
		jnz	short loc_16DA5
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16DA5:				; CODE XREF: sub_16C4F+151j
		mov	word_47248, 0
		call	sub_16FA8
		call	sub_178EB
		call	sub_179ED
		call	sub_173B7
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16DBA:				; CODE XREF: sub_16C4F+B6j
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_16DCD
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jnz	short loc_16DCD
		jmp	loc_16E5A
; ---------------------------------------------------------------------------

loc_16DCD:				; CODE XREF: sub_16C4F+171j
					; sub_16C4F+179j
		mov	[bp+var_6], 0

loc_16DD2:				; CODE XREF: sub_16C4F+208j
		lea	ax, [bp+var_A]
		push	ss
		push	ax
		mov	ax, [bp+var_6]
		mov	cl, 3
		shl	ax, cl
		add	ax, 0AD2h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_16E4E
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		mov	ax, [bp+var_6]
		mov	cl, 3
		shl	ax, cl
		add	ax, 0AD2h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_13F9E
		or	ax, ax
		jz	short loc_16E4E
		test	[bp+arg_0], 40h
		jz	short loc_16E2B
		cmp	word_47232, 0
		jz	short loc_16E4E
		mov	ax, word_47236
		cmp	[bp+var_6], ax
		jz	short loc_16E4E
		mov	ax, [bp+var_6]
		mov	word_47236, ax

loc_16E26:				; CODE XREF: sub_16C4F+1F7j
		call	sub_16E62
		jmp	short loc_16E4E
; ---------------------------------------------------------------------------

loc_16E2B:				; CODE XREF: sub_16C4F+1C0j
		test	[bp+arg_0], 80h
		jz	short loc_16E48
		cmp	word_47232, 0
		jz	short loc_16E4E
		mov	ax, word_47234
		cmp	[bp+var_6], ax
		jz	short loc_16E4E
		mov	ax, [bp+var_6]
		mov	word_47234, ax
		jmp	short loc_16E26
; ---------------------------------------------------------------------------

loc_16E48:				; CODE XREF: sub_16C4F+1E0j
		push	[bp+var_6]
		call	sub_17A6A

loc_16E4E:				; CODE XREF: sub_16C4F+19Bj
					; sub_16C4F+1BAj ...
		inc	[bp+var_6]
		cmp	[bp+var_6], 10h
		jge	short loc_16E5A
		jmp	loc_16DD2
; ---------------------------------------------------------------------------

loc_16E5A:				; CODE XREF: sub_16C4F+8Dj
					; sub_16C4F+E7j ...
		sub	ax, ax

loc_16E5C:				; CODE XREF: sub_16C4F+93j
					; sub_16C4F+EDj
		mov	sp, bp
		pop	bp
		retn	6
sub_16C4F	endp


; =============== S U B	R O U T	I N E =======================================


sub_16E62	proc near		; CODE XREF: sub_16C4F:loc_16E26p
					; sub_17A6A+18p
		xor	ax, ax
		call	__chkstk
		call	sub_2329F
		call	sub_16FA8
		call	sub_16E80
		call	sub_17551
		call	sub_17638
		call	sub_23285
		retn
sub_16E62	endp


; =============== S U B	R O U T	I N E =======================================


sub_16E80	proc near		; CODE XREF: sub_16E62+Fp
					; sub_1758A+20p
		xor	ax, ax
		call	__chkstk
		mov	ax, word ptr dword_47228
		or	ax, word ptr dword_47228+2
		jz	short locret_16EE1
		push	word ptr dword_47228+2
		push	word ptr dword_47228
		nop
		push	cs
		call	near ptr sub_1B047
		call	sub_232D3
		push	word_4723A
		push	word_47238
		mov	ax, word_4723E
		sub	ax, word_4723A
		inc	ax
		and	al, 0FEh
		push	ax
		mov	ax, word_4723C
		sub	ax, word_47238
		push	ax
		les	bx, dword_47228
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		sub	ax, ax
		push	ax
		call	dword_4DF50
		call	sub_232B2
		push	word ptr dword_47228+2
		push	word ptr dword_47228
		nop
		push	cs
		call	near ptr sub_1B063

locret_16EE1:				; CODE XREF: sub_16E80+Ej
		retn
sub_16E80	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16EE2	proc near		; CODE XREF: sub_16592:loc_16644p
					; sub_17014+42p

var_24		= word ptr -24h
var_22		= word ptr -22h
var_16		= byte ptr -16h
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 24h	; '$'
		call	__chkstk
		mov	ax, 6252h
		push	ds
		push	ax
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_110E4
		mov	ax, word ptr dword_47228
		mov	dx, word ptr dword_47228+2
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_22], ax
		mov	[bp+var_24], ax
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_16F74
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		mov	ax, 6252h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		mov	ax, 0FFh
		push	ax
		nop
		push	cs
		call	near ptr sub_108CB
		call	sub_278A3
		or	ax, ax
		jnz	short loc_16F4F
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_16F4F:				; CODE XREF: sub_16EE2+66j
		nop
		push	cs
		call	near ptr sub_1B0CF
		push	[bp+var_2]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_1AEAD
		mov	word_490A0, 0
		mov	ax, [bp+var_24]
		mov	dx, [bp+var_22]
		mov	word ptr dword_47228, ax
		mov	word ptr dword_47228+2,	dx
		jmp	short loc_16FA4
; ---------------------------------------------------------------------------

loc_16F74:				; CODE XREF: sub_16EE2+45j
		push	[bp+var_22]
		push	[bp+var_24]
		nop
		push	cs
		call	near ptr sub_1AEAD
		mov	word_490A0, 0
		sub	ax, ax
		mov	word ptr dword_47228+2,	ax
		mov	word ptr dword_47228, ax
		call	sub_25276
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	word ptr dword_47228, ax
		mov	word ptr dword_47228+2,	dx
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_16FA4:				; CODE XREF: sub_16EE2+90j
		mov	sp, bp
		pop	bp
		retn
sub_16EE2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_16FA8	proc near		; CODE XREF: sub_16BC1+58p
					; sub_16C4F+15Cp ...

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_12		= byte ptr -12h

		push	bp
		mov	bp, sp
		mov	ax, 20h	; ' '
		call	__chkstk
		mov	ax, 6252h
		push	ds
		push	ax
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_110E4
		mov	ax, word ptr dword_47228
		mov	dx, word ptr dword_47228+2
		mov	[bp+var_20], ax
		mov	[bp+var_1E], dx
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_17006
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		mov	ax, 6252h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		mov	ax, 0FFh
		push	ax
		nop
		push	cs
		call	near ptr sub_10963
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_17010
; ---------------------------------------------------------------------------

loc_17006:				; CODE XREF: sub_16FA8+3Dj
		call	sub_25276
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_17010:				; CODE XREF: sub_16FA8+5Cj
		mov	sp, bp
		pop	bp
		retn
sub_16FA8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17014	proc near		; CODE XREF: sub_16C4F+83p
					; sub_170C8+135p

var_14		= byte ptr -14h
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_17080
		mov	ax, 61F4h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_16B4A
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_17089
		lea	ax, [bp+var_14]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_17060
		call	sub_16EE2
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_1707D
; ---------------------------------------------------------------------------

loc_17060:				; CODE XREF: sub_17014+40j
		mov	[bp+var_2], 1
		mov	ax, 61F4h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_16B4A
		mov	ax, [bp+arg_2]
		neg	ax
		push	ax
		mov	ax, [bp+arg_0]
		neg	ax
		push	ax
		call	sub_17089

loc_1707D:				; CODE XREF: sub_17014+4Aj
		call	sub_1758A

loc_17080:				; CODE XREF: sub_17014+16j
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retn	4
sub_17014	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17089	proc near		; CODE XREF: sub_17014+27p
					; sub_17014+66p

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_2]
		add	word_4723E, ax
		mov	ax, [bp+arg_0]
		add	word_4723C, ax
		mov	ax, [bp+arg_2]
		add	word_471DA, ax
		mov	ax, [bp+arg_0]
		add	word_471D8, ax
		call	sub_170B6
		pop	bp
		retn	4
sub_17089	endp


; =============== S U B	R O U T	I N E =======================================


sub_170B6	proc near		; CODE XREF: sub_16BC1+4Cp
					; sub_17089+26p
		xor	ax, ax
		call	__chkstk
		mov	ax, 6252h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_11126
		retn
sub_170B6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_170C8	proc near		; CODE XREF: sub_16592+365p

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 1Eh
		call	__chkstk
		mov	ax, [bp+arg_0]
		cmp	ax, 8
		jnz	short loc_170DE
		jmp	loc_171B4
; ---------------------------------------------------------------------------

loc_170DE:				; CODE XREF: sub_170C8+11j
		cmp	ax, 7Fh	; ''
		jnz	short loc_170E6
		jmp	loc_171B4
; ---------------------------------------------------------------------------

loc_170E6:				; CODE XREF: sub_170C8+19j
		cmp	ax, 20h	; ' '
		jb	short loc_170F0
		cmp	ax, 7Eh	; '~'
		jbe	short loc_170F9

loc_170F0:				; CODE XREF: sub_170C8+21j
		cmp	[bp+arg_0], 0Dh
		jz	short loc_170F9
		jmp	loc_17251
; ---------------------------------------------------------------------------

loc_170F9:				; CODE XREF: sub_170C8+26j
					; sub_170C8+2Cj
		cmp	word_47248, 7C1h
		jl	short loc_17104
		jmp	loc_17251
; ---------------------------------------------------------------------------

loc_17104:				; CODE XREF: sub_170C8+37j
		mov	ax, 6280h
		push	ds
		push	ax
		mov	ax, 6260h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_1711A
		jmp	loc_17251
; ---------------------------------------------------------------------------

loc_1711A:				; CODE XREF: sub_170C8+4Dj
		push	[bp+arg_0]
		call	sub_172F4
		mov	ax, 28h	; '('
		push	ax
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		call	sub_26CF0
		or	ax, ax
		jz	short loc_17135
		jmp	loc_171EF
; ---------------------------------------------------------------------------

loc_17135:				; CODE XREF: sub_170C8+68j
		call	sub_173B7
		mov	[bp+var_1C], 0

loc_1713D:				; CODE XREF: sub_170C8+142j
		mov	ax, 6280h
		push	ds
		push	ax
		mov	ax, 6260h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short loc_17153
		jmp	loc_17212
; ---------------------------------------------------------------------------

loc_17153:				; CODE XREF: sub_170C8+86j
		cmp	word_471D8, 0A5h ; '�'
		jl	short loc_1715E
		jmp	loc_17212
; ---------------------------------------------------------------------------

loc_1715E:				; CODE XREF: sub_170C8+91j
		cmp	[bp+var_1C], 0
		jz	short loc_17167
		jmp	loc_17212
; ---------------------------------------------------------------------------

loc_17167:				; CODE XREF: sub_170C8+9Aj
		mov	ax, word_47232
		mov	cl, 3
		shl	ax, cl
		mov	[bp+var_1E], ax
		mov	cx, word_47260
		sub	cx, word_47244
		inc	cx
		inc	cx
		mov	es, seg_47032
		assume es:dseg
		mov	ax, es:word_41190
		sub	ax, es:word_4118C
		imul	cx
		cwd
		mov	bx, [bp+var_1E]
		mov	es, seg_47034
		mov	cx, es:[bx+1B8h]
		sub	cx, es:[bx+1B4h]
		idiv	cx
		inc	ax
		mov	[bp+var_2], ax
		or	ax, ax
		jle	short loc_171F3
		add	ax, word_471D8
		cmp	ax, 0A5h ; '�'
		jg	short loc_171F3
		mov	ax, [bp+var_2]
		jmp	short loc_171FA
; ---------------------------------------------------------------------------

loc_171B4:				; CODE XREF: sub_170C8+13j
					; sub_170C8+1Bj
		cmp	word_47248, 0
		jz	short loc_171C0
		call	sub_17274
		jmp	short loc_171DA
; ---------------------------------------------------------------------------

loc_171C0:				; CODE XREF: sub_170C8+F1j
		dec	word_46CA0
		js	short loc_171C9
		jmp	loc_1725A
; ---------------------------------------------------------------------------

loc_171C9:				; CODE XREF: sub_170C8+FCj
					; sub_170C8+18Fj
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6

loc_171DA:				; CODE XREF: sub_170C8+F6j
					; sub_170C8+1A3j
		mov	ax, 28h	; '('
		push	ax
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		call	sub_26CF0
		or	ax, ax
		jnz	short loc_171EF
		call	sub_173B7

loc_171EF:				; CODE XREF: sub_170C8+6Aj
					; sub_170C8+122j ...
		sub	ax, ax
		jmp	short loc_1726E
; ---------------------------------------------------------------------------

loc_171F3:				; CODE XREF: sub_170C8+DCj
					; sub_170C8+E5j
		mov	ax, 0A5h ; '�'
		sub	ax, word_471D8

loc_171FA:				; CODE XREF: sub_170C8+EAj
		cwd
		push	dx
		push	ax
		call	sub_17014
		mov	[bp+var_1C], ax
		cmp	word_490A0, 0
		jnz	short loc_1720D
		jmp	loc_1713D
; ---------------------------------------------------------------------------

loc_1720D:				; CODE XREF: sub_170C8+140j
		mov	ax, 2
		jmp	short loc_1726E
; ---------------------------------------------------------------------------

loc_17212:				; CODE XREF: sub_170C8+88j
					; sub_170C8+93j ...
		mov	ax, 6280h
		push	ds
		push	ax
		mov	ax, 6260h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_171EF
		dec	word_46CA0
		js	short loc_1723E
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_171EF
; ---------------------------------------------------------------------------

loc_1723E:				; CODE XREF: sub_170C8+161j
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6
		jmp	short loc_171EF
; ---------------------------------------------------------------------------

loc_17251:				; CODE XREF: sub_170C8+2Ej
					; sub_170C8+39j ...
		dec	word_46CA0
		jns	short loc_1725A
		jmp	loc_171C9
; ---------------------------------------------------------------------------

loc_1725A:				; CODE XREF: sub_170C8+FEj
					; sub_170C8+18Dj
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		mov	es:[bx], al
		jmp	loc_171DA
; ---------------------------------------------------------------------------

loc_1726E:				; CODE XREF: sub_170C8+129j
					; sub_170C8+148j
		mov	sp, bp
		pop	bp
		retn	2
sub_170C8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17274	proc near		; CODE XREF: sub_170C8+F3p

var_8		= dword	ptr -8
var_4		= byte ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	si
		mov	[bp+var_2], 0
		les	bx, dword_4724A
		assume es:nothing
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		call	sub_179ED
		dec	word_47248
		jmp	short loc_172B0
; ---------------------------------------------------------------------------

loc_1729F:				; CODE XREF: sub_17274+48j
		cmp	byte ptr es:[bx+si-2], 46h ; 'F'
		jnz	short loc_172BE
		sub	word_47248, 3

loc_172AB:				; CODE XREF: sub_17274+70j
		mov	[bp+var_2], 1

loc_172B0:				; CODE XREF: sub_17274+29j
		mov	bx, word_47248
		les	si, [bp+var_8]
		cmp	byte ptr es:[bx+si-3], 1
		jz	short loc_1729F

loc_172BE:				; CODE XREF: sub_17274+30j
		mov	bx, word_47248
		les	si, [bp+var_8]
		cmp	byte ptr es:[bx+si-4], 1
		jnz	short loc_172E6
		mov	al, es:[bx+si-3]
		mov	[bp+var_4], al
		cmp	al, 43h	; 'C'
		jz	short loc_172DF
		cmp	al, 53h	; 'S'
		jz	short loc_172DF
		cmp	al, 4Ah	; 'J'
		jnz	short loc_172E6

loc_172DF:				; CODE XREF: sub_17274+61j
					; sub_17274+65j
		sub	word_47248, 4
		jmp	short loc_172AB
; ---------------------------------------------------------------------------

loc_172E6:				; CODE XREF: sub_17274+56j
					; sub_17274+69j
		cmp	[bp+var_2], 0
		jz	short loc_172EF
		call	sub_178EB

loc_172EF:				; CODE XREF: sub_17274+76j
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_17274	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_172F4	proc near		; CODE XREF: sub_170C8+55p

var_4		= dword	ptr -4
arg_0		= byte ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	si
		les	bx, dword_4724A
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, word_4721C
		cmp	word_4724E, ax
		jz	short loc_1732E
		push	word_4724E
		mov	ax, 43h	; 'C'
		push	ax
		call	sub_17363
		add	sp, 4
		mov	ax, word_4724E
		mov	word_4721C, ax

loc_1732E:				; CODE XREF: sub_172F4+24j
		mov	ax, word_471DC
		cmp	word_47252, ax
		jz	short loc_1734B
		push	word_47252
		mov	ax, 4Ah	; 'J'
		push	ax
		call	sub_17363
		add	sp, 4
		mov	ax, word_47252
		mov	word_471DC, ax

loc_1734B:				; CODE XREF: sub_172F4+41j
		mov	si, word_47248
		inc	word_47248
		les	bx, [bp+var_4]
		mov	al, [bp+arg_0]
		mov	es:[bx+si], al
		pop	si
		mov	sp, bp
		pop	bp
		retn	2
sub_172F4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17363	proc near		; CODE XREF: sub_172F4+2Ep
					; sub_172F4+4Bp

var_4		= dword	ptr -4
arg_0		= byte ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	si
		les	bx, dword_4724A
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	si, word_47248
		inc	word_47248
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx+si], 1
		mov	si, word_47248
		inc	word_47248
		les	bx, [bp+var_4]
		mov	al, [bp+arg_0]
		mov	es:[bx+si], al
		les	bx, [bp+var_4]
		mov	si, word_47248
		mov	ax, [bp+arg_2]
		mov	es:[bx+si], ax
		add	word_47248, 2
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_17363	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_173B7	proc near		; CODE XREF: sub_16C4F+165p
					; sub_170C8:loc_17135p	...

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	si
		les	bx, dword_4724A
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		mov	ax, 6252h
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_1744E
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_20483
		mov	ax, 6280h
		push	ds
		push	ax
		call	sub_204A1
		mov	ax, [bp+var_8]
		add	ax, [bp+var_6]
		mov	word_4721E, ax
		mov	ax, [bp+var_6]
		add	word_47260, ax
		cmp	word_47248, 0
		jz	short loc_1743D
		mov	bx, word_47248
		les	si, [bp+var_C]
		cmp	byte ptr es:[bx+si-1], 0Dh
		jnz	short loc_1743D
		cmp	word_47252, 1
		jnz	short loc_17437
		mov	ax, word_47246
		sub	ax, word_47242
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, word_47242
		jmp	short loc_1743A
; ---------------------------------------------------------------------------

loc_17437:				; CODE XREF: sub_173B7+6Cj
		mov	ax, word_47242

loc_1743A:				; CODE XREF: sub_173B7+7Ej
		mov	word_47262, ax

loc_1743D:				; CODE XREF: sub_173B7+57j
					; sub_173B7+65j
		call	sub_17551
		mov	ax, 0Fh
		push	ax
		call	sub_20B5B
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_173B7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1744E	proc far		; CODE XREF: sub_10A53+262p
					; sub_173B7+2Bp

var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_17475
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_17475
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jnz	short loc_17475
		sub	ax, ax
		jmp	short loc_1747A
; ---------------------------------------------------------------------------

loc_17475:				; CODE XREF: sub_1744E+11j
					; sub_1744E+19j ...
		mov	al, byte ptr word_4B483
		sub	ah, ah

loc_1747A:				; CODE XREF: sub_1744E+25j
		push	ax
		call	sub_20AC6
		cmp	[bp+arg_4], 0
		jz	short loc_174E8
		les	bx, [bp+arg_6]
		cmp	word ptr es:[bx+2], 0
		jnz	short loc_174E8

loc_17490:				; CODE XREF: sub_1744E+A1j
		mov	ax, 0Fh

loc_17493:				; CODE XREF: sub_1744E+A7j
		push	ax
		call	sub_20B78
		mov	ax, 4
		push	ax
		call	sub_20B95
		mov	ax, word ptr [bp+arg_6]
		mov	dx, word ptr [bp+arg_6+2]
		add	ax, 0Eh
		push	dx
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_321A6
		test	byte ptr [bp+var_6], 1
		jz	short loc_174C3
		dec	[bp+var_6]
		dec	[bp+var_2]

loc_174C3:				; CODE XREF: sub_1744E+6Dj
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_174F7
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+8]
		neg	ax
		push	ax
		mov	ax, es:[bx+6]
		neg	ax
		push	ax
		call	sub_208AA
		jmp	short loc_17509
; ---------------------------------------------------------------------------

loc_174E8:				; CODE XREF: sub_1744E+36j
					; sub_1744E+40j
		les	bx, [bp+arg_6]
		cmp	word ptr es:[bx], 0
		jz	short loc_17490
		mov	ax, es:[bx+2]
		jmp	short loc_17493
; ---------------------------------------------------------------------------

loc_174F7:				; CODE XREF: sub_1744E+7Bj
		sub	ax, ax
		push	ax
		call	sub_20ADE
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_208DF

loc_17509:				; CODE XREF: sub_1744E+98j
		les	bx, [bp+arg_6]
		les	bx, es:[bx+18h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+16h]
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		mov	ax, 1
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_14D83
		mov	ax, word_490A0
		mov	[bp+var_A], ax
		sub	ax, ax
		push	ax
		call	sub_20AC6
		sub	ax, ax
		push	ax
		call	sub_20B95
		mov	ax, [bp+var_A]
		mov	sp, bp
		pop	bp
		retf	0Ah
sub_1744E	endp


; =============== S U B	R O U T	I N E =======================================


sub_17551	proc near		; CODE XREF: sub_16E62+12p
					; sub_173B7:loc_1743Dp
		xor	ax, ax
		call	__chkstk
		mov	word_471E2, 0
		mov	ax, 6280h
		push	ds
		push	ax
		mov	ax, 6260h
		push	ds
		push	ax
		call	sub_20A1B
		or	ax, ax
		jz	short locret_17589
		mov	ax, word_47260
		sub	ax, word_4721E
		cmp	ax, word_47240
		jl	short locret_17589
		nop
		push	cs
		call	near ptr sub_14C44
		mov	word_471E2, 1

locret_17589:				; CODE XREF: sub_17551+1Ej
					; sub_17551+2Bj
		retn
sub_17551	endp


; =============== S U B	R O U T	I N E =======================================


sub_1758A	proc near		; CODE XREF: sub_1630A+Cp seg000:6B43p ...
		xor	ax, ax
		call	__chkstk
		call	sub_2329F
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		mov	ax, 61F4h
		push	ds
		push	ax
		call	sub_233FE
		call	sub_16E80
		call	sub_173B7
		call	sub_23285
		retn
sub_1758A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_175B6	proc near		; CODE XREF: sub_1630A+Fp
					; sub_16B4A+21p ...

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_175D1
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jz	short loc_17634

loc_175D1:				; CODE XREF: sub_175B6+11j
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		mov	ax, 0AC2h
		push	ds
		push	ax
		call	sub_233FE
		push	word_41AB0
		push	word_41AAA
		push	word_41AAE
		call	sub_23519
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		mov	[bp+var_2], 0

loc_17605:				; CODE XREF: sub_175B6+79j
		push	[bp+var_2]
		mov	ax, [bp+var_2]
		mov	cl, 3
		shl	ax, cl
		add	ax, 0AD2h
		push	ds
		push	ax
		call	sub_17A89
		mov	ax, [bp+var_2]
		mov	cl, 3
		shl	ax, cl
		add	ax, 0AD2h
		push	ds
		push	ax
		call	sub_233FE
		inc	[bp+var_2]
		cmp	[bp+var_2], 10h
		jl	short loc_17605
		call	sub_17638

loc_17634:				; CODE XREF: sub_175B6+19j
		mov	sp, bp
		pop	bp
		retn
sub_175B6	endp


; =============== S U B	R O U T	I N E =======================================


sub_17638	proc near		; CODE XREF: sub_16E62+15p
					; sub_175B6+7Bp
		xor	ax, ax
		call	__chkstk
		cmp	word_47232, 0
		jz	short loc_1764B
		mov	ax, word_47234
		jmp	short loc_1764E
; ---------------------------------------------------------------------------

loc_1764B:				; CODE XREF: sub_17638+Cj
		mov	ax, 0Fh

loc_1764E:				; CODE XREF: sub_17638+11j
		push	ax
		mov	ax, 0ACAh
		push	ds
		push	ax
		call	sub_17A89
		mov	byte_490A6, 3
		mov	byte_490B0, 3
		cmp	word_47236, 0
		jnz	short loc_1766F
		call	sub_20AF6
		jmp	short loc_17684
; ---------------------------------------------------------------------------

loc_1766F:				; CODE XREF: sub_17638+2Ej
		cmp	word_47232, 0
		jz	short loc_1767B
		mov	ax, word_47236
		jmp	short loc_1767E
; ---------------------------------------------------------------------------

loc_1767B:				; CODE XREF: sub_17638+3Cj
		mov	ax, 0Fh

loc_1767E:				; CODE XREF: sub_17638+41j
		push	ax
		call	sub_20B78

loc_17684:				; CODE XREF: sub_17638+35j
		mov	ax, 0ACAh
		push	ds
		push	ax
		call	sub_201CE
		mov	al, byte ptr word_4724E
		sub	ah, ah
		push	ax
		call	sub_20AC6
		mov	ax, 4
		push	ax
		call	sub_20B95
		mov	ax, 1Bh
		push	ax
		mov	ax, 0AEh ; '�'
		push	ax
		call	sub_20892
		mov	ax, 41h	; 'A'
		push	ax
		call	sub_20137
		sub	ax, ax
		push	ax
		call	sub_20B95
		sub	ax, ax
		push	ax
		call	sub_20AC6
		retn
sub_17638	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_176C9	proc far		; CODE XREF: sub_1071A+78p
					; sub_1116E+1A4p ...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	di
		push	si
		mov	ax, [bp+arg_0]
		sub	ax, 77BCh
		cwd
		mov	cx, 26h	; '&'
		idiv	cx
		mov	[bp+var_E], ax
		mov	ax, 1E7h
		imul	word_4B45F
		mov	bx, ax
		mov	ax, [bx-76B0h]
		mov	dx, [bx-76AEh]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	[bp+var_10], 0
		jmp	short loc_17715
; ---------------------------------------------------------------------------

loc_17703:				; CODE XREF: sub_176C9+52j
		les	di, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		add	word ptr [bp+var_8], cx
		inc	[bp+var_10]

loc_17715:				; CODE XREF: sub_176C9+38j
		mov	ax, [bp+var_E]
		cmp	[bp+var_10], ax
		jnz	short loc_17703
		mov	cx, 3
		mov	si, 0C7Ah
		les	di, [bp+var_8]
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		add	word ptr [bp+var_8], 2
		mov	bx, [bp+arg_0]
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B047
		mov	bx, [bp+arg_0]
		les	bx, [bx+18h]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		mov	ax, word ptr [bp+var_8]
		mov	dx, word ptr [bp+var_8+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		jmp	short loc_1778D
; ---------------------------------------------------------------------------

loc_17763:				; CODE XREF: sub_176C9+EAj
		les	bx, [bp+var_C]
		cmp	byte ptr es:[bx], 0Dh
		jz	short loc_17772
		cmp	byte ptr es:[bx], 5Ch ;	'\'
		jnz	short loc_1777B

loc_17772:				; CODE XREF: sub_176C9+A1j
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 20h ;	' '
		jmp	short loc_17787
; ---------------------------------------------------------------------------

loc_1777B:				; CODE XREF: sub_176C9+A7j
		les	bx, [bp+var_C]
		mov	al, es:[bx]
		les	bx, [bp+var_4]
		mov	es:[bx], al

loc_17787:				; CODE XREF: sub_176C9+B0j
					; sub_176C9+F6j
		inc	word ptr [bp+var_C]
		inc	word ptr [bp+var_4]

loc_1778D:				; CODE XREF: sub_176C9+98j
		mov	ax, word ptr [bp+var_C]
		mov	bx, [bp+arg_0]
		les	bx, [bx+18h]
		sub	ax, es:[bx]
		mov	bx, [bp+arg_0]
		cmp	ax, [bx+16h]
		jge	short loc_177C1
		mov	ax, word ptr [bp+var_4]
		sub	ax, word ptr [bp+var_8]
		cmp	ax, 16h
		jge	short loc_177C1
		les	bx, [bp+var_C]
		cmp	byte ptr es:[bx], 1
		jnz	short loc_17763
		add	word ptr [bp+var_C], 4
		dec	word ptr [bp+var_C]
		dec	word ptr [bp+var_4]
		jmp	short loc_17787
; ---------------------------------------------------------------------------

loc_177C1:				; CODE XREF: sub_176C9+D6j
					; sub_176C9+E1j
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0
		mov	bx, [bp+arg_0]
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	bx, [bp+arg_0]
		cmp	word ptr [bx+16h], 0
		jnz	short loc_177F2
		mov	cx, 9
		mov	si, 0C7Dh
		les	di, [bp+var_8]
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_177F2:				; CODE XREF: sub_176C9+114j
		les	di, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		cmp	cx, 16h
		jnz	short loc_17856
		mov	ax, 20h	; ' '
		push	ax		; int
		push	es
		push	word ptr [bp+var_8] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_17825
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0

loc_17825:				; CODE XREF: sub_176C9+153j
		mov	di, 0C86h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds

loc_17856:				; CODE XREF: sub_176C9+139j
		mov	di, word ptr [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		sub	cx, 19h
		neg	cx
		push	cx		; size_t
		mov	ax, 0C8Ah
		push	ds
		push	ax		; char *
		push	es
		push	word ptr [bp+var_8] ; char *
		call	_strncat
		add	sp, 0Ah
		les	bx, [bp+var_8]
		assume es:nothing
		mov	byte ptr es:[bx+19h], 0
		mov	di, 0CA9h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, 0Ah
		push	ax		; int
		mov	di, word ptr [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, word ptr [bp+var_8]
		mov	ax, dx
		push	ax
		push	cx		; char *
		mov	ax, [bp+arg_0]
		sub	ax, 77BCh
		cwd
		mov	cx, 26h	; '&'
		idiv	cx
		add	ah, 64h	; 'd'
		push	ax		; int
		call	_itoa
		add	sp, 8
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	2
sub_176C9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_178EB	proc near		; CODE XREF: sub_16592+259p
					; sub_16C4F+15Fp ...

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, word_4B483
		mov	word_4721C, ax
		mov	word_47216, 0
		mov	word_471DC, 1
		les	bx, dword_4724A
		assume es:nothing
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		add	ax, word_47248
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		jmp	short loc_17963
; ---------------------------------------------------------------------------

loc_1792C:				; CODE XREF: sub_178EB+83j
		les	bx, [bp+var_8]
		inc	word ptr [bp+var_8]
		cmp	byte ptr es:[bx], 1
		jnz	short loc_17963
		mov	bx, word ptr [bp+var_8]
		inc	word ptr [bp+var_8]
		mov	al, es:[bx]
		cbw
		cmp	ax, 43h	; 'C'
		jz	short loc_17970
		cmp	ax, 46h	; 'F'
		jz	short loc_17963
		cmp	ax, 4Ah	; 'J'
		jz	short loc_1798B
		cmp	ax, 53h	; 'S'
		jnz	short loc_17963
		mov	bx, word ptr [bp+var_8]
		mov	ax, es:[bx]
		mov	word_47216, ax

loc_1795F:				; CODE XREF: sub_178EB+9Ej
					; sub_178EB+A9j
		add	word ptr [bp+var_8], 2

loc_17963:				; CODE XREF: sub_178EB+3Fj
					; sub_178EB+4Bj ...
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	word ptr [bp+var_8], ax
		jnb	short loc_17996
		jmp	short loc_1792C
; ---------------------------------------------------------------------------

loc_17970:				; CODE XREF: sub_178EB+5Aj
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_17980
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jz	short loc_17963

loc_17980:				; CODE XREF: sub_178EB+8Bj
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	word_4721C, ax
		jmp	short loc_1795F
; ---------------------------------------------------------------------------

loc_1798B:				; CODE XREF: sub_178EB+64j
		mov	bx, word ptr [bp+var_8]
		mov	ax, es:[bx]
		mov	word_471DC, ax
		jmp	short loc_1795F
; ---------------------------------------------------------------------------

loc_17996:				; CODE XREF: sub_178EB+81j
		mov	sp, bp
		pop	bp
		retn
sub_178EB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1799A	proc near		; CODE XREF: sub_16592+280p
					; sub_16592+480p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		cmp	word_47250, 0
		jnz	short loc_179BA
		push	[bp+arg_0]
		mov	ax, 0D00h
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		jmp	short loc_179E7
; ---------------------------------------------------------------------------

loc_179BA:				; CODE XREF: sub_1799A+10j
		mov	[bp+var_2], 1
		mov	[bp+var_4], 1

loc_179C4:				; CODE XREF: sub_1799A+4Bj
		mov	ax, word_47250
		test	[bp+var_4], ax
		jz	short loc_179DB
		push	[bp+arg_0]
		mov	ax, [bp+var_2]
		add	ah, 0Dh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73

loc_179DB:				; CODE XREF: sub_1799A+30j
		inc	[bp+var_2]
		shl	[bp+var_4], 1
		cmp	[bp+var_2], 6
		jl	short loc_179C4

loc_179E7:				; CODE XREF: sub_1799A+1Ej
		mov	sp, bp
		pop	bp
		retn	2
sub_1799A	endp


; =============== S U B	R O U T	I N E =======================================


sub_179ED	proc near		; CODE XREF: sub_16C4F+162p
					; sub_17274+22p
		xor	ax, ax
		call	__chkstk
		push	word_471DC
		call	sub_17A2C
		push	word_4721C
		call	sub_17A6A
		retn
sub_179ED	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17A03	proc near		; CODE XREF: sub_16BC1+7Dp

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_47250
		cmp	[bp+arg_0], ax
		jz	short loc_17A28
		sub	ax, ax
		push	ax
		call	sub_1799A
		mov	ax, [bp+arg_0]
		mov	word_47250, ax
		mov	ax, 1
		push	ax
		call	sub_1799A

loc_17A28:				; CODE XREF: sub_17A03+10j
		pop	bp
		retn	2
sub_17A03	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17A2C	proc near		; CODE XREF: sub_16BC1+85p
					; sub_179ED+Bp

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_47252
		cmp	[bp+arg_0], ax
		jz	short loc_17A66
		sub	ax, ax
		push	ax
		mov	ax, word_47252
		add	ah, 0Eh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		mov	ax, [bp+arg_0]
		mov	word_47252, ax
		mov	ax, 1
		push	ax
		mov	ax, word_47252
		add	ah, 0Eh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		call	sub_173B7

loc_17A66:				; CODE XREF: sub_17A2C+10j
		pop	bp
		retn	2
sub_17A2C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17A6A	proc near		; CODE XREF: sub_16C4F+1FCp
					; sub_179ED+12p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4724E
		cmp	[bp+arg_0], ax
		jz	short loc_17A85
		mov	ax, [bp+arg_0]
		mov	word_4724E, ax
		call	sub_16E62

loc_17A85:				; CODE XREF: sub_17A6A+10j
		pop	bp
		retn	2
sub_17A6A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17A89	proc near		; CODE XREF: sub_175B6+5Ep
					; sub_17638+1Cp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	[bp+arg_4], 0
		jnz	short loc_17AA0
		call	sub_20AF6
		jmp	short loc_17AA8
; ---------------------------------------------------------------------------

loc_17AA0:				; CODE XREF: sub_17A89+Ej
		push	[bp+arg_4]
		call	sub_20B78

loc_17AA8:				; CODE XREF: sub_17A89+15j
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_208DF
		pop	bp
		retn	6
sub_17A89	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17AB7	proc near		; CODE XREF: sub_16592+ACp
					; sub_16592+BAp

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C9A8
		push	word_490A4
		push	word_490A2	; void *
		call	sub_2AA92
		push	word_4879A
		push	word_490A4
		push	word_490A2
		call	sub_2A711
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		add	ax, 0Bh
		push	dx
		push	ax
		call	sub_2AAF2
		push	ax		; size_t
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 0Bh
		push	dx
		push	ax		; void *
		push	dx
		push	word ptr [bp+var_4] ; void *
		call	_memmove
		add	sp, 0Ah
		call	sub_232D3
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		sub	ax, ax
		push	ax
		call	sub_2925A
		call	sub_232B2
		mov	sp, bp
		pop	bp
		retn
sub_17AB7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17B3E	proc near		; CODE XREF: sub_17C2A+1Dp

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_4]
		mov	al, es:[bx]
		sub	ah, ah
		mov	word_472EE, ax
		mov	[bp+var_A], ax
		mov	ax, bx
		mov	dx, es
		inc	ax
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		mov	[bp+var_2], 62ACh
		jmp	short loc_17BD3
; ---------------------------------------------------------------------------

loc_17B6B:				; CODE XREF: sub_17B3E+44j
		add	[bp+var_8], 5

loc_17B6F:				; CODE XREF: sub_17B3E+A4j
		mov	bx, [bp+var_8]
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_17BBB
		les	si, [bp+var_6]
		mov	al, es:[si]
		cmp	[bx+4],	al
		jnz	short loc_17B6B
		mov	si, [bx]
		mov	cx, [bx+2]
		mov	bx, cx
		push	si
		mov	di, si
		mov	es, bx
		mov	si, [bp+var_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	si
		push	dx
		push	ax		; char *
		call	_strupr
		add	sp, 4

loc_17BBB:				; CODE XREF: sub_17B3E+39j
		mov	bx, [bp+var_8]
		mov	ax, [bx]
		or	ax, [bx+2]
		jnz	short loc_17BCC
		dec	word ptr [bp+var_6]
		sub	[bp+var_2], 4

loc_17BCC:				; CODE XREF: sub_17B3E+85j
		inc	word ptr [bp+var_6]
		add	[bp+var_2], 4

loc_17BD3:				; CODE XREF: sub_17B3E+2Bj
		mov	ax, [bp+var_A]
		dec	[bp+var_A]
		or	ax, ax
		jz	short loc_17BE4
		mov	[bp+var_8], 0E22h
		jmp	short loc_17B6F
; ---------------------------------------------------------------------------

loc_17BE4:				; CODE XREF: sub_17B3E+9Dj
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_17C1D
		mov	si, 629Eh
		les	di, [bp+arg_0]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		push	dx
		push	ax		; char *
		call	_strupr
		add	sp, 4
		jmp	short loc_17C22
; ---------------------------------------------------------------------------

loc_17C1D:				; CODE XREF: sub_17B3E+ACj
		mov	byte_4727E, 0

loc_17C22:				; CODE XREF: sub_17B3E+DDj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_17B3E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17C2A	proc far		; CODE XREF: sub_17C4E+1Ap
					; sub_23B75+1AP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_8]
		push	cs
		call	near ptr sub_19782
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_17B3E
		pop	bp
		retf	0Ah
sub_17C2A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17C4E	proc far		; CODE XREF: sub_17F89+39p
					; sub_19181+1C9p ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	cs
		call	near ptr sub_17C2A
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_17C9B
		les	bx, [bp+arg_0]
		assume es:nothing
		cmp	word ptr es:[bx], 0
		jz	short loc_17C95
		mov	ax, bx
		mov	dx, es
		add	ax, 14h
		push	dx
		push	ax
		call	sub_19472
		mov	ax, 1
		jmp	short loc_17C97
; ---------------------------------------------------------------------------

loc_17C95:				; CODE XREF: sub_17C4E+34j
		sub	ax, ax

loc_17C97:				; CODE XREF: sub_17C4E+45j
		pop	bp
		retf	12h
sub_17C4E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17C9B	proc far		; CODE XREF: sub_17C4E+2Ap
					; sub_23B75+2AP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 1Eh
		push	ax
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_4]
		mov	ax, 7DB1h
		mov	dx, seg	seg000
		push	dx
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_210F9
		pop	bp
		retf	8
sub_17C9B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_17CC7(__int32, char *)
sub_17CC7	proc far		; CODE XREF: sub_18844+29Ap
					; seg000:8D9Bp	...

var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; __int32
		push	cs
		call	near ptr sub_17D12
		or	ax, ax
		jz	short loc_17CEB
		mov	ax, 1
		jmp	short loc_17D0C
; ---------------------------------------------------------------------------

loc_17CEB:				; CODE XREF: sub_17CC7+1Dj
		mov	word_4E948, 1
		mov	ax, 4
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	far ptr	_access
		add	sp, 6
		mov	[bp+var_2], ax
		mov	word_4E948, 0

loc_17D0C:				; CODE XREF: sub_17CC7+22j
		mov	sp, bp
		pop	bp
		retf	8
sub_17CC7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_17D12(__int32, char *)
sub_17D12	proc far		; CODE XREF: sub_17CC7+18p
					; sub_25317+10FP

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_17D2D

loc_17D28:				; CODE XREF: sub_17D12+35j
					; sub_17D12+5Bj
		mov	ax, 1
		jmp	short loc_17DA9
; ---------------------------------------------------------------------------

loc_17D2D:				; CODE XREF: sub_17D12+14j
		mov	ax, 2Eh	; '.'
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_17D28
		inc	word ptr [bp+var_4]
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; char *
		call	_strupr
		add	sp, 4
		mov	[bp+var_6], 0E22h
		jmp	short loc_17D65
; ---------------------------------------------------------------------------

loc_17D61:				; CODE XREF: sub_17D12+85j
		add	[bp+var_6], 5

loc_17D65:				; CODE XREF: sub_17D12+4Dj
		mov	bx, [bp+var_6]
		mov	ax, [bx]
		or	ax, [bx+2]
		jz	short loc_17D28
		mov	si, [bx]
		mov	cx, [bx+2]
		mov	bx, cx
		push	si
		mov	di, si
		mov	es, bx
		push	ds
		lds	si, [bp+var_4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		repe cmpsb
		jz	short loc_17D93
		sbb	ax, ax
		sbb	ax, 0FFFFh

loc_17D93:				; CODE XREF: sub_17D12+7Aj
		pop	ds
		pop	si
		or	ax, ax
		jnz	short loc_17D61
		les	bx, [bp+arg_0]
		mov	si, [bp+var_6]
		mov	al, [si+4]
		sub	ah, ah
		mov	es:[bx], ax
		sub	ax, ax

loc_17DA9:				; CODE XREF: sub_17D12+19j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	8
sub_17D12	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		push	si
		mov	word ptr [bp-8], 0
		les	bx, [bp+6]
		test	byte ptr es:[bx], 40h
		jz	short loc_17DDE
		cmp	byte ptr es:[bx+1], 2Eh	; '.'
		jnz	short loc_17DD8

loc_17DD3:				; CODE XREF: seg000:7E24j
		sub	ax, ax
		jmp	loc_17E81
; ---------------------------------------------------------------------------

loc_17DD8:				; CODE XREF: seg000:7DD1j seg000:7E22j
		mov	ax, 2
		jmp	loc_17E81
; ---------------------------------------------------------------------------

loc_17DDE:				; CODE XREF: seg000:7DCAj
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		inc	ax
		push	dx
		push	ax
		call	_strupr
		add	sp, 4
		cmp	byte_4727E, 0
		jz	short loc_17E26
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		inc	ax
		mov	bx, ax
		mov	di, 629Eh
		mov	si, bx
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		mov	ds, dx
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		repe cmpsb
		jz	short loc_17E1F
		sbb	ax, ax
		sbb	ax, 0FFFFh

loc_17E1F:				; CODE XREF: seg000:7E18j
		pop	ds
		or	ax, ax
		jz	short loc_17DD8
		jmp	short loc_17DD3
; ---------------------------------------------------------------------------

loc_17E26:				; CODE XREF: seg000:7DF4j
		mov	ax, 2Eh	; '.'
		push	ax
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		inc	ax
		push	dx
		push	ax
		call	_strchr
		add	sp, 6
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		or	dx, ax
		jz	short loc_17E7E
		inc	word ptr [bp-4]
		mov	word ptr [bp-0Ah], 62ACh
		mov	ax, word_472EE
		mov	[bp-6],	ax
		jmp	short loc_17E59
; ---------------------------------------------------------------------------

loc_17E55:				; CODE XREF: seg000:7E77j
		add	word ptr [bp-0Ah], 4

loc_17E59:				; CODE XREF: seg000:7E53j
		mov	ax, [bp-6]
		dec	word ptr [bp-6]
		or	ax, ax
		jz	short loc_17E7E
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		push	ds
		push	word ptr [bp-0Ah]
		call	_stricmp
		add	sp, 8
		or	ax, ax
		jnz	short loc_17E55
		mov	word ptr [bp-8], 2

loc_17E7E:				; CODE XREF: seg000:7E43j seg000:7E61j
		mov	ax, [bp-8]

loc_17E81:				; CODE XREF: seg000:7DD5j seg000:7DDBj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17E89	proc far		; CODE XREF: sub_14619+61p
					; sub_1C5B3+81p ...

var_B0		= dword	ptr -0B0h
var_AA		= byte ptr -0AAh
var_9C		= byte ptr -9Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		mov	ax, 0B0h ; '�'
		call	__chkstk
		push	di
		push	si
		mov	ax, 3
		push	ax
		push	cs
		call	near ptr sub_19782
		mov	ax, 19h
		push	ax		; int
		mov	ax, 1Eh
		push	ax		; int
		mov	ax, 0D96h
		push	ds		; int
		push	ax		; int
		mov	ax, 0D00h
		push	ds
		push	ax		; char *
		mov	ax, 0Ch
		push	ax		; int
		mov	ax, 0DF4h
		push	ds
		push	ax		; __int32
		lea	ax, [bp+var_B0]
		push	ss
		push	ax		; __int32
		call	sub_21616
		cmp	word ptr [bp+var_B0], 0
		jnz	short loc_17ECE
		jmp	loc_17F80
; ---------------------------------------------------------------------------

loc_17ECE:				; CODE XREF: sub_17E89+40j
		mov	ax, 2Eh	; '.'
		push	ax		; int
		lea	ax, [bp+var_AA]
		push	ss
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 5Ch	; '\'
		push	ax		; int
		lea	ax, [bp+var_AA]
		push	ss
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		mov	ax, word ptr [bp+var_4]
		or	ax, word ptr [bp+var_4+2]
		jz	short loc_17F15
		mov	ax, [bp+var_8]
		cmp	word ptr [bp+var_4], ax
		jbe	short loc_17F15
		les	bx, [bp+var_4]
		assume es:nothing
		mov	byte ptr es:[bx], 0

loc_17F15:				; CODE XREF: sub_17E89+7Bj
					; sub_17E89+83j
		lea	di, [bp+var_9C]
		mov	si, 0D00h
		mov	ax, ss
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	ax, 3
		push	ax
		push	cs
		call	near ptr sub_197B5
		mov	di, 0DF4h
		lea	si, [bp+var_9C]
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		push	dx
		push	ax		; char *
		call	sub_1827E
		jmp	short loc_17F83
; ---------------------------------------------------------------------------

loc_17F80:				; CODE XREF: sub_17E89+42j
		mov	ax, 2

loc_17F83:				; CODE XREF: sub_17E89+F5j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_17E89	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_17F89	proc far		; CODE XREF: sub_14619+50p
					; sub_1C5B3+79p

var_A8		= byte ptr -0A8h
var_94		= byte ptr -94h

		push	bp
		mov	bp, sp
		mov	ax, 0A8h ; '�'
		call	__chkstk
		push	di
		push	si
		push	cs
		call	near ptr sub_196F2
		mov	ax, 0E63h
		push	ds
		push	ax
		call	sub_24E7A
		cmp	ax, 2
		jz	short loc_18007
		mov	ax, 3
		push	ax
		mov	ax, 1B2Eh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 0DAAh
		push	ds
		push	ax
		lea	ax, [bp+var_A8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_17C4E
		or	ax, ax
		jz	short loc_18007
		lea	di, [bp+var_94]
		mov	si, 0D00h
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	ax, 3
		push	ax
		push	cs
		call	near ptr sub_197B5
		lea	ax, [bp+var_94]
		push	ss
		push	ax		; char *
		mov	ax, 3
		push	ax		; int
		push	cs
		call	near ptr sub_185CA

loc_18007:				; CODE XREF: sub_17F89+1Ej
					; sub_17F89+3Ej
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_17F89	endp


; =============== S U B	R O U T	I N E =======================================


sub_1800D	proc far		; CODE XREF: sub_1C5B3+C5p
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_196F2
		call	sub_2329F
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		cmp	word_490B8, 0FFFFh
		jnz	short loc_18040
		cmp	word_4B396, 0FFFFh
		jnz	short loc_18040
		mov	ax, 1
		push	ax
		sub	ax, ax
		push	ax
		push	cs
		call	near ptr sub_18143
		jmp	short loc_18060
; ---------------------------------------------------------------------------

loc_18040:				; CODE XREF: sub_1800D+1Dj
					; sub_1800D+24j
		mov	ax, 1
		push	ax
		call	sub_2BE06
		mov	ax, 1
		push	ax
		call	sub_2B31E
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1F192
		nop
		push	cs
		call	near ptr sub_1116E

loc_18060:				; CODE XREF: sub_1800D+31j
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_23285
		retf
sub_1800D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1806F	proc far		; CODE XREF: sub_137E6+313p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_196F2
		cmp	word_4B39E, 0
		jz	short loc_180A0
		cmp	[bp+arg_0], 0
		jz	short loc_1808F
		mov	ax, 0E6Ch
		jmp	short loc_18092
; ---------------------------------------------------------------------------

loc_1808F:				; CODE XREF: sub_1806F+19j
		mov	ax, 0E79h

loc_18092:				; CODE XREF: sub_1806F+1Ej
		push	ds
		push	ax
		call	sub_24E7A
		cmp	ax, 2
		jnz	short loc_180AD
		jmp	short loc_180E0
; ---------------------------------------------------------------------------

loc_180A0:				; CODE XREF: sub_1806F+13j
		push	[bp+arg_0]
		call	sub_25BE9
		cmp	ax, 2
		jz	short loc_180E0

loc_180AD:				; CODE XREF: sub_1806F+2Dj
		mov	byte_41CE0, 0
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2329F
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_181DF
		cmp	[bp+arg_0], 0
		jz	short loc_180D2
		call	sub_26A01

loc_180D2:				; CODE XREF: sub_1806F+5Cj
		call	sub_23285
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_180E0:				; CODE XREF: sub_1806F+2Fj
					; sub_1806F+3Cj
		pop	bp
		retf	2
sub_1806F	endp


; =============== S U B	R O U T	I N E =======================================


sub_180E4	proc far		; CODE XREF: sub_14619+3Fp
					; sub_1C5B3+CDp
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_196F2
		mov	ax, 0E82h
		push	ds
		push	ax
		call	sub_24E7A
		cmp	ax, 2
		jz	short locret_18142
		mov	byte_41CE0, 0
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2329F
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_181DF
		call	sub_23285
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_26A01
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1B2AF
		mov	word_490A0, 0
		mov	word_4B3A0, 1

locret_18142:				; CODE XREF: sub_180E4+18j
		retf
sub_180E4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_18143	proc far		; CODE XREF: sub_1800D+2Ep
					; sub_18D10+52p ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	[bp+arg_2]
		push	cs
		call	near ptr sub_181DF
		call	sub_1824E
		cmp	[bp+arg_2], 0
		jz	short loc_18168
		mov	ax, 0A3C6h
		push	ds
		push	ax
		call	sub_20A92

loc_18168:				; CODE XREF: sub_18143+19j
		mov	byte_41CE0, 0
		cmp	[bp+arg_0], 0
		jz	short loc_18178
		call	sub_26A01

loc_18178:				; CODE XREF: sub_18143+2Ej
		mov	[bp+var_4], 8914h

loc_1817D:				; CODE XREF: sub_18143+4Cj
		push	[bp+var_4]
		call	sub_2BCB0
		add	[bp+var_4], 1E7h
		cmp	[bp+var_4], 0A3B6h
		jb	short loc_1817D
		mov	[bp+var_2], 0CFCCh

loc_18196:				; CODE XREF: sub_18143+65j
		push	[bp+var_2]
		call	sub_2B236
		add	[bp+var_2], 0BBh ; '�'
		cmp	[bp+var_2], 0D94Bh
		jb	short loc_18196
		mov	[bp+var_6], 0C3ECh

loc_181AF:				; CODE XREF: sub_18143+7Ej
		push	[bp+var_6]
		nop
		push	cs
		call	near ptr sub_1F0A6
		add	[bp+var_6], 0BBh ; '�'
		cmp	[bp+var_6], 0CBF5h
		jb	short loc_181AF
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1B2AF
		mov	word_490A0, 0
		nop
		push	cs
		call	near ptr sub_1071A
		mov	sp, bp
		pop	bp
		retf	4
sub_18143	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_181DF	proc far		; CODE XREF: sub_10167+24p
					; sub_1806F+55p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_181F3
		push	cs
		call	near ptr sub_196BF

loc_181F3:				; CODE XREF: sub_181DF+Ej
		sub	ax, ax
		push	ax
		mov	ax, 7CFh
		push	ax
		call	sub_265F3
		mov	word_4DFA0, 0
		mov	word_4DF58, 0
		mov	word_490B8, 0FFFFh
		mov	word_490AE, 0FFFFh
		nop
		push	cs
		call	near ptr sub_1C919
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1CDD7
		nop
		push	cs
		call	near ptr sub_1408E
		mov	word_4B3C8, 6
		mov	word_4B3CA, 0
		mov	byte_4B3CC, 0
		nop
		push	cs
		call	near ptr sub_14144
		mov	word_4B39E, 0
		call	sub_2A016
		pop	bp
		retf	2
sub_181DF	endp


; =============== S U B	R O U T	I N E =======================================


sub_1824E	proc near		; CODE XREF: sub_18143+12p
		xor	ax, ax
		call	__chkstk
		mov	word_4B3C6, 0
		mov	ax, 20h	; ' '
		push	ax		; size_t
		mov	ax, 0E40h
		push	ds
		push	ax		; void *
		mov	ax, 0A3C6h
		push	ds
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		mov	word_4B45F, 0FFFFh
		mov	word_4B481, 0
		retn
sub_1824E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl sub_1827E(char *)
sub_1827E	proc near		; CODE XREF: sub_17E89+F2p

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
arg_0		= dword	ptr  4

; FUNCTION CHUNK AT 8313 SIZE 000002B7 BYTES

		push	bp
		mov	bp, sp
		mov	ax, 1Ch
		call	__chkstk
		push	si
		push	cs
		call	near ptr sub_196F2
		call	sub_2329F
		mov	word_4E948, 1
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		sub	ax, ax
		push	ax
		push	ax		; __int32
		nop
		push	cs
		call	near ptr sub_10458
		or	ax, ax
		jz	short loc_18300
		mov	ax, 180h
		push	ax
		mov	ax, 8301h
		push	ax		; int
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_open
		add	sp, 8
		mov	word_472AE, ax
		or	ax, ax
		jl	short loc_18300
		mov	ax, 62BCh
		push	ds
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_18313

loc_182DA:				; CODE XREF: sub_1827E+301j
		push	word_472AE	; int
		call	_close
		add	sp, 2
		mov	word_4E948, 0
		mov	word_4E948, 0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	far ptr	_remove
		add	sp, 4

loc_18300:				; CODE XREF: sub_1827E+2Cj
					; sub_1827E+49j ...
		mov	word_4E948, 0
sub_1827E	endp ; sp-analysis failed

		call	sub_23285
		call	sub_24F36
		jmp	loc_185AB
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1827E

loc_18313:				; CODE XREF: sub_1827E+5Aj
		mov	ax, 1010h
		push	ax
		call	sub_19715
		mov	ax, 0DFh ; '�'
		push	ax		; unsigned int
		mov	ax, 0A3C6h
		push	ds
		push	ax		; void *
		call	sub_1A3E1
		mov	ax, word_490B8
		inc	ax
		push	ax
		call	sub_19715
		mov	[bp+var_8], 0
		jmp	short loc_18362
; ---------------------------------------------------------------------------

loc_18335:				; CODE XREF: sub_1827E+EAj
		mov	bx, [bp+var_8]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		push	dx
		push	ax
		les	bx, [bp+var_16]
		assume es:nothing
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2AAF2
		push	ax
		call	sub_1A401
		inc	[bp+var_8]

loc_18362:				; CODE XREF: sub_1827E+B5j
		mov	ax, word_490B8
		cmp	[bp+var_8], ax
		jle	short loc_18335
		mov	cx, 46h	; 'F'
		mov	si, 8906h

loc_18370:				; CODE XREF: sub_1827E+11Bj
		cmp	word ptr [si], 0
		jz	short loc_18393

loc_18375:				; CODE XREF: sub_1827E+119j
		mov	[bp+var_A], cx
		mov	cx, 0Eh
		mov	si, 0A1EFh

loc_1837E:				; CODE XREF: sub_1827E+124j
		cmp	word ptr [si], 0
		jz	short loc_1839B

loc_18383:				; CODE XREF: sub_1827E+122j
		mov	[bp+var_18], cx
		push	[bp+var_A]
		call	sub_19715
		mov	word ptr [bp-2], 80DAh
		jmp	short loc_183E5
; ---------------------------------------------------------------------------

loc_18393:				; CODE XREF: sub_1827E+F5j
		sub	si, 1Eh
		dec	cx
		jz	short loc_18375
		jmp	short loc_18370
; ---------------------------------------------------------------------------

loc_1839B:				; CODE XREF: sub_1827E+103j
		sub	si, 1E7h
		dec	cx
		jz	short loc_18383
		jmp	short loc_1837E
; ---------------------------------------------------------------------------

loc_183A4:				; CODE XREF: sub_1827E+17Cj
		mov	ax, 0FFh

loc_183A7:				; CODE XREF: sub_1827E+18Cj
		push	ax
		call	sub_19768
		mov	bx, [bp-2]
		mov	ax, [bx+18h]
		sub	ax, 80DAh
		cwd
		mov	cx, 1Eh
		idiv	cx
		sub	ah, ah
		push	ax
		call	sub_19768
		mov	bx, [bp-2]
		mov	ax, [bx+1Ah]
		sub	ax, 80DAh
		cwd
		mov	cx, 1Eh
		idiv	cx
		sub	ah, ah
		push	ax
		call	sub_19768
		mov	bx, [bp-2]
		mov	al, [bx+1Ch]
		sub	ah, ah
		push	ax
		call	sub_19768
		add	word ptr [bp-2], 1Eh

loc_183E5:				; CODE XREF: sub_1827E+113j
		mov	ax, 1Eh
		mul	[bp+var_A]
		add	ax, 80DAh
		cmp	ax, [bp-2]
		jbe	short loc_1840C
		mov	bx, [bp-2]
		cmp	word ptr [bx+16h], 0
		jz	short loc_183A4
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		sub	ah, ah
		jmp	short loc_183A7
; ---------------------------------------------------------------------------

loc_1840C:				; CODE XREF: sub_1827E+173j
		push	[bp+var_18]
		call	sub_19715
		mov	[bp+var_C], 8914h
		jmp	short loc_18425
; ---------------------------------------------------------------------------

loc_18419:				; CODE XREF: sub_1827E+1BCj
		mov	ax, 0FFh

loc_1841C:				; CODE XREF: sub_1827E+1CDj
		push	ax
		call	sub_19768
		add	[bp+var_C], 1E7h

loc_18425:				; CODE XREF: sub_1827E+199j
		mov	ax, 1E7h
		mul	[bp+var_18]
		add	ax, 8914h
		cmp	ax, [bp+var_C]
		jbe	short loc_1844D
		mov	bx, [bp+var_C]
		cmp	word ptr [bx+20h], 0
		jz	short loc_18419
		mov	ax, [bx+1E5h]
		sub	ax, 80DAh
		cwd
		mov	cx, 1Eh
		idiv	cx
		sub	ah, ah
		jmp	short loc_1841C
; ---------------------------------------------------------------------------

loc_1844D:				; CODE XREF: sub_1827E+1B3j
		mov	[bp+var_C], 8914h
		jmp	short loc_18469
; ---------------------------------------------------------------------------

loc_18454:				; CODE XREF: sub_1827E+1F7j
		mov	bx, [bp+var_C]
		push	word ptr [bx+20h] ; int
		mov	ax, bx
		add	ax, 4Ch	; 'L'
		push	ds
		push	ax		; void *
		call	sub_1A498
		add	[bp+var_C], 1E7h

loc_18469:				; CODE XREF: sub_1827E+1D4j
		mov	ax, 1E7h
		mul	[bp+var_18]
		add	ax, 8914h
		cmp	ax, [bp+var_C]
		ja	short loc_18454
		mov	cx, 0Dh
		mov	si, 0D927h

loc_1847D:				; CODE XREF: sub_1827E+219j
		cmp	word ptr [si], 0
		jz	short loc_18490

loc_18482:				; CODE XREF: sub_1827E+217j
		mov	word ptr [bp+var_10+2],	cx
		push	cx
		call	sub_19715
		mov	word ptr [bp+var_6], 0CFCCh
		jmp	short loc_184AA
; ---------------------------------------------------------------------------

loc_18490:				; CODE XREF: sub_1827E+202j
		sub	si, 0BBh ; '�'
		dec	cx
		jz	short loc_18482
		jmp	short loc_1847D
; ---------------------------------------------------------------------------

loc_18499:				; CODE XREF: sub_1827E+238j
		mov	bx, word ptr [bp+var_6]
		push	word ptr [bx+97h] ; int
		push	ds
		push	bx		; void *
		call	sub_1A498
		add	word ptr [bp+var_6], 0BBh ; '�'

loc_184AA:				; CODE XREF: sub_1827E+210j
		mov	ax, 0BBh ; '�'
		mul	word ptr [bp+var_10+2]
		add	ax, 0CFCCh
		cmp	ax, word ptr [bp+var_6]
		ja	short loc_18499
		mov	cx, 0Bh
		mov	si, 0CBD1h

loc_184BE:				; CODE XREF: sub_1827E+25Aj
		cmp	word ptr [si], 0
		jz	short loc_184D1

loc_184C3:				; CODE XREF: sub_1827E+258j
		mov	[bp+var_1A], cx
		push	cx
		call	sub_19715
		mov	word ptr [bp+var_10], 0C3ECh
		jmp	short loc_184EB
; ---------------------------------------------------------------------------

loc_184D1:				; CODE XREF: sub_1827E+243j
		sub	si, 0BBh ; '�'
		dec	cx
		jz	short loc_184C3
		jmp	short loc_184BE
; ---------------------------------------------------------------------------

loc_184DA:				; CODE XREF: sub_1827E+279j
		mov	bx, word ptr [bp+var_10]
		push	word ptr [bx+97h] ; int
		push	ds
		push	bx		; void *
		call	sub_1A498
		add	word ptr [bp+var_10], 0BBh ; '�'

loc_184EB:				; CODE XREF: sub_1827E+251j
		mov	ax, 0BBh ; '�'
		mul	[bp+var_1A]
		add	ax, 0C3ECh
		cmp	ax, word ptr [bp+var_10]
		ja	short loc_184DA
		mov	cx, 77BCh
		sub	dx, dx

loc_184FE:				; CODE XREF: sub_1827E+290j
		mov	bx, cx
		cmp	word ptr [bx+16h], 0
		jz	short loc_18507
		inc	dx

loc_18507:				; CODE XREF: sub_1827E+286j
		add	cx, 26h	; '&'
		cmp	cx, 80A4h
		jb	short loc_184FE
		mov	[bp+var_12], dx
		mov	word ptr [bp+var_6+2], cx
		push	dx
		call	sub_19715
		mov	word ptr [bp+var_6+2], 77BCh

loc_1851F:				; CODE XREF: sub_1827E+31Bj
		mov	bx, word ptr [bp+var_6+2]
		cmp	word ptr [bx+16h], 0
		jz	short loc_18590
		mov	ax, bx
		sub	ax, 77BCh
		cwd
		mov	cx, 26h	; '&'
		idiv	cx
		push	ax
		call	sub_19715
		mov	ax, 26h	; '&'
		push	ax		; unsigned int
		push	ds
		push	word ptr [bp+var_6+2] ;	void *
		call	sub_1A3E1
		mov	bx, word ptr [bp+var_6+2]
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B047
		mov	bx, word ptr [bp+var_6+2]
		push	word ptr [bx+16h] ; unsigned int
		les	bx, [bx+18h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		push	word_472AE	; int
		call	_write
		add	sp, 8
		mov	bx, word ptr [bp+var_6+2]
		cmp	[bx+16h], ax
		jz	short loc_18582
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	loc_182DA
; ---------------------------------------------------------------------------

loc_18582:				; CODE XREF: sub_1827E+2F4j
		mov	bx, word ptr [bp+var_6+2]
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1B063

loc_18590:				; CODE XREF: sub_1827E+2A8j
		add	word ptr [bp+var_6+2], 26h ; '&'
		cmp	word ptr [bp+var_6+2], 80A4h
		jb	short loc_1851F
		push	word_472AE	; int
		call	_close
		add	sp, 2
		or	ax, ax
		jz	short loc_185B0

loc_185AB:				; CODE XREF: seg000:8310j
		mov	ax, 2
		jmp	short loc_185C3
; ---------------------------------------------------------------------------

loc_185B0:				; CODE XREF: sub_1827E+32Bj
		mov	word_4E948, 0
		mov	word_4B39E, 0
		call	sub_23285
		sub	ax, ax

loc_185C3:				; CODE XREF: sub_1827E+330j
		pop	si
		mov	sp, bp
		pop	bp
		retn	4
; END OF FUNCTION CHUNK	FOR sub_1827E

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_185CA(int, char *)
sub_185CA	proc far		; CODE XREF: sub_17F89+7Bp
					; seg000:8DB2p	...

var_60		= word ptr -60h
var_5C		= byte ptr -5Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_30		= byte ptr -30h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 62h	; 'b'
		call	__chkstk
		call	sub_2329F
		mov	ax, 0D8F0h
		mov	[bp+var_60], ax
		push	ax
		call	sub_2788E
		mov	ax, 20h	; ' '
		push	ax		; size_t
		mov	ax, 0A3C6h
		push	ds
		push	ax		; void *
		lea	ax, [bp+var_5C]
		push	ss
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		test	byte ptr [bp+arg_0], 2
		jz	short loc_1860A
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_1860A:				; CODE XREF: sub_185CA+36j
		mov	ax, [bp+arg_0]
		and	ax, 1
		push	ax
		push	cs
		call	near ptr sub_181DF
		cmp	word_4B45F, 0
		jl	short loc_1862C
		mov	ax, 1E7h
		imul	word_4B45F
		add	ax, 8914h
		push	ax
		call	sub_2BCB0

loc_1862C:				; CODE XREF: sub_185CA+50j
		call	sub_26A01
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1B2AF
		mov	word_490A0, 0
		mov	word_4E948, 1
		mov	[bp+var_C], 0
		mov	ax, 8000h
		push	ax		; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	_open
		add	sp, 6
		mov	word_472AE, ax
		or	ax, ax
		jl	short loc_18689
		mov	ax, 628Ch
		push	ds
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_18698

loc_18677:				; CODE XREF: sub_185CA+112j
					; sub_185CA+14Dj ...
		mov	word_4E948, 0
		push	word_472AE	; int
		call	_close
		add	sp, 2

loc_18689:				; CODE XREF: sub_185CA+9Aj
					; sub_18844+2B6j
		cmp	[bp+var_C], 0
		jnz	short loc_18692
		jmp	loc_18CDF
; ---------------------------------------------------------------------------

loc_18692:				; CODE XREF: sub_185CA+C3j
		sub	ax, ax
		cwd
		jmp	loc_18CE5
; ---------------------------------------------------------------------------

loc_18698:				; CODE XREF: sub_185CA+ABj
		lea	ax, [bp+var_30]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_186D0
		mov	word_4E948, 0
		push	word_472AE	; int
		call	_close
		add	sp, 2

loc_186C2:				; CODE XREF: sub_18844+208j
		mov	ax, 52AFh
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_18D10
		jmp	loc_18CEF
; ---------------------------------------------------------------------------

loc_186D0:				; CODE XREF: sub_185CA+E4j
		call	sub_1A626
		mov	[bp+var_1A], ax
		and	ax, 0F000h
		cmp	ax, 1000h
		ja	short loc_18677
		call	sub_1A626
		mov	[bp+var_1C], ax
		sub	ax, 0DFh ; '�'
		mov	[bp+var_16], ax
		or	ax, ax
		jl	short loc_1871A
		mov	ax, 0A3C6h
		push	ds
		push	ax		; void *
		mov	ax, 0DFh ; '�'
		push	ax		; unsigned int
		call	sub_1A5ED
		push	word_472AE
		mov	ax, [bp+var_16]
		cwd
		push	dx
		push	ax
		mov	ax, 1
		push	ax
		call	sub_23345
		cmp	ax, 0FFFFh
		jnz	short loc_18752
		cmp	dx, 0FFFFh
		jnz	short loc_18752
		jmp	loc_18677
; ---------------------------------------------------------------------------

loc_1871A:				; CODE XREF: sub_185CA+122j
		mov	[bp+var_6], 26h	; '&'
		mov	ax, [bp+var_6]
		sub	[bp+var_1C], ax
		mov	ax, 0A3C6h
		push	ds
		push	ax		; void *
		push	[bp+var_6]	; unsigned int
		call	sub_1A5ED
		mov	ax, [bp+var_16]
		add	ax, 93h	; '�'
		mov	[bp+var_6], ax
		sub	[bp+var_1C], ax
		mov	ax, 0A3ECh
		push	ds
		push	ax		; void *
		push	[bp+var_6]	; unsigned int
		call	sub_1A5ED
		mov	ax, 0A47Fh
		push	ds
		push	ax		; void *
		push	[bp+var_1C]	; unsigned int
		call	sub_1A5ED

loc_18752:				; CODE XREF: sub_185CA+146j
					; sub_185CA+14Bj
		mov	ax, 0A3C6h
		push	ds
		push	ax
		lea	ax, [bp+var_5C]
		push	ss
		push	ax
		call	sub_28DC3
		mov	[bp+var_38], ax
		mov	[bp+var_12], 8914h

loc_18769:				; CODE XREF: sub_185CA+1C1j
		cmp	[bp+var_38], 0
		jz	short loc_18779
		push	[bp+var_12]
		call	sub_2C5DB
		jmp	short loc_18781
; ---------------------------------------------------------------------------

loc_18779:				; CODE XREF: sub_185CA+1A3j
		push	[bp+var_12]
		call	sub_2BCB0

loc_18781:				; CODE XREF: sub_185CA+1ADj
		add	[bp+var_12], 1E7h
		cmp	[bp+var_12], 0A3B6h
		jb	short loc_18769
		mov	[bp+var_8], 0CFCCh

loc_18792:				; CODE XREF: sub_185CA+1EAj
		cmp	[bp+var_38], 0
		jz	short loc_187A2
		push	[bp+var_8]
		call	sub_2B91C
		jmp	short loc_187AA
; ---------------------------------------------------------------------------

loc_187A2:				; CODE XREF: sub_185CA+1CCj
		push	[bp+var_8]
		call	sub_2B236

loc_187AA:				; CODE XREF: sub_185CA+1D6j
		add	[bp+var_8], 0BBh ; '�'
		cmp	[bp+var_8], 0D94Bh
		jb	short loc_18792
		mov	[bp+var_3A], 0C3ECh

loc_187BB:				; CODE XREF: sub_185CA+203j
		push	[bp+var_3A]
		nop
		push	cs
		call	near ptr sub_1F616
		add	[bp+var_3A], 0BBh ; '�'
		cmp	[bp+var_3A], 0CBF5h
		jb	short loc_187BB
		call	sub_1A626
		mov	[bp+var_1C], ax
		dec	ax
		mov	word_490B8, ax
		cmp	ax, 7D0h
		jl	short loc_187E1
		jmp	loc_18677
; ---------------------------------------------------------------------------

loc_187E1:				; CODE XREF: sub_185CA+212j
		mov	[bp+var_E], 0
		jmp	short loc_187EB
; ---------------------------------------------------------------------------

loc_187E8:				; CODE XREF: sub_185CA+255j
		inc	[bp+var_E]

loc_187EB:				; CODE XREF: sub_185CA+21Cj
		mov	ax, word_490B8
		cmp	[bp+var_E], ax
		jg	short loc_18829
		call	sub_1A626
		mov	[bp+var_1C], ax
		push	ax
		push	[bp+var_E]
		call	sub_2AB2D
		mov	bx, [bp+var_E]
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		push	[bp+var_1C]
		push	cs
		call	near ptr sub_1A559
		call	sub_26AF5
		or	ax, ax
		jz	short loc_187E8
		mov	[bp+var_C], 1
		jmp	loc_18677
; ---------------------------------------------------------------------------

loc_18829:				; CODE XREF: sub_185CA+227j
		mov	ax, 46h	; 'F'
		push	ax
		call	sub_1A644
		mov	[bp+var_10], ax
		mov	[bp+var_2], 80DAh
		jmp	short loc_1887C
sub_185CA	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_18844

loc_1883A:				; CODE XREF: sub_18844+4Ej
		mov	cx, 1E7h
		mov	al, [bp-0Ah]
		sub	ah, ah
		mul	cx
; END OF FUNCTION CHUNK	FOR sub_18844

; =============== S U B	R O U T	I N E =======================================


sub_18844	proc far		; CODE XREF: sub_123F9+219p
					; sub_123F9+287p ...

; FUNCTION CHUNK AT 883A SIZE 0000000A BYTES

		add	ax, 8914h

loc_18847:				; CODE XREF: sub_18844+52j
		mov	bx, [bp-2]
		mov	[bx+16h], ax
		call	sub_1A674
		mov	cl, 1Eh
		mul	cl
		add	ax, 80DAh
		mov	bx, [bp-2]
		mov	[bx+18h], ax
		call	sub_1A674
		mov	cl, 1Eh
		mul	cl
		add	ax, 80DAh
		mov	bx, [bp-2]
		mov	[bx+1Ah], ax
		call	sub_1A674
		sub	ah, ah
		mov	bx, [bp-2]
		mov	[bx+1Ch], ax
		add	word ptr [bp-2], 1Eh

loc_1887C:				; CODE XREF: sub_185CA+26Ej
		mov	ax, 1Eh
		mul	word ptr [bp-10h]
		add	ax, 80DAh
		cmp	ax, [bp-2]
		jbe	short loc_18898
		call	sub_1A674
		mov	[bp-0Ah], al
		cmp	al, 0Eh
		jb	short loc_1883A
		sub	ax, ax
		jmp	short loc_18847
; ---------------------------------------------------------------------------

loc_18898:				; CODE XREF: sub_18844+44j
		mov	ax, 0Eh
		push	ax
		call	sub_1A644
		mov	[bp-5Eh], ax
		mov	word ptr [bp-12h], 8914h
		jmp	short loc_188BD
; ---------------------------------------------------------------------------

loc_188A9:				; CODE XREF: sub_18844+8Fj
		mov	al, 1Eh
		mul	byte ptr [bp-0Ah]
		add	ax, 80DAh

loc_188B1:				; CODE XREF: sub_18844+93j
		mov	bx, [bp-12h]
		mov	[bx+1E5h], ax
		add	word ptr [bp-12h], 1E7h

loc_188BD:				; CODE XREF: sub_18844+63j
		mov	ax, 1E7h
		mul	word ptr [bp-5Eh]
		add	ax, 8914h
		cmp	ax, [bp-12h]
		jbe	short loc_188D9
		call	sub_1A674
		mov	[bp-0Ah], al
		cmp	al, 46h	; 'F'
		jb	short loc_188A9
		sub	ax, ax
		jmp	short loc_188B1
; ---------------------------------------------------------------------------

loc_188D9:				; CODE XREF: sub_18844+85j
		mov	word ptr [bp-12h], 8914h
		jmp	short loc_188F0
; ---------------------------------------------------------------------------

loc_188E0:				; CODE XREF: sub_18844+B8j
		mov	ax, [bp-12h]
		add	ax, 4Ch	; 'L'
		push	ds
		push	ax		; void *
		call	sub_1A5BF
		add	word ptr [bp-12h], 1E7h

loc_188F0:				; CODE XREF: sub_18844+9Aj
		mov	ax, 1E7h
		mul	word ptr [bp-5Eh]
		add	ax, 8914h
		cmp	ax, [bp-12h]
		ja	short loc_188E0
		mov	ax, 0Dh
		push	ax
		call	sub_1A644
		mov	[bp-36h], ax
		mov	word ptr [bp-8], 0CFCCh
		jmp	short loc_1891B
; ---------------------------------------------------------------------------

loc_1890F:				; CODE XREF: sub_18844+E3j
		push	ds
		push	word ptr [bp-8]	; void *
		call	sub_1A5BF
		add	word ptr [bp-8], 0BBh ;	'�'

loc_1891B:				; CODE XREF: sub_18844+C9j
		mov	ax, 0BBh ; '�'
		mul	word ptr [bp-36h]
		add	ax, 0CFCCh
		cmp	ax, [bp-8]
		ja	short loc_1890F
		mov	ax, 0Bh
		push	ax
		call	sub_1A644
		mov	[bp-62h], ax
		mov	word ptr [bp-3Ah], 0C3ECh
		jmp	short loc_18946
; ---------------------------------------------------------------------------

loc_1893A:				; CODE XREF: sub_18844+10Ej
		push	ds
		push	word ptr [bp-3Ah] ; void *
		call	sub_1A5BF
		add	word ptr [bp-3Ah], 0BBh	; '�'

loc_18946:				; CODE XREF: sub_18844+F4j
		mov	ax, 0BBh ; '�'
		mul	word ptr [bp-62h]
		add	ax, 0C3ECh
		cmp	ax, [bp-3Ah]
		ja	short loc_1893A
		nop
		push	cs
		call	near ptr sub_10FD7
		mov	ax, 3Ch	; '<'
		push	ax
		call	sub_1A644
		mov	[bp-3Ch], ax
		mov	word ptr [bp-18h], 0
		jmp	short loc_189C3
; ---------------------------------------------------------------------------

loc_1896A:				; CODE XREF: sub_18844+1C8j
		mov	word ptr [bp-16h], 0

loc_1896F:				; CODE XREF: sub_18844+1D6j
		mov	bx, [bp-4]
		sub	ax, ax
		mov	[bx+1Ah], ax
		mov	[bx+18h], ax
		push	ds
		push	word ptr [bp-4]	; void *
		push	word ptr [bp-1Ch] ; unsigned int
		call	sub_1A5ED
		mov	bx, [bp-4]
		sub	ax, ax
		mov	[bx+1Ah], ax
		mov	[bx+18h], ax
		push	word_472AE
		mov	ax, [bp-16h]
		cwd
		push	dx
		push	ax
		mov	ax, 1
		push	ax
		call	sub_23345
		cmp	ax, 0FFFFh
		jnz	short loc_189AF
		cmp	dx, 0FFFFh
		jnz	short loc_189AF
		jmp	loc_18677
; ---------------------------------------------------------------------------

loc_189AF:				; CODE XREF: sub_18844+161j
					; sub_18844+166j
		mov	ax, [bp-4]
		add	ax, 18h
		push	ds
		push	ax
		mov	bx, [bp-4]
		push	word ptr [bx+16h]
		call	sub_1A4CA
		inc	word ptr [bp-18h]

loc_189C3:				; CODE XREF: sub_18844+124j
		mov	ax, [bp-3Ch]
		cmp	[bp-18h], ax
		jnb	short loc_18A1D
		mov	ax, 3Ch	; '<'
		push	ax
		call	sub_1A644
		mov	[bp-1Ch], ax
		mov	ax, 26h	; '&'
		mul	word ptr [bp-1Ch]
		add	ax, 77BCh
		mov	[bp-4],	ax
		mov	bx, ax
		mov	ax, [bx+18h]
		or	ax, [bx+1Ah]
		jz	short loc_18A01
		push	word ptr [bx+1Ah]
		push	word ptr [bx+18h]
		nop
		push	cs
		call	near ptr sub_1AEAD
		mov	bx, [bp-4]
		sub	ax, ax
		mov	[bx+1Ah], ax
		mov	[bx+18h], ax

loc_18A01:				; CODE XREF: sub_18844+1A5j
		call	sub_1A626
		mov	[bp-1Ch], ax
		cmp	ax, 26h	; '&'
		ja	short loc_18A0F
		jmp	loc_1896A
; ---------------------------------------------------------------------------

loc_18A0F:				; CODE XREF: sub_18844+1C6j
		sub	ax, 26h	; '&'
		mov	[bp-16h], ax
		mov	word ptr [bp-1Ch], 26h ; '&'
		jmp	loc_1896F
; ---------------------------------------------------------------------------

loc_18A1D:				; CODE XREF: sub_18844+185j
		mov	word_4E948, 0
		push	word_472AE	; int
		call	_close
		add	sp, 2
		nop
		push	cs
		call	near ptr sub_1B0CF
		lea	ax, [bp-30h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_18A4F
		jmp	loc_186C2
; ---------------------------------------------------------------------------

loc_18A4F:				; CODE XREF: sub_18844+206j
		sub	ax, ax
		push	ax
		push	word_490B8
		call	sub_2AFC2
		cmp	word_4B45F, 0
		jl	short loc_18ABD
		mov	ax, 1E7h
		imul	word_4B45F
		add	ax, 8914h
		push	ax
		call	sub_2BFC6
		or	ax, ax
		jz	short loc_18A7B
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_18A7B:				; CODE XREF: sub_18844+230j
		mov	word ptr [bp-4], 77BCh
		mov	ax, 1E7h
		imul	word_4B45F
		mov	bx, ax
		mov	ax, [bx-76CAh]
		mov	dx, [bx-76C8h]
		mov	[bp-34h], ax
		mov	[bp-32h], dx

loc_18A97:				; CODE XREF: sub_18844+277j
		push	word ptr [bp-4]
		nop
		push	cs
		call	near ptr sub_176C9
		push	ds
		push	word ptr [bp-4]
		push	word ptr [bp-32h]
		push	word ptr [bp-34h]
		nop
		push	cs
		call	near ptr sub_110E4
		add	word ptr [bp-4], 26h ; '&'
		add	word ptr [bp-34h], 0Eh
		cmp	word ptr [bp-4], 80A4h
		jb	short loc_18A97

loc_18ABD:				; CODE XREF: sub_18844+21Cj
		mov	word ptr [bp-12h], 8914h
		jmp	short loc_18B02
; ---------------------------------------------------------------------------

loc_18AC4:				; CODE XREF: sub_18844+2F1j
		push	word ptr [bp-12h]
		call	sub_2C678
		or	ax, ax
		jz	short loc_18AFD
		mov	ax, [bp-12h]
		add	ax, 4Ch	; 'L'
		push	ds
		push	ax		; char *
		lea	ax, [bp-14h]
		push	ss
		push	ax		; __int32
		push	cs
		call	near ptr sub_17CC7
		or	ax, ax
		jnz	short loc_18B37
		push	word ptr [bp-12h]
		call	sub_2BFC6
		mov	[bp-1Eh], ax
		cmp	ax, 2
		jz	short loc_18B37
		cmp	ax, 0FFFFh
		jnz	short loc_18AFD
		jmp	loc_18689
; ---------------------------------------------------------------------------

loc_18AFD:				; CODE XREF: sub_18844+28Aj
					; sub_18844+2B4j ...
		add	word ptr [bp-12h], 1E7h

loc_18B02:				; CODE XREF: sub_18844+27Ej
		mov	ax, 1E7h
		mul	word ptr [bp-5Eh]
		add	ax, 8914h
		cmp	ax, [bp-12h]
		jbe	short loc_18B40
		mov	bx, [bp-12h]
		cmp	byte ptr [bx+4Ch], 0
		jz	short loc_18AFD
		push	bx
		call	sub_2C678
		or	ax, ax
		jz	short loc_18AFD
		mov	ax, [bp-12h]
		add	ax, 4Ch	; 'L'
		push	ds
		push	ax		; char *
		mov	ax, 1
		push	ax		; int
		push	cs
		call	near ptr sub_19181
		or	ax, ax
		jz	short loc_18AC4

loc_18B37:				; CODE XREF: sub_18844+29Fj
					; sub_18844+2AFj ...
		mov	ax, 5028h
		mov	dx, seg	seg001
		jmp	loc_18CE5
; ---------------------------------------------------------------------------

loc_18B40:				; CODE XREF: sub_18844+2CAj
		call	sub_2C73B
		cmp	word ptr [bp-1Ah], 1000h
		jnz	short loc_18B4F
		call	sub_1A350

loc_18B4F:				; CODE XREF: sub_18844+306j
		mov	word ptr [bp-8], 0CFCCh
		jmp	short loc_18B91
; ---------------------------------------------------------------------------

loc_18B56:				; CODE XREF: sub_18844+359j
		mov	bx, [bp-8]
		cmp	byte ptr [bx], 0
		jz	short loc_18B8C
		push	bx
		call	sub_2B9BA
		or	ax, ax
		jz	short loc_18B8C
		push	ds
		push	word ptr [bp-8]	; char *
		mov	ax, 2
		push	ax		; int
		push	cs
		call	near ptr sub_19181
		or	ax, ax
		jnz	short loc_18B37
		push	word ptr [bp-8]
		call	sub_2B9BA
		or	ax, ax
		jz	short loc_18B8C
		push	word ptr [bp-8]
		call	sub_2B4A6

loc_18B8C:				; CODE XREF: sub_18844+318j
					; sub_18844+322j ...
		add	word ptr [bp-8], 0BBh ;	'�'

loc_18B91:				; CODE XREF: sub_18844+310j
		mov	ax, 0BBh ; '�'
		mul	word ptr [bp-36h]
		add	ax, 0CFCCh
		cmp	ax, [bp-8]
		ja	short loc_18B56
		call	sub_2BA6A
		mov	word ptr [bp-3Ah], 0C3ECh
		jmp	short loc_18BE9
; ---------------------------------------------------------------------------

loc_18BAB:				; CODE XREF: sub_18844+3B1j
		mov	bx, [bp-3Ah]
		cmp	byte ptr [bx], 0
		jz	short loc_18BE4
		push	bx
		nop
		push	cs
		call	near ptr sub_1F6B4
		or	ax, ax
		jz	short loc_18BE4
		push	ds
		push	word ptr [bp-3Ah] ; char *
		mov	ax, 3
		push	ax		; int
		push	cs
		call	near ptr sub_19181
		or	ax, ax
		jz	short loc_18BD0
		jmp	loc_18B37
; ---------------------------------------------------------------------------

loc_18BD0:				; CODE XREF: sub_18844+387j
		push	word ptr [bp-3Ah]
		nop
		push	cs
		call	near ptr sub_1F6B4
		or	ax, ax
		jz	short loc_18BE4
		push	word ptr [bp-3Ah]
		nop
		push	cs
		call	near ptr sub_1F31A

loc_18BE4:				; CODE XREF: sub_18844+36Dj
					; sub_18844+377j ...
		add	word ptr [bp-3Ah], 0BBh	; '�'

loc_18BE9:				; CODE XREF: sub_18844+365j
		mov	ax, 0BBh ; '�'
		mul	word ptr [bp-62h]
		add	ax, 0C3ECh
		cmp	ax, [bp-3Ah]
		ja	short loc_18BAB
		nop
		push	cs
		call	near ptr sub_1F764
		cmp	byte_4B3CC, 0
		jz	short loc_18C18
		mov	ax, 0A3ECh
		push	ds
		push	ax		; char *
		sub	ax, ax
		push	ax		; int
		push	cs
		call	near ptr sub_19181
		or	ax, ax
		jz	short loc_18C18
		mov	byte_4B3CC, 0

loc_18C18:				; CODE XREF: sub_18844+3BDj
					; sub_18844+3CDj
		call	sub_278A3
		or	ax, ax
		jnz	short loc_18C26
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_18C26:				; CODE XREF: sub_18844+3DBj
		test	byte ptr [bp+6], 2
		jz	short loc_18C3E
		and	byte ptr [bp+6], 0FDh
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_18C3E:				; CODE XREF: sub_18844+3E6j
		nop
		push	cs
		call	near ptr sub_14144
		sub	ax, ax
		push	ax
		mov	ax, 1
		push	ax
		call	sub_27D5E
		or	ax, ax
		jge	short loc_18C56
		jmp	loc_18CEA
; ---------------------------------------------------------------------------

loc_18C56:				; CODE XREF: sub_18844+40Dj
		call	sub_232D3
		test	byte ptr [bp+6], 1
		jnz	short loc_18C82
		cmp	word ptr [bp-38h], 0
		jz	short loc_18C88
		les	bx, dword_4B48C
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+1], 0
		jz	short loc_18C88

loc_18C82:				; CODE XREF: sub_18844+41Bj
		test	byte ptr [bp+6], 4
		jz	short loc_18C8C

loc_18C88:				; CODE XREF: sub_18844+421j
					; sub_18844+43Cj
		push	cs
		call	near ptr sub_196BF

loc_18C8C:				; CODE XREF: sub_18844+442j
		mov	ax, 0A3C6h
		push	ds
		push	ax
		call	sub_20A92
		push	word ptr dword_4E932+2
		push	word ptr dword_4E932
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		call	sub_2925A
		or	ax, ax
		jge	short loc_18CC8
		sub	ax, ax
		push	ax
		push	ax
		call	sub_18D10
		call	sub_2345E
		jmp	short loc_18CEA
; ---------------------------------------------------------------------------

loc_18CC8:				; CODE XREF: sub_18844+474j
		call	sub_2345E
		mov	ax, 2710h
		push	ax
		call	sub_2788E
		nop
		push	cs
		call	near ptr sub_1B0CF
		sub	ax, ax
		jmp	short loc_18D0A
; ---------------------------------------------------------------------------

loc_18CDF:				; CODE XREF: sub_185CA+C5j
		mov	ax, 4FFCh
		mov	dx, seg	seg001

loc_18CE5:				; CODE XREF: sub_185CA+CBj
					; sub_18844+2F9j
		push	dx
		push	ax
		call	sub_18D10

loc_18CEA:				; CODE XREF: sub_18844+40Fj
					; sub_18844+482j
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_18CEF:				; CODE XREF: sub_185CA+103j
		test	byte ptr [bp+6], 2
		jz	short loc_18CFE
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985

loc_18CFE:				; CODE XREF: sub_18844+4AFj
		mov	ax, 2710h
		push	ax
		call	sub_2788E
		mov	ax, 2

loc_18D0A:				; CODE XREF: sub_18844+499j
		mov	sp, bp
		pop	bp
		retf	6
sub_18844	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_18D10	proc near		; CODE XREF: sub_185CA+100p
					; sub_18844+47Ap ...

var_2		= word ptr -2
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	word_4E948, 0
		call	sub_2C73B
		call	sub_2BA6A
		nop
		push	cs
		call	near ptr sub_1F764
		mov	[bp+var_2], 80DAh

loc_18D35:				; CODE XREF: sub_18D10+48j
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+16h], 0
		jz	short loc_18D4F
		mov	bx, [bx+16h]
		cmp	word ptr [bx+20h], 0
		jnz	short loc_18D4F
		push	[bp+var_2]
		call	sub_2453F

loc_18D4F:				; CODE XREF: sub_18D10+2Cj
					; sub_18D10+35j
		add	[bp+var_2], 1Eh
		cmp	[bp+var_2], 890Eh
		jb	short loc_18D35
		mov	ax, 1
		push	ax
		sub	ax, ax
		push	ax
		push	cs
		call	near ptr sub_18143
		call	sub_23285
		call	sub_2349E
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_18D7A
		call	[bp+arg_0]

loc_18D7A:				; CODE XREF: sub_18D10+65j
		call	sub_234AE
		mov	sp, bp
		pop	bp
		retn	4
sub_18D10	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 0CDCh
		push	ds
		push	ax
		lea	ax, [bp-2]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_17CC7
		or	ax, ax
		jnz	short loc_18DD3
		cmp	word ptr [bp-2], 5Bh ; '['
		jnz	short loc_18DD3
		mov	ax, 0CDCh
		push	ds
		push	ax
		mov	ax, 6
		push	ax
		push	cs
		call	near ptr sub_185CA
		or	ax, ax
		jnz	short loc_18DD3
		cmp	word_490B8, 0
		jle	short loc_18DD3
		sub	ax, ax
		push	ax
		mov	ax, 45DCh
		mov	dx, seg	seg000
		push	dx
		push	ax
		mov	ax, 7
		push	ax
		push	cs
		call	near ptr sub_18DDC

loc_18DD3:				; CODE XREF: seg000:8DA0j seg000:8DA6j ...
		call	sub_2329F
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_18DDC	proc far		; CODE XREF: sub_137E6+DFp
					; sub_14619+81p ...

var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= byte ptr -9Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 0A4h ; '�'
		call	__chkstk
		push	di
		push	si
		mov	ax, [bp+arg_0]
		and	ax, 4
		mov	[bp+var_4], ax
		call	sub_234AE
		mov	ax, word_4DF96
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_18E06
		nop
		push	cs
		call	near ptr sub_1CE23

loc_18E06:				; CODE XREF: sub_18DDC+23j
		mov	ax, word_4DFA0
		mov	word_4DF58, ax
		push	[bp+arg_6]
		nop
		push	cs
		call	near ptr sub_14185
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		mov	[bp+var_A], 0FFFFh
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D

loc_18E32:				; CODE XREF: sub_18DDC+168j
					; sub_18DDC+1D3j
		mov	[bp+var_2], 0
		cmp	[bp+var_4], 0
		jnz	short loc_18E50
		push	[bp+arg_6]
		mov	ax, 1
		push	ax
		call	sub_27D5E
		or	ax, ax
		jge	short loc_18E50
		jmp	loc_18FB7
; ---------------------------------------------------------------------------

loc_18E50:				; CODE XREF: sub_18DDC+5Fj
					; sub_18DDC+6Fj
		mov	[bp+var_4], 0
		nop
		push	cs
		call	near ptr sub_1FBD0
		mov	[bp+var_A2], ax
		mov	[bp+var_A0], dx
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		mov	bx, [bp+arg_6]
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		mov	ax, 1
		push	ax
		call	sub_2925A
		mov	[bp+var_6], ax
		or	ax, ax
		jge	short loc_18E94
		jmp	loc_18FB7
; ---------------------------------------------------------------------------

loc_18E94:				; CODE XREF: sub_18DDC+B3j
		cwd
		add	[bp+var_A2], ax
		adc	[bp+var_A0], dx
		mov	ax, [bp+arg_6]
		mov	word_4DFA0, ax

loc_18EA3:				; CODE XREF: sub_18DDC+DCj
					; sub_18DDC+E2j
		call	[bp+arg_2]
		or	ax, ax
		jz	short loc_18EAD
		jmp	loc_18FB7
; ---------------------------------------------------------------------------

loc_18EAD:				; CODE XREF: sub_18DDC+CCj
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp+var_A0]
		ja	short loc_18EC0
		jb	short loc_18EA3
		cmp	ax, [bp+var_A2]
		jb	short loc_18EA3

loc_18EC0:				; CODE XREF: sub_18DDC+DAj
					; sub_18DDC+14Aj ...
		mov	ax, word_490B8
		cmp	word_4DFA0, ax
		jge	short loc_18F32
		nop
		push	cs
		call	near ptr sub_1FBD0
		mov	[bp+var_A2], ax
		mov	[bp+var_A0], dx
		mov	ax, word_4DFA0
		shl	ax, 1
		shl	ax, 1
		mov	[bp+var_A4], ax
		mov	bx, ax
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		push	word ptr [bx-5B4Eh]
		push	word ptr [bx-5B50h]
		mov	ax, 2
		push	ax
		call	sub_2925A
		mov	[bp+var_6], ax
		or	ax, ax
		jge	short loc_18F06
		jmp	loc_18FB7
; ---------------------------------------------------------------------------

loc_18F06:				; CODE XREF: sub_18DDC+125j
		cwd
		add	[bp+var_A2], ax
		adc	[bp+var_A0], dx
		inc	word_4DFA0

loc_18F13:				; CODE XREF: sub_18DDC+14Cj
					; sub_18DDC+154j
		call	[bp+arg_2]
		or	ax, ax
		jz	short loc_18F1D
		jmp	loc_18FB7
; ---------------------------------------------------------------------------

loc_18F1D:				; CODE XREF: sub_18DDC+13Cj
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp+var_A0]
		ja	short loc_18EC0
		jb	short loc_18F13
		cmp	ax, [bp+var_A2]
		jnb	short loc_18EC0
		jmp	short loc_18F13
; ---------------------------------------------------------------------------

loc_18F32:				; CODE XREF: sub_18DDC+EBj
		mov	[bp+arg_6], 0
		test	byte ptr [bp+arg_0], 2
		jz	short loc_18F47
		cmp	word_4B3CA, 0
		jz	short loc_18F47
		jmp	loc_18E32
; ---------------------------------------------------------------------------

loc_18F47:				; CODE XREF: sub_18DDC+15Fj
					; sub_18DDC+166j
		nop
		push	cs
		call	near ptr sub_1F7C5
		test	byte ptr [bp+arg_0], 1
		jz	short loc_18FB2
		cmp	byte_4B3CC, 0
		jz	short loc_18FB2
		mov	di, 0A3ECh
		lea	si, [bp+var_9E]
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		lea	ax, [bp+var_9E]
		push	ss
		push	ax		; char *
		sub	ax, ax
		push	ax		; int
		push	cs
		call	near ptr sub_185CA
		or	ax, ax
		jnz	short loc_18FB2
		mov	[bp+var_4], 1
		lea	di, [bp+var_9E]
		mov	si, 0D00h
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		jmp	loc_18E32
; ---------------------------------------------------------------------------

loc_18FB2:				; CODE XREF: sub_18DDC+174j
					; sub_18DDC+17Bj ...
		mov	[bp+var_A], 0

loc_18FB7:				; CODE XREF: sub_18DDC+71j
					; sub_18DDC+B5j ...
		nop
		push	cs
		call	near ptr sub_1F7C5
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		call	sub_26D6D
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		cmp	[bp+var_8], 0
		jz	short loc_18FE1
		nop
		push	cs
		call	near ptr sub_1CE72

loc_18FE1:				; CODE XREF: sub_18DDC+1FEj
		call	sub_2349E
		mov	ax, [bp+var_A]
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	8
sub_18DDC	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	word ptr [bp-2], 0

loc_19001:				; CODE XREF: seg000:903Aj seg000:905Dj ...
		mov	ax, 48Ah
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_26CF0
		or	ax, ax
		jnz	short loc_19019
		cmp	word ptr [bp-2], 0
		jz	short loc_19088

loc_19019:				; CODE XREF: seg000:9011j
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		call	sub_26E7B
		cmp	word_49084, 1
		jz	short loc_1903C
		cmp	word_49084, 3
		jz	short loc_1903C
		cmp	word_49084, 7
		jnz	short loc_19001

loc_1903C:				; CODE XREF: seg000:902Cj seg000:9033j
		test	byte ptr word_49092, 80h
		jnz	short loc_19049
		cmp	word ptr [bp-2], 0
		jz	short loc_19066

loc_19049:				; CODE XREF: seg000:9041j
		cmp	word ptr [bp-2], 1
		sbb	ax, ax
		neg	ax
		mov	[bp-2],	ax
		or	ax, ax
		jz	short loc_1905F
		nop
		push	cs
		call	near ptr sub_1F7C5
		jmp	short loc_19001
; ---------------------------------------------------------------------------

loc_1905F:				; CODE XREF: seg000:9056j
		nop
		push	cs
		call	near ptr sub_1FA7C
		jmp	short loc_19001
; ---------------------------------------------------------------------------

loc_19066:				; CODE XREF: seg000:9047j
		nop
		push	cs
		call	near ptr sub_1F7C5
		call	sub_2349E
		call	sub_25129
		mov	[bp-4],	ax
		call	sub_234AE
		cmp	word ptr [bp-4], 1
		jnz	short loc_1908C
		nop
		push	cs
		call	near ptr sub_1FA7C

loc_19088:				; CODE XREF: seg000:9017j
		sub	ax, ax
		jmp	short loc_1908F
; ---------------------------------------------------------------------------

loc_1908C:				; CODE XREF: seg000:9081j
		mov	ax, 1

loc_1908F:				; CODE XREF: seg000:908Aj
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_19093(int, char *)
sub_19093	proc far		; CODE XREF: sub_19181+1Cp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	di
		push	si
		mov	ax, 2Fh	; '/'
		push	ax		; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jnz	short loc_190CA
		mov	ax, word ptr [bp+arg_2]
		mov	dx, word ptr [bp+arg_2+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		jmp	short loc_190CD
; ---------------------------------------------------------------------------

loc_190CA:				; CODE XREF: sub_19093+27j
		inc	word ptr [bp+var_8]

loc_190CD:				; CODE XREF: sub_19093+35j
		les	di, [bp+var_8]
		push	ds
		lds	si, [bp+arg_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		push	dx
		push	ax		; char *
		call	_strupr
		add	sp, 4
		mov	ax, 2Eh	; '.'
		push	ax		; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	_strchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jnz	short loc_19130
		les	di, [bp+arg_2]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, word ptr [bp+arg_2]
		mov	ax, es
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ax

loc_19130:				; CODE XREF: sub_19093+83j
		mov	ax, word ptr [bp+arg_2]
		mov	dx, word ptr [bp+arg_2+2]
		add	ax, 8
		cmp	ax, word ptr [bp+var_4]
		jnb	short loc_1914A
		mov	ax, word ptr [bp+arg_2]
		add	ax, 8
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_1914A:				; CODE XREF: sub_19093+A9j
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	bx, [bx+0E12h]
		mov	di, bx
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	6
sub_19093	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_19181(int, char *)
sub_19181	proc far		; CODE XREF: sub_18844+2ECp
					; sub_18844+32Dp ...

var_B8		= word ptr -0B8h
var_B6		= word ptr -0B6h
var_B4		= byte ptr -0B4h
var_A0		= byte ptr -0A0h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0B8h ; '�'
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_2]
		assume es:nothing
		cmp	byte ptr es:[bx], 2Fh ;	'/'
		jnz	short loc_191C6
		push	es
		push	bx		; char *
		push	[bp+arg_0]	; int
		push	cs
		call	near ptr sub_19093

loc_191A0:				; CODE XREF: sub_19181+7Fj
		mov	ax, word ptr [bp+arg_2]
		mov	dx, word ptr [bp+arg_2+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_191AC:				; CODE XREF: sub_19181+84j
		mov	bx, [bp+arg_0]
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx+62D0h]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		jmp	short loc_1920B
; ---------------------------------------------------------------------------

loc_191C6:				; CODE XREF: sub_19181+14j
		les	bx, [bp+arg_2]
		mov	al, byte_4728B
		cmp	es:[bx], al
		jz	short loc_191E6
		push	es
		push	bx
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+arg_0]
		call	sub_1939B
		or	ax, ax
		jz	short loc_191E6

loc_191E1:				; CODE XREF: sub_19181+DDj
					; sub_19181+207j
		sub	ax, ax
		jmp	loc_19393
; ---------------------------------------------------------------------------

loc_191E6:				; CODE XREF: sub_19181+4Ej
					; sub_19181+5Ej
		mov	ax, 5Ch	; '\'
		push	ax		; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_191A0
		inc	word ptr [bp+var_4]
		jmp	short loc_191AC
; ---------------------------------------------------------------------------

loc_19207:				; CODE XREF: sub_19181+B8j
		add	word ptr [bp+var_8], 4

loc_1920B:				; CODE XREF: sub_19181+43j
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_19260
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_B8], ax
		mov	[bp+var_B6], dx
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	dx
		push	ax
		push	[bp+arg_0]
		call	sub_1939B
		or	ax, ax
		jz	short loc_19207
		les	di, [bp+var_4]
		push	ds
		lds	si, [bp+arg_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		jmp	short loc_191E1
; ---------------------------------------------------------------------------

loc_19260:				; CODE XREF: sub_19181+94j
		mov	cx, 0Ah
		push	si
		mov	di, 62E4h
		mov	si, 0E8Ch
		mov	ax, ds
		mov	es, ax
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	si
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	bx, [bx+0DE4h]
		push	si
		mov	di, bx
		mov	si, 62E4h
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	si
		mov	di, 62E4h
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, 62E4h
		mov	word ptr [bp+var_C], cx
		mov	word ptr [bp+var_C+2], ds
		push	si
		mov	si, 62E4h
		les	di, [bp+var_4]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		pop	si
		push	dx
		push	word ptr [bp+var_C] ; char *
		call	_strupr
		add	sp, 4
		push	si
		mov	di, 0E96h
		mov	si, 62E4h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	si
		call	sub_23285
		mov	si, [bp+arg_0]
		shl	si, 1
		push	word ptr [si+0DECh]
		push	ds
		push	word ptr [si+0E1Ah]
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		mov	ax, 62E4h
		push	ds
		push	ax
		lea	ax, [bp+var_B4]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_17C4E
		or	ax, ax
		jz	short loc_1938B
		push	si
		lea	di, [bp+var_A0]
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		push	ds
		lds	si, [bp+arg_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		pop	si
		mov	bx, [bp+arg_0]
		shl	bx, 1
		push	word ptr [bx+0DECh]
		push	cs
		call	near ptr sub_197B5
		jmp	loc_191E1
; ---------------------------------------------------------------------------

loc_1938B:				; CODE XREF: sub_19181+1CEj
		call	sub_2329F
		mov	ax, 0FFFFh

loc_19393:				; CODE XREF: sub_19181+62j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	6
sub_19181	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1939B	proc near		; CODE XREF: sub_19181+59p
					; sub_19181+B3p

var_94		= byte ptr -94h
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 94h	; '�'
		call	__chkstk
		push	di
		push	si
		mov	[bp+var_94], 0
		mov	ax, word ptr [bp+arg_2]
		or	ax, word ptr [bp+arg_2+2]
		jz	short loc_193D9
		lea	si, [bp+var_94]
		les	di, [bp+arg_2]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx

loc_193D9:				; CODE XREF: sub_1939B+18j
		lea	si, [bp+var_94]
		les	di, [bp+arg_6]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	word_4E948, 1
		mov	ax, 4
		push	ax		; int
		lea	ax, [bp+var_94]
		push	ss
		push	ax		; char *
		call	far ptr	_access
		add	sp, 6
		or	ax, ax
		jnz	short loc_19462
		mov	word_4E948, 0
		push	[bp+arg_0]
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		call	sub_19B12
		lea	di, [bp+var_94]
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		push	ds
		lds	si, [bp+arg_6]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, 1
		jmp	short loc_1946A
; ---------------------------------------------------------------------------

loc_19462:				; CODE XREF: sub_1939B+86j
		mov	word_4E948, 0
		sub	ax, ax

loc_1946A:				; CODE XREF: sub_1939B+C5j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_1939B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19472	proc near		; CODE XREF: sub_17C4E+3Fp

var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= byte ptr -96h
var_2		= word ptr -2
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 0A6h ; '�'
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_0]
		assume es:nothing
		cmp	byte ptr es:[bx], 5Ch ;	'\'
		jz	short loc_1948B
		jmp	loc_19543
; ---------------------------------------------------------------------------

loc_1948B:				; CODE XREF: sub_19472+14j
		lea	ax, [bp+var_98]
		push	ss
		push	ax		; unsigned int *
		call	__dos_getdrive
		add	sp, 4
		mov	al, byte ptr [bp+var_98]
		add	al, 40h	; '@'
		mov	byte_41E78, al
		lea	si, [bp+var_96]
		les	di, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	bx, ax
		mov	word ptr [bp+var_9E], bx
		mov	word ptr [bp+var_9E+2],	dx
		mov	di, 0E98h
		mov	ax, ds
		push	ds
		lds	si, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	bx, ax
		mov	si, word ptr [bp+var_9E]
		mov	cx, word ptr [bp+var_9E+2]
		mov	word ptr [bp+var_A2], si
		mov	word ptr [bp+var_A2+2],	cx
		mov	word ptr [bp+var_A6], bx
		mov	word ptr [bp+var_A6+2],	dx
		les	di, [bp+var_A2]
		assume es:nothing
		push	ds
		lds	si, [bp+var_A6]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		jmp	loc_19656
; ---------------------------------------------------------------------------

loc_19543:				; CODE XREF: sub_19472+16j
		mov	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1], 3Ah	; ':'
		jz	short loc_19550
		jmp	loc_19656
; ---------------------------------------------------------------------------

loc_19550:				; CODE XREF: sub_19472+D9j
		cmp	byte ptr es:[bx+2], 5Ch	; '\'
		jnz	short loc_1955A
		jmp	loc_19656
; ---------------------------------------------------------------------------

loc_1955A:				; CODE XREF: sub_19472+E3j
		lea	ax, [bp+var_2]
		push	ss
		push	ax		; unsigned int *
		call	__dos_getdrive
		add	sp, 4
		les	bx, [bp+arg_0]
		assume es:nothing
		mov	al, es:[bx]
		mov	byte_41E78, al
		cbw
		sub	ax, 40h	; '@'
		mov	[bp+var_98], ax
		lea	ax, [bp+var_9A]
		push	ss
		push	ax		; unsigned int *
		push	[bp+var_98]	; unsigned int
		call	__dos_setdrive
		add	sp, 6
		lea	ax, [bp+var_96]
		push	ss
		push	ax		; char *
		mov	ax, 93h	; '�'
		push	ax		; int
		push	cs
		call	near ptr sub_1A694
		mov	bx, ax
		mov	word ptr [bp+var_A6], bx
		mov	word ptr [bp+var_A6+2],	dx
		mov	di, 0D94h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_A6]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:nothing
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	bx, ax
		mov	si, word ptr [bp+arg_0]
		mov	cx, word ptr [bp+arg_0+2]
		mov	word ptr [bp+var_A2], si
		mov	word ptr [bp+var_A2+2],	cx
		mov	word ptr [bp+var_9E], bx
		mov	word ptr [bp+var_9E+2],	dx
		les	di, [bp+var_A2]
		push	ds
		lds	si, [bp+var_9E]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		lea	di, [bp+var_96]
		mov	ax, ss
		mov	es, ax
		push	ds
		lds	si, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		lea	ax, [bp+var_9A]
		push	ss
		push	ax		; unsigned int *
		push	[bp+var_2]	; unsigned int
		call	__dos_setdrive
		add	sp, 6

loc_19656:				; CODE XREF: sub_19472+CEj
					; sub_19472+DBj ...
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_19677
		push	dx
		push	ax		; char *
		call	_strupr
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	4
sub_19472	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19677	proc near		; CODE XREF: sub_19472+1EAp

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		jmp	short loc_19697
; ---------------------------------------------------------------------------

loc_19690:				; CODE XREF: sub_19677+3Aj
		les	bx, [bp+var_4]
		assume es:nothing
		mov	byte ptr es:[bx], 5Ch ;	'\'

loc_19697:				; CODE XREF: sub_19677+17j
		mov	ax, 2Fh	; '/'
		push	ax		; int
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; char *
		call	_strchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jnz	short loc_19690
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	sp, bp
		pop	bp
		retn	4
sub_19677	endp


; =============== S U B	R O U T	I N E =======================================


sub_196BF	proc far		; CODE XREF: sub_181DF+11p
					; sub_18844+445p ...
		xor	ax, ax
		call	__chkstk
		push	di
		mov	cx, 7D00h
		les	di, dword_42AD2
		mov	ax, 0FFh
		repne stosb
		mov	cx, 7D00h
		les	di, dword_42AC4
		repne stosb
		call	sub_232D3
		mov	ax, 1B06h
		push	ds
		push	ax
		call	sub_29DCE
		call	sub_232B2
		pop	di
		retf
sub_196BF	endp


; =============== S U B	R O U T	I N E =======================================


sub_196F2	proc far		; CODE XREF: sub_17F89+Ep sub_1800D+8p ...
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		call	sub_2A28A
		call	sub_2A016
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1C985
		retf
sub_196F2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19715	proc near		; CODE XREF: sub_1827E+99p
					; sub_1827E+ADp ...

arg_0		= byte ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		lea	ax, [bp+arg_0]
		push	ss
		push	ax		; void *
		mov	ax, 2
		push	ax		; unsigned int
		call	sub_1972F
		pop	bp
		retn	2
sub_19715	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1972F(unsigned int,	void *)
sub_1972F	proc near		; CODE XREF: sub_19715+13p
					; sub_19768+13p ...

arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_0]	; unsigned int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; void *
		push	word_472AE	; int
		call	_write
		add	sp, 8
		cmp	ax, [bp+arg_0]
		jz	short loc_19764
		mov	ax, 1
		push	ax		; int
		mov	ax, 62BCh
		push	ds
		push	ax		; jmp_buf
		call	_longjmp
; ---------------------------------------------------------------------------
		add	sp, 6

loc_19764:				; CODE XREF: sub_1972F+22j
		pop	bp
		retn	6
sub_1972F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19768	proc near		; CODE XREF: sub_1827E+12Ap
					; sub_1827E+13Fp ...

arg_0		= byte ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		lea	ax, [bp+arg_0]
		push	ss
		push	ax		; void *
		mov	ax, 1
		push	ax		; unsigned int
		call	sub_1972F
		pop	bp
		retn	2
sub_19768	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19782	proc far		; CODE XREF: sub_17C2A+Ep
					; sub_17E89+12p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		sub	ax, 3
		mov	word_472EC, ax
		mov	bx, ax
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx+62D0h]
		les	bx, es:[bx]
		les	bx, es:[bx]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_22943
		pop	bp
		retf	2
sub_19782	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_197B5	proc far		; CODE XREF: sub_17E89+B9p
					; sub_17F89+6Dp ...

var_94		= byte ptr -94h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 94h	; '�'
		call	__chkstk
		lea	ax, [bp+var_94]
		push	ss
		push	ax
		call	sub_2290A
		mov	ax, [bp+arg_0]
		sub	ax, 3
		push	ax
		lea	ax, [bp+var_94]
		push	ss
		push	ax
		call	sub_19B12
		mov	sp, bp
		pop	bp
		retf	2
sub_197B5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_197E1(int, char *)
sub_197E1	proc far		; CODE XREF: sub_19BE4+2CAp

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		push	di
		push	si
		les	di, [bp+arg_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, word ptr [bp+arg_2]
		mov	ax, es
		dec	cx
		mov	word ptr [bp+var_8], cx
		mov	word ptr [bp+var_8+2], ax
		les	bx, [bp+var_8]
		mov	byte ptr es:[bx], 0
		mov	ax, 5Ch	; '\'
		push	ax		; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_1984D
		mov	bx, [bp+arg_0]
		shl	bx, 1
		push	ds
		push	word ptr [bx+0DD4h] ; char *
		mov	dx, word ptr [bp+var_4+2]
		inc	ax
		push	dx
		push	ax		; char *
		call	_stricmp
		add	sp, 8
		mov	cx, ax
		cmp	cx, 1
		sbb	ax, ax
		neg	ax
		jmp	short loc_1984F
; ---------------------------------------------------------------------------

loc_1984D:				; CODE XREF: sub_197E1+47j
		sub	ax, ax

loc_1984F:				; CODE XREF: sub_197E1+6Aj
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_1985D
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0

loc_1985D:				; CODE XREF: sub_197E1+73j
		les	di, [bp+arg_2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	[bp+var_E], cx
		mov	ax, cx
		add	ax, word ptr [bp+arg_2]
		mov	dx, es
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		cmp	[bp+var_A], 0
		jz	short loc_1988A
		les	bx, [bp+var_8]
		inc	word ptr [bp+var_8]
		mov	byte ptr es:[bx], 5Ch ;	'\'

loc_1988A:				; CODE XREF: sub_197E1+9Dj
		mov	[bp+var_C], 0

loc_1988F:				; CODE XREF: sub_197E1+102j
		mov	ax, [bp+arg_0]
		cmp	[bp+var_C], ax
		jz	short loc_198DC
		cmp	[bp+var_A], 0
		jz	short loc_198CC
		mov	bx, [bp+var_C]
		shl	bx, 1
		mov	bx, [bx+0DD4h]
		mov	di, bx
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds

loc_198CC:				; CODE XREF: sub_197E1+BAj
		push	[bp+var_C]	; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		mov	ax, 1
		push	ax		; int
		call	sub_19BE4

loc_198DC:				; CODE XREF: sub_197E1+B4j
		inc	[bp+var_C]
		cmp	[bp+var_C], 4
		jb	short loc_1988F
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	6
sub_197E1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_198ED	proc far		; CODE XREF: sub_23F23+124P

var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= byte ptr -4Ah
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 4Eh	; 'N'
		call	__chkstk
		push	di
		push	si
		lea	ax, [bp+var_4]
		push	ss
		push	ax		; unsigned int *
		call	__dos_getdrive
		add	sp, 4
		mov	al, byte ptr [bp+var_4]
		add	al, 40h	; '@'
		mov	byte_41E40, al
		mov	ax, 9EB9h
		mov	dx, seg	seg000
		push	dx
		push	ax
		call	sub_21D21
		mov	byte_4728B, 0
		call	sub_34D60
		mov	[bp+var_2], ax
		cmp	[bp+var_4], 3
		jb	short loc_19932
		jmp	loc_19A0F
; ---------------------------------------------------------------------------

loc_19932:				; CODE XREF: sub_198ED+40j
		test	byte ptr [bp+var_2], 1
		jnz	short loc_1993B
		jmp	loc_19A0F
; ---------------------------------------------------------------------------

loc_1993B:				; CODE XREF: sub_198ED+49j
		cmp	word_4DF94, 0
		jz	short loc_19945
		jmp	loc_199FF
; ---------------------------------------------------------------------------

loc_19945:				; CODE XREF: sub_198ED+53j
		test	byte ptr [bp+var_2], 0C0h
		jnz	short loc_1994E
		jmp	loc_199FF
; ---------------------------------------------------------------------------

loc_1994E:				; CODE XREF: sub_198ED+5Cj
		mov	di, 0E60h
		lea	si, [bp+var_4A]
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		xor	[bp+var_4A], 3
		lea	ax, [bp+var_4A]
		push	ss
		push	ax		; char *
		call	sub_22E75
		or	ax, ax
		jnz	short loc_19982
		jmp	loc_19A26
; ---------------------------------------------------------------------------

loc_19982:				; CODE XREF: sub_198ED+90j
		sub	ax, ax
		push	ax
		lea	ax, [bp+var_4A]
		push	ss
		push	ax
		call	sub_19B12
		mov	di, 0D94h
		lea	si, [bp+var_4A]
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	bx, word_41DB4
		mov	[bp+var_4E], ax
		mov	[bp+var_4C], ds
		mov	di, bx
		mov	ax, ds
		push	ds
		mov	si, [bp+var_4E]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		sub	ax, ax
		push	ax
		lea	ax, [bp+var_4A]
		push	ss
		push	ax
		call	sub_19B12
		jmp	short loc_19A26
; ---------------------------------------------------------------------------

loc_199FF:				; CODE XREF: sub_198ED+55j
					; sub_198ED+5Ej
		call	sub_25C16
		test	byte ptr [bp+var_2], 0C0h
		jnz	short loc_19A26
		mov	al, byte_41E40
		jmp	short loc_19A21
; ---------------------------------------------------------------------------

loc_19A0F:				; CODE XREF: sub_198ED+42j
					; sub_198ED+4Bj
		test	byte ptr [bp+var_2], 0C0h
		jnz	short loc_19A26
		sub	bx, bx
		mov	es, bx
		assume es:nothing
		mov	bx, 504h
		mov	al, es:[bx]
		add	al, 41h	; 'A'

loc_19A21:				; CODE XREF: sub_198ED+120j
		xor	al, 3
		mov	byte_4728B, al

loc_19A26:				; CODE XREF: sub_198ED+92j
					; sub_198ED+110j ...
		lea	ax, [bp+var_4A]
		push	ss
		push	ax		; char *
		mov	ax, 40h	; '@'
		push	ax		; int
		push	cs
		call	near ptr sub_1A694
		sub	ax, ax
		push	ax
		lea	ax, [bp+var_4A]
		push	ss
		push	ax
		call	sub_19B12
		mov	di, 0D94h
		lea	si, [bp+var_4A]
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		lea	di, [bp+var_4A]
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	si, cx
		lea	ax, [bp+si+var_4A]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], ss
		push	ds
		pop	es
		assume es:dseg
		mov	di, word_41DB4
		push	ds
		lds	si, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		sub	ax, ax
		push	ax
		lea	ax, [bp+var_4A]
		push	ss
		push	ax
		call	sub_19B12
		mov	[bp+var_A], 0

loc_19AB9:				; CODE XREF: sub_198ED+210j
		mov	bx, [bp+var_A]
		shl	bx, 1
		mov	bx, [bx+0DD4h]
		mov	di, bx
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		push	[bp+var_A]	; int
		lea	ax, [bp+var_4A]
		push	ss
		push	ax		; char *
		sub	ax, ax
		push	ax		; int
		call	sub_19BE4
		inc	[bp+var_A]
		cmp	[bp+var_A], 4
		jb	short loc_19AB9
		mov	ax, 98EDh
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_198ED	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_19B12	proc near		; CODE XREF: sub_1939B+97p
					; sub_197B5+23p ...

var_98		= dword	ptr -98h
var_94		= byte ptr -94h
arg_0		= dword	ptr  4
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 98h	; '�'
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_0]
		assume es:nothing
		cmp	byte ptr es:[bx], 0
		jz	short loc_19B6E
		cmp	byte ptr es:[bx+1], 3Ah	; ':'
		jnz	short loc_19B6E
		lea	si, [bp+var_94]
		mov	di, bx
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	al, [bp+var_94]
		cbw
		mov	bx, ax
		test	byte ptr [bx+5E27h], 2
		jz	short loc_19B64
		sub	al, 20h	; ' '
		jmp	short loc_19B68
; ---------------------------------------------------------------------------

loc_19B64:				; CODE XREF: sub_19B12+4Cj
		mov	al, [bp+var_94]

loc_19B68:				; CODE XREF: sub_19B12+50j
		mov	[bp+var_94], al
		jmp	short loc_19BCD
; ---------------------------------------------------------------------------

loc_19B6E:				; CODE XREF: sub_19B12+14j
					; sub_19B12+1Bj
		mov	di, 0E60h
		lea	si, [bp+var_94]
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	bx, ax
		mov	si, word ptr [bp+arg_0]
		mov	cx, word ptr [bp+arg_0+2]
		mov	word ptr [bp+var_98], si
		mov	word ptr [bp+var_98+2],	cx
		mov	si, bx
		les	di, [bp+var_98]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx

loc_19BCD:				; CODE XREF: sub_19B12+5Aj
		push	[bp+arg_4]	; int
		lea	ax, [bp+var_94]
		push	ss
		push	ax		; char *
		sub	ax, ax
		push	ax		; int
		call	sub_19BE4
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	6
sub_19B12	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_19BE4(int, char *, int)
sub_19BE4	proc near		; CODE XREF: sub_197E1+F8p
					; sub_198ED+206p ...

var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_32		= dword	ptr -32h
var_2E		= byte ptr -2Eh
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 38h	; '8'
		call	__chkstk
		push	di
		push	si
		les	di, [bp+arg_2]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	[bp+var_34], cx
		mov	ax, cx
		add	ax, word ptr [bp+arg_2]
		mov	dx, es
		dec	ax
		mov	word ptr [bp+var_12], ax
		mov	word ptr [bp+var_12+2],	dx
		les	bx, [bp+var_12]
		cmp	byte ptr es:[bx], 5Ch ;	'\'
		jnz	short loc_19C22
		dec	word ptr [bp+var_12]
		mov	byte ptr es:[bx], 0
		dec	[bp+var_34]

loc_19C22:				; CODE XREF: sub_19BE4+32j
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	sub_22E75
		or	ax, ax
		jnz	short loc_19C34
		jmp	loc_19EB1
; ---------------------------------------------------------------------------

loc_19C34:				; CODE XREF: sub_19BE4+4Bj
		mov	ax, word ptr [bp+var_12]
		mov	dx, word ptr [bp+var_12+2]
		inc	ax
		mov	bx, ax
		mov	word ptr [bp+var_38], bx
		mov	word ptr [bp+var_38+2],	dx
		mov	di, 0D94h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_38]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:nothing
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		inc	[bp+var_34]
		mov	bx, [bp+arg_6]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx+62D0h]
		mov	dx, [bx+62D2h]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jnz	short loc_19C87
		jmp	loc_19E00
; ---------------------------------------------------------------------------

loc_19C87:				; CODE XREF: sub_19BE4+9Ej
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_1A], ax
		mov	word ptr [bp+var_1A+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		jmp	short loc_19CA3
; ---------------------------------------------------------------------------

loc_19C9F:				; CODE XREF: sub_19BE4+109j
		add	word ptr [bp+var_16], 4

loc_19CA3:				; CODE XREF: sub_19BE4+B9j
		les	bx, [bp+var_16]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jnz	short loc_19CB2
		jmp	loc_19D53
; ---------------------------------------------------------------------------

loc_19CB2:				; CODE XREF: sub_19BE4+C9j
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_32+2],	dx
		les	di, [bp+arg_2]
		push	ds
		lds	si, [bp+var_32]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		repe cmpsb
		jz	short loc_19CEA
		sbb	ax, ax
		sbb	ax, 0FFFFh

loc_19CEA:				; CODE XREF: sub_19BE4+FFj
		pop	ds
		or	ax, ax
		jnz	short loc_19C9F
		mov	ax, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		cmp	word ptr [bp+var_16], ax
		jnz	short loc_19D02
		cmp	word ptr [bp+var_16+2],	dx
		jnz	short loc_19D02
		jmp	loc_19EB1
; ---------------------------------------------------------------------------

loc_19D02:				; CODE XREF: sub_19BE4+114j
					; sub_19BE4+119j
		cmp	[bp+arg_0], 0
		jz	short loc_19D0B
		jmp	loc_19EB1
; ---------------------------------------------------------------------------

loc_19D0B:				; CODE XREF: sub_19BE4+122j
		les	bx, [bp+var_16]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, bx
		sub	ax, word ptr [bp+var_1A]
		sar	ax, 1
		and	al, 0FEh
		shl	ax, 1
		push	ax		; size_t
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A] ; void *
		mov	ax, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		add	ax, 4
		push	dx
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		les	bx, [bp+var_1A]
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		jmp	loc_19EB1
; ---------------------------------------------------------------------------

loc_19D53:				; CODE XREF: sub_19BE4+CBj
		lea	ax, [bp+var_2E]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_19D6E
		jmp	loc_19EB1
; ---------------------------------------------------------------------------

loc_19D6E:				; CODE XREF: sub_19BE4+185j
		mov	ax, [bp+var_34]
		inc	ax
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	ax, word ptr [bp+var_16]
		sub	ax, word ptr [bp+var_1A]
		sar	ax, 1
		sar	ax, 1
		mov	[bp+var_1C], ax
		shl	ax, 1
		shl	ax, 1
		mov	[bp+var_E], ax
		add	ax, 8
		push	ax
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B551
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		cmp	[bp+arg_0], 0
		jz	short loc_19DD9
		mov	ax, [bp+var_1C]
		shl	ax, 1
		shl	ax, 1
		add	word ptr [bp+var_16], ax
		les	bx, [bp+var_16]
		sub	ax, ax
		mov	es:[bx+6], ax
		mov	es:[bx+4], ax
		jmp	short loc_19DF9
; ---------------------------------------------------------------------------

loc_19DD9:				; CODE XREF: sub_19BE4+1DAj
		mov	ax, [bp+var_E]
		add	ax, 4
		push	ax		; size_t
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16] ; void *
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		add	ax, 4
		push	dx
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah

loc_19DF9:				; CODE XREF: sub_19BE4+1F3j
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_19E5D
; ---------------------------------------------------------------------------

loc_19E00:				; CODE XREF: sub_19BE4+A0j
		mov	ax, [bp+var_34]
		inc	ax
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	ax, 8
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	bx, [bp+arg_6]
		shl	bx, 1
		shl	bx, 1
		mov	[bx+62D0h], ax
		mov	[bx+62D2h], dx
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		les	bx, [bp+var_16]
		sub	ax, ax
		mov	es:[bx+6], ax
		mov	es:[bx+4], ax

loc_19E5D:				; CODE XREF: sub_19BE4+21Aj
		les	bx, [bp+var_16]
		mov	ax, word ptr [bp+var_8]
		mov	dx, word ptr [bp+var_8+2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_32+2],	dx
		les	di, [bp+arg_2]
		push	ds
		lds	si, [bp+var_32]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		cmp	[bp+arg_0], 0
		jnz	short loc_19EB1
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		push	[bp+arg_6]	; int
		push	cs
		call	near ptr sub_197E1

loc_19EB1:				; CODE XREF: sub_19BE4+4Dj
					; sub_19BE4+11Bj ...
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_19BE4	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		push	di
		push	si
		add	word ptr [bp+6], 40h ; '@'
		mov	bx, word_472EC
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx+62D0h]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		jmp	short loc_19EE9
; ---------------------------------------------------------------------------

loc_19EE5:				; CODE XREF: seg000:9F11j seg000:9F59j
		add	word ptr [bp-8], 4

loc_19EE9:				; CODE XREF: seg000:9EE3j
		les	bx, [bp-8]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jnz	short loc_19EF8
		jmp	loc_19F91
; ---------------------------------------------------------------------------

loc_19EF8:				; CODE XREF: seg000:9EF3j
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-0Eh], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Eh]
		mov	al, [bp+6]
		cmp	es:[bx], al
		jnz	short loc_19EE5
		mov	di, bx
		push	ds
		lds	si, [bp+8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	di, [bp+8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	si, cx
		mov	bx, [bp+8]
		mov	byte ptr es:[bx+si-1], 0
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		call	sub_22E75
		or	ax, ax
		jz	short loc_19EE5
		mov	di, 0D94h
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp+8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		sub	ax, ax
		jmp	loc_1A08D
; ---------------------------------------------------------------------------

loc_19F91:				; CODE XREF: seg000:9EF5j
		mov	word_4E948, 1
		mov	word_4DF5E, 0
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		mov	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr sub_1A694
		cmp	word_4DF5E, 0
		jz	short loc_19FB5
		jmp	loc_1A081
; ---------------------------------------------------------------------------

loc_19FB5:				; CODE XREF: seg000:9FB0j
		mov	di, 0D94h
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp+8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	di, [bp+8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, [bp+8]
		mov	ax, dx
		mov	[bp-4],	cx
		mov	[bp-2],	ax
		mov	bx, word_472EC
		shl	bx, 1
		mov	bx, [bx+0DD4h]
		mov	di, bx
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp-4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		call	sub_22E75
		or	ax, ax
		jz	short loc_1A07A
		mov	di, 0D94h
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp+8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		jmp	short loc_1A081
; ---------------------------------------------------------------------------

loc_1A07A:				; CODE XREF: seg000:A045j
		les	bx, [bp-4]
		assume es:nothing
		mov	byte ptr es:[bx], 0

loc_1A081:				; CODE XREF: seg000:9FB2j seg000:A078j
		mov	ax, word_4DF5E
		mov	[bp-0Ah], ax
		mov	word_4E948, 0

loc_1A08D:				; CODE XREF: seg000:9F8Ej
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	6

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A095	proc far		; CODE XREF: sub_1C5B3+A8p

var_A8		= byte ptr -0A8h
var_94		= byte ptr -94h

		push	bp
		mov	bp, sp
		mov	ax, 0A8h ; '�'
		call	__chkstk
		push	di
		push	si
		cmp	byte_4B3CC, 0
		jz	short loc_1A0C5
		mov	ax, 0A3ECh
		push	ds
		push	ax		; char *
		call	sub_257C2
		or	ax, ax
		jz	short loc_1A0BE
		cmp	ax, 2
		jz	short loc_1A10D
		jmp	short loc_1A0C5
; ---------------------------------------------------------------------------

loc_1A0BE:				; CODE XREF: sub_1A095+20j
		mov	byte_4B3CC, 0
		jmp	short loc_1A10D
; ---------------------------------------------------------------------------

loc_1A0C5:				; CODE XREF: sub_1A095+12j
					; sub_1A095+27j
		mov	ax, 3
		push	ax
		mov	ax, 1B2Eh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 0DB8h
		push	ds
		push	ax
		lea	ax, [bp+var_A8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_17C4E
		or	ax, ax
		jz	short loc_1A10D
		lea	di, [bp+var_94]
		mov	si, 0A3ECh
		mov	ax, ss
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx

loc_1A10D:				; CODE XREF: sub_1A095+25j
					; sub_1A095+2Ej ...
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_1A095	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A113	proc far		; CODE XREF: sub_23F23+11FP

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	di
		mov	[bp+var_2], 0
		mov	word_4E948, 1
		mov	ax, 8000h
		push	ax		; int
		mov	ax, 0CF0h
		push	ds
		push	ax		; char *
		call	_open
		add	sp, 6
		mov	word_472AE, ax
		or	ax, ax
		jl	short loc_1A19A
		mov	ax, 628Ch
		push	ds
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1A18E
		call	sub_1A626
		mov	word_4E956, ax
		call	sub_1A626
		mov	word_490B6, ax
		call	sub_1A626
		mov	word_4DF5C, ax
		call	sub_1A626
		mov	word_4DF7E, ax
		mov	ax, 7414h
		push	ds
		push	ax		; void *
		mov	ax, 372h
		push	ax		; unsigned int
		call	sub_1A5ED
		mov	ax, 0CBFEh
		push	ds
		push	ax		; void *
		mov	ax, 372h
		push	ax		; unsigned int
		call	sub_1A5ED
		mov	[bp+var_2], 1
		mov	word_41CDE, 1

loc_1A18E:				; CODE XREF: sub_1A113+3Ej
		push	word_472AE	; int
		call	_close
		add	sp, 2

loc_1A19A:				; CODE XREF: sub_1A113+2Dj
		mov	word_4E948, 0
		cmp	[bp+var_2], 0
		jnz	short loc_1A1DE
		mov	word_4E956, 0
		mov	word_490B6, 1
		mov	word_4DF5C, 1
		mov	word_4DF7E, 0
		mov	bx, 7414h
		mov	cx, 372h
		mov	di, bx
		mov	ax, ds
		mov	es, ax
		sub	ax, ax
		repne stosb
		mov	dx, es
		mov	bx, 0CBFEh
		mov	cx, 372h
		mov	di, bx
		mov	ax, ds
		sub	ax, ax
		repne stosb

loc_1A1DE:				; CODE XREF: sub_1A113+91j
		mov	ax, 0A113h
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_1A113	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A1F0	proc far		; CODE XREF: sub_23B75+90P
					; sub_25ACE+FCP

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		call	sub_2329F
		mov	word_4E948, 1
		mov	[bp+var_2], 0
		cmp	word_41CDE, 0
		jz	short loc_1A24C
		jmp	short loc_1A222
; ---------------------------------------------------------------------------

loc_1A214:				; CODE XREF: sub_1A1F0+4Cj
		mov	ax, 0EC6h
		push	ax
		call	sub_1A307
		or	ax, ax
		jz	short loc_1A222
		jmp	loc_1A2FE
; ---------------------------------------------------------------------------

loc_1A222:				; CODE XREF: sub_1A1F0+22j
					; sub_1A1F0+2Dj ...
		mov	ax, 6
		push	ax		; int
		mov	ax, 0CF0h
		push	ds
		push	ax		; char *
		call	far ptr	_access
		add	sp, 6
		or	ax, ax
		jz	short loc_1A24C
		cmp	word_4664F, 0Dh
		jnz	short loc_1A214
		mov	ax, 0E9Ch
		push	ax
		call	sub_1A307
		or	ax, ax
		jz	short loc_1A222
		jmp	loc_1A2FE
; ---------------------------------------------------------------------------

loc_1A24C:				; CODE XREF: sub_1A1F0+20j
					; sub_1A1F0+45j
		mov	ax, 0CF0h
		push	ds
		push	ax		; char *
		mov	ax, 5D5Eh
		mov	dx, seg	seg001
		push	dx
		push	ax		; __int32
		nop
		push	cs
		call	near ptr sub_10458
		or	ax, ax
		jnz	short loc_1A265
		jmp	loc_1A2FE
; ---------------------------------------------------------------------------

loc_1A265:				; CODE XREF: sub_1A1F0+70j
		mov	ax, 180h
		push	ax
		mov	ax, 8301h
		push	ax		; int
		mov	ax, 0CF0h
		push	ds
		push	ax		; char *
		call	_open
		add	sp, 8
		mov	word_472AE, ax
		cmp	ax, 1
		sbb	cx, cx
		neg	cx
		or	cx, cx
		jl	short loc_1A2F9
		mov	ax, 62BCh
		push	ds
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1A2A0
		mov	[bp+var_2], 1
		jmp	short loc_1A2D4
; ---------------------------------------------------------------------------

loc_1A2A0:				; CODE XREF: sub_1A1F0+A7j
		push	word_4E956
		call	sub_19715
		push	word_490B6
		call	sub_19715
		push	word_4DF5C
		call	sub_19715
		push	word_4DF7E
		call	sub_19715
		mov	ax, 7414h
		push	ds
		push	ax		; void *
		mov	ax, 372h
		push	ax		; unsigned int
		call	sub_1972F
		mov	ax, 0CBFEh
		push	ds
		push	ax		; void *
		mov	ax, 372h
		push	ax		; unsigned int
		call	sub_1972F

loc_1A2D4:				; CODE XREF: sub_1A1F0+AEj
		push	word_472AE	; int
		call	_close
		add	sp, 2
		mov	word_4E948, 0
		cmp	[bp+var_2], 0
		jz	short loc_1A2FE
		mov	ax, 0CF0h
		push	ds
		push	ax		; char *
		call	far ptr	_remove
		add	sp, 4

loc_1A2F9:				; CODE XREF: sub_1A1F0+96j
		call	sub_25CAE

loc_1A2FE:				; CODE XREF: sub_1A1F0+2Fj
					; sub_1A1F0+59j ...
		call	sub_23285
		mov	sp, bp
		pop	bp
		retf
sub_1A1F0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A307	proc near		; CODE XREF: sub_1A1F0+28p
					; sub_1A1F0+52p

var_4		= dword	ptr -4
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, 23h	; '#'
		push	ax		; int
		push	ds
		push	word ptr [bp+arg_0] ; char *
		call	_strchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_1A335
		les	bx, [bp+var_4]
		assume es:nothing
		mov	al, byte_41E40
		mov	es:[bx], al

loc_1A335:				; CODE XREF: sub_1A307+23j
		push	ds
		push	word ptr [bp+arg_0]
		call	sub_2558B
		cmp	ax, 2
		jnz	short loc_1A348
		mov	ax, 1
		jmp	short loc_1A34A
; ---------------------------------------------------------------------------

loc_1A348:				; CODE XREF: sub_1A307+3Aj
		sub	ax, ax

loc_1A34A:				; CODE XREF: sub_1A307+3Fj
		mov	sp, bp
		pop	bp
		retn	2
sub_1A307	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A350	proc near		; CODE XREF: sub_18844+308p

var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= byte ptr -46h

		push	bp
		mov	bp, sp
		mov	ax, 4Ch	; 'L'
		call	__chkstk
		push	di
		push	si
		lea	ax, [bp+var_46]
		mov	cx, 46h	; 'F'
		mov	di, ax
		push	ss
		pop	es
		sub	ax, ax
		repne stosb
		mov	dx, es
		mov	[bp+var_4C], 8914h

loc_1A372:				; CODE XREF: sub_1A350+60j
		mov	bx, [bp+var_4C]
		cmp	word ptr [bx+20h], 0
		jz	short loc_1A3A6
		mov	ax, [bx+1E5h]
		mov	[bp+var_4A], ax

loc_1A382:				; CODE XREF: sub_1A350+54j
		mov	ax, [bp+var_4A]
		sub	ax, 80DAh
		cwd
		mov	cx, 1Eh
		idiv	cx
		mov	si, ax
		mov	[bp+si+var_46],	1
		mov	bx, [bp+var_4A]
		mov	ax, [bx+18h]
		mov	[bp+var_4A], ax
		mov	bx, [bp+var_4C]
		cmp	[bx+1E5h], ax
		jnz	short loc_1A382

loc_1A3A6:				; CODE XREF: sub_1A350+29j
		add	[bp+var_4C], 1E7h
		cmp	[bp+var_4C], 0A3B6h
		jb	short loc_1A372
		mov	[bp+var_4A], 80DAh
		lea	ax, [bp+var_46]
		mov	[bp+var_48], ax

loc_1A3BD:				; CODE XREF: sub_1A350+89j
		mov	bx, [bp+var_48]
		cmp	byte ptr [bx], 0
		jnz	short loc_1A3CD
		push	[bp+var_4A]
		call	sub_2453F

loc_1A3CD:				; CODE XREF: sub_1A350+73j
		add	[bp+var_4A], 1Eh
		inc	[bp+var_48]
		cmp	[bp+var_4A], 890Eh
		jb	short loc_1A3BD
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn
sub_1A350	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1A3E1(void *, unsigned int)
sub_1A3E1	proc near		; CODE XREF: sub_1827E+A5p
					; sub_1827E+2C1p ...

arg_0		= dword	ptr  4
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		call	sub_19715
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; void *
		push	[bp+arg_4]	; unsigned int
		call	sub_1972F
		pop	bp
		retn	6
sub_1A3E1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A401	proc near		; CODE XREF: sub_1827E+DEp

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, word ptr [bp+arg_2]
		or	ax, word ptr [bp+arg_2+2]
		jz	short loc_1A48C
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B047
		mov	ax, 2
		push	ax		; unsigned int
		lea	ax, [bp+arg_0]
		push	ss
		push	ax		; void *
		push	word_472AE	; int
		call	_write
		add	sp, 8
		cmp	ax, 2
		jnz	short loc_1A463
		push	[bp+arg_0]	; unsigned int
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		push	word_472AE	; int
		call	_write
		add	sp, 8
		cmp	ax, [bp+arg_0]
		jz	short loc_1A45C
		mov	ax, 1
		jmp	short loc_1A45E
; ---------------------------------------------------------------------------

loc_1A45C:				; CODE XREF: sub_1A401+54j
		sub	ax, ax

loc_1A45E:				; CODE XREF: sub_1A401+59j
		mov	[bp+var_2], ax
		jmp	short loc_1A468
; ---------------------------------------------------------------------------

loc_1A463:				; CODE XREF: sub_1A401+36j
		mov	[bp+var_2], 1

loc_1A468:				; CODE XREF: sub_1A401+60j
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_2], 0
		jz	short loc_1A492
		mov	ax, 1
		push	ax		; int
		mov	ax, 62BCh
		push	ds
		push	ax		; jmp_buf
		call	_longjmp
; ---------------------------------------------------------------------------
		add	sp, 6
		jmp	short loc_1A492
; ---------------------------------------------------------------------------

loc_1A48C:				; CODE XREF: sub_1A401+11j
		sub	ax, ax
		push	ax
		call	sub_19715

loc_1A492:				; CODE XREF: sub_1A401+76j
					; sub_1A401+89j
		mov	sp, bp
		pop	bp
		retn	6
sub_1A401	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1A498(void *, int)
sub_1A498	proc near		; CODE XREF: sub_1827E+1E3p
					; sub_1827E+224p ...

arg_0		= dword	ptr  4
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		cmp	[bp+arg_4], 0
		jz	short loc_1A4BF
		les	di, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		push	cx		; unsigned int
		push	es
		push	word ptr [bp+arg_0] ; void *
		call	sub_1A3E1
		jmp	short loc_1A4C5
; ---------------------------------------------------------------------------

loc_1A4BF:				; CODE XREF: sub_1A498+Fj
		sub	ax, ax
		push	ax
		call	sub_19715

loc_1A4C5:				; CODE XREF: sub_1A498+25j
		pop	di
		pop	bp
		retn	6
sub_1A498	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A4CA	proc near		; CODE XREF: sub_18844+179p

var_12		= byte ptr -12h
arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 12h
		call	__chkstk
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1A531
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_1A50A
		push	[bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1B551
		jmp	short loc_1A525
; ---------------------------------------------------------------------------

loc_1A50A:				; CODE XREF: sub_1A4CA+2Dj
		push	[bp+arg_0]
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		les	bx, [bp+arg_2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx

loc_1A525:				; CODE XREF: sub_1A4CA+3Ej
		nop
		push	cs
		call	near ptr sub_1B0CF
		cmp	word_490A0, 0
		jz	short loc_1A542

loc_1A531:				; CODE XREF: sub_1A4CA+21j
		les	bx, [bp+arg_2]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_1A542:				; CODE XREF: sub_1A4CA+65j
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1A559
		mov	sp, bp
		pop	bp
		retn	6
sub_1A4CA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A559	proc far		; CODE XREF: sub_185CA+24Bp
					; sub_1A4CA+86p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B047
		push	[bp+arg_0]	; unsigned int
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		push	word_472AE	; int
		call	_read
		add	sp, 8
		cmp	ax, [bp+arg_0]
		jz	short loc_1A592
		mov	ax, 1
		jmp	short loc_1A594
; ---------------------------------------------------------------------------

loc_1A592:				; CODE XREF: sub_1A559+32j
		sub	ax, ax

loc_1A594:				; CODE XREF: sub_1A559+37j
		mov	[bp+var_2], ax
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_2], 0
		jz	short loc_1A5B9
		mov	ax, 1
		push	ax		; int
		mov	ax, 628Ch
		push	ds
		push	ax		; jmp_buf
		call	_longjmp
; ---------------------------------------------------------------------------
		add	sp, 6

loc_1A5B9:				; CODE XREF: sub_1A559+4Dj
		mov	sp, bp
		pop	bp
		retf	6
sub_1A559	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1A5BF(void *)
sub_1A5BF	proc near		; CODE XREF: sub_18844+A4p
					; sub_18844+CFp ...

var_2		= word ptr -2
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		call	sub_1A626
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_1A5E0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; void *
		push	ax		; unsigned int
		call	sub_1A5ED
		jmp	short loc_1A5E7
; ---------------------------------------------------------------------------

loc_1A5E0:				; CODE XREF: sub_1A5BF+13j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx], 0

loc_1A5E7:				; CODE XREF: sub_1A5BF+1Fj
		mov	sp, bp
		pop	bp
		retn	4
sub_1A5BF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1A5ED(unsigned int,	void *)
sub_1A5ED	proc near		; CODE XREF: sub_185CA+12Dp
					; sub_185CA+163p ...

arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_0]	; unsigned int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; void *
		push	word_472AE	; int
		call	_read
		add	sp, 8
		cmp	ax, [bp+arg_0]
		jz	short loc_1A622
		mov	ax, 1
		push	ax		; int
		mov	ax, 628Ch
		push	ds
		push	ax		; jmp_buf
		call	_longjmp
; ---------------------------------------------------------------------------
		add	sp, 6

loc_1A622:				; CODE XREF: sub_1A5ED+22j
		pop	bp
		retn	6
sub_1A5ED	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A626	proc near		; CODE XREF: sub_185CA:loc_186D0p
					; sub_185CA+114p ...

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		lea	ax, [bp+var_2]
		push	ss
		push	ax		; void *
		mov	ax, 2
		push	ax		; unsigned int
		call	sub_1A5ED
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retn
sub_1A626	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A644	proc near		; CODE XREF: sub_185CA+263p
					; sub_18844+58p ...

var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		call	sub_1A626
		mov	[bp+var_2], ax
		cmp	[bp+arg_0], ax
		jnb	short loc_1A66B
		mov	ax, 1
		push	ax		; int
		mov	ax, 628Ch
		push	ds
		push	ax		; jmp_buf
		call	_longjmp
; ---------------------------------------------------------------------------
		add	sp, 6

loc_1A66B:				; CODE XREF: sub_1A644+14j
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retn	2
sub_1A644	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A674	proc near		; CODE XREF: sub_18844+9p
					; sub_18844+19p ...

var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		lea	ax, [bp+var_2]
		push	ss
		push	ax		; void *
		mov	ax, 1
		push	ax		; unsigned int
		call	sub_1A5ED
		mov	al, [bp+var_2]
		sub	ah, ah
		mov	sp, bp
		pop	bp
		retn
sub_1A674	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_1A694(int, char *)
sub_1A694	proc far		; CODE XREF: sub_19472+123p
					; sub_198ED+143p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	di
		push	si
		push	[bp+arg_0]	; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; char *
		call	_getcwd
		add	sp, 6
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		les	bx, [bp+arg_2]
		mov	cx, 3
		mov	di, 0EE6h
		lea	si, [bx+1]
		push	ds
		push	ds
		push	es
		pop	ds
		pop	es
		shr	cx, 1
		sbb	ax, ax
		cmp	cx, cx
		repe cmpsw
		jnz	short loc_1A6D7
		sub	cx, ax
		repe cmpsb

loc_1A6D7:				; CODE XREF: sub_1A694+3Dj
		pop	ds
		jnz	short loc_1A6E2
		les	bx, [bp+arg_2]
		mov	byte ptr es:[bx+2], 0

loc_1A6E2:				; CODE XREF: sub_1A694+44j
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	6
sub_1A694	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A6F0	proc far		; CODE XREF: sub_2362A+14P

var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	[bp+var_2], 7D00h
		mov	ax, 40h	; '@'
		mov	dx, seg	seg004
		push	dx
		push	ax
		mov	ax, 262Ch
		push	ax
		lea	ax, [bp+arg_0]
		push	ss
		push	ax
		lea	ax, [bp+var_2]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1EF26
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_1A733
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jnz	short loc_1A733
		mov	ax, 0
		mov	dx, seg	seg004
		jmp	short loc_1A739
; ---------------------------------------------------------------------------

loc_1A733:				; CODE XREF: sub_1A6F0+31j
					; sub_1A6F0+39j
		mov	ax, 20h	; ' '
		mov	dx, seg	seg004

loc_1A739:				; CODE XREF: sub_1A6F0+41j
		push	dx
		push	ax
		call	sub_20A92
		mov	sp, bp
		pop	bp
		retf	4
sub_1A6F0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A746	proc far		; CODE XREF: sub_23F23+3FP

var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= REGS ptr -28h
var_1A		= REGS ptr -1Ah
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 30h	; '0'
		call	__chkstk
		push	si
		cmp	word_41EEA, 0
		jz	short loc_1A75C
		jmp	loc_1A890
; ---------------------------------------------------------------------------

loc_1A75C:				; CODE XREF: sub_1A746+11j
		mov	word_41EEA, 1
		call	__memavl
		mov	[bp+var_8], ax
		mov	[bp+var_6], 0
		mov	ax, [bp+arg_0]
		sub	dx, dx
		sub	[bp+var_8], ax
		sbb	[bp+var_6], dx
		cmp	[bp+var_6], dx
		jnz	short loc_1A786
		jnb	short loc_1A786
		nop
		push	cs
		call	near ptr sub_10336
; ---------------------------------------------------------------------------

loc_1A786:				; CODE XREF: sub_1A746+37j
					; sub_1A746+39j
		cmp	[bp+var_6], 0
		jnz	short loc_1A795
		cmp	[bp+var_8], 8
		ja	short loc_1A795
		jmp	loc_1A822
; ---------------------------------------------------------------------------

loc_1A795:				; CODE XREF: sub_1A746+44j
					; sub_1A746+4Aj
		push	[bp+var_8]
		call	unknown_libname_2 ; MS Quick C v1.0/v2.01 & MSC	v5.1 DOS run-time & graphic
		add	sp, 2
		mov	word ptr [bp+var_30], ax
		mov	word ptr [bp+var_30+2],	ds
		push	ds
		push	ax
		call	sub_1C4FA
		mov	cx, ax
		mov	bx, dx
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	si, cx
		add	ax, si
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, bx
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	es, seg_47036
		assume es:seg008
		cmp	es:word_40FD2, 0
		jge	short loc_1A806
		mov	es, seg_47038
		cmp	es:word_40FD6, dx
		ja	short loc_1A806
		jb	short loc_1A7E9
		cmp	es:word_40FD4, ax
		jnb	short loc_1A806

loc_1A7E9:				; CODE XREF: sub_1A746+9Aj
		push	word_47336
		push	word_47334
		push	es:word_40FD6
		push	es:word_40FD4
		call	__aFahdiff
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx

loc_1A806:				; CODE XREF: sub_1A746+8Dj
					; sub_1A746+98j ...
		cmp	[bp+var_6], 0
		jnz	short loc_1A812
		cmp	[bp+var_8], 8
		jbe	short loc_1A822

loc_1A812:				; CODE XREF: sub_1A746+C4j
		push	word ptr [bp+var_30+2]
		push	word ptr [bp+var_30]
		push	[bp+var_6]
		push	[bp+var_8]
		push	cs
		call	near ptr sub_1A9B3

loc_1A822:				; CODE XREF: sub_1A746+4Cj
					; sub_1A746+CAj
		mov	word ptr [bp+var_1A+2],	0FFFFh

loc_1A827:				; CODE XREF: sub_1A746+175j
					; sub_1A746+188j ...
		mov	byte ptr [bp+var_1A+1],	48h ; 'H'
		lea	ax, [bp+var_28]
		push	ss
		push	ax		; union	REGS *
		lea	ax, [bp+var_1A]
		push	ss
		push	ax		; union	REGS *
		call	_intdos
		add	sp, 8
		mov	ax, word ptr [bp+var_28+2]
		sub	dx, dx
		mov	cl, 4
		call	__aFlshl
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		or	dx, dx
		jg	short loc_1A8A9
		jl	short loc_1A85A
		cmp	ax, 2
		jnb	short loc_1A8A9

loc_1A85A:				; CODE XREF: sub_1A746+10Dj
		mov	es, seg_47036
		cmp	es:word_40FD2, 0
		jl	short loc_1A890
		jg	short loc_1A870
		cmp	es:word_40FD0, 0
		jz	short loc_1A890

loc_1A870:				; CODE XREF: sub_1A746+120j
		mov	es, seg_47038
		push	es:word_40FD6
		push	es:word_40FD4
		mov	es, seg_47036
		push	es:word_40FD2
		push	es:word_40FD0
		push	cs
		call	near ptr sub_1A9B3

loc_1A890:				; CODE XREF: sub_1A746+13j
					; sub_1A746+11Ej ...
		mov	word_490A0, 0
		mov	ax, 0A746h
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		mov	ax, 2
		jmp	loc_1A9AC
; ---------------------------------------------------------------------------

loc_1A8A9:				; CODE XREF: sub_1A746+10Bj
					; sub_1A746+112j
		mov	ax, word ptr [bp+var_28+2]
		mov	word ptr [bp+var_1A+2],	ax
		cmp	word ptr [bp+var_28+0Ch], 0
		jz	short loc_1A8D1
		cmp	byte ptr [bp+var_28], 8
		jnz	short loc_1A8BE
		jmp	loc_1A827
; ---------------------------------------------------------------------------

loc_1A8BE:				; CODE XREF: sub_1A746+173j
		mov	ax, 0EEAh
		push	ds
		push	ax
		mov	al, byte ptr [bp+var_28]
		sub	ah, ah
		push	ax
		nop
		push	cs
		call	near ptr sub_1034A
; ---------------------------------------------------------------------------
		jmp	loc_1A827
; ---------------------------------------------------------------------------

loc_1A8D1:				; CODE XREF: sub_1A746+16Dj
		mov	ax, [bp+var_2C]
		or	ax, [bp+var_2A]
		jnz	short loc_1A8DC
		jmp	loc_1A827
; ---------------------------------------------------------------------------

loc_1A8DC:				; CODE XREF: sub_1A746+191j
		mov	dx, word ptr [bp+var_28]
		sub	ax, ax
		push	dx
		push	ax
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1C4C8
		mov	word ptr [bp+var_30], ax
		mov	word ptr [bp+var_30+2],	dx
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	es, seg_47036
		cmp	es:word_40FD2, 0
		jge	short loc_1A95D
		mov	es, seg_47038
		cmp	es:word_40FD6, dx
		ja	short loc_1A95D
		jb	short loc_1A931
		cmp	es:word_40FD4, ax
		jnb	short loc_1A95D

loc_1A931:				; CODE XREF: sub_1A746+1E2j
		push	[bp+var_2]
		push	[bp+var_4]
		push	es:word_40FD6
		push	es:word_40FD4
		call	__aFahdiff
		mov	[bp+var_2C], ax
		mov	[bp+var_2A], dx
		or	dx, dx
		jg	short loc_1A95D
		jge	short loc_1A955
		jmp	loc_1A827
; ---------------------------------------------------------------------------

loc_1A955:				; CODE XREF: sub_1A746+20Aj
		cmp	ax, 8
		ja	short loc_1A95D
		jmp	loc_1A827
; ---------------------------------------------------------------------------

loc_1A95D:				; CODE XREF: sub_1A746+1D5j
					; sub_1A746+1E0j ...
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		sub	ax, 8
		sbb	dx, 0
		push	dx
		push	ax
		push	cs
		call	near ptr sub_1A9B3
		les	bx, [bp+var_30]
		assume es:nothing
		mov	ax, word_47334
		mov	dx, word_47336
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+var_30]
		mov	ax, [bp+var_2C]
		mov	dx, [bp+var_2A]
		mov	es:[bx+4], ax
		mov	es:[bx+6], dx
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	word_47334, ax
		mov	word_47336, dx
		jmp	loc_1A827
; ---------------------------------------------------------------------------

loc_1A9AC:				; CODE XREF: sub_1A746+160j
		pop	si
		mov	sp, bp
		pop	bp
		retf	2
sub_1A746	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1A9B3	proc far		; CODE XREF: sub_1A746+D9p
					; sub_1A746+147p ...

var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		push	si
		cmp	[bp+arg_2], 0
		jnz	short loc_1A9D3
		jnb	short loc_1A9CA
		jmp	loc_1AD6B
; ---------------------------------------------------------------------------

loc_1A9CA:				; CODE XREF: sub_1A9B3+12j
		cmp	[bp+arg_0], 12h
		ja	short loc_1A9D3
		jmp	loc_1AD6B
; ---------------------------------------------------------------------------

loc_1A9D3:				; CODE XREF: sub_1A9B3+10j
					; sub_1A9B3+1Bj
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1C4E0
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		mov	ax, word_4732C
		or	ax, word_4732E
		jnz	short loc_1AA2E
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	word_4732C, ax
		mov	word_4732E, dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		mov	word_472F0, ax
		mov	word_472F2, dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_1AA24:				; CODE XREF: sub_1A9B3+135j
		mov	word_47320, ax
		mov	word_47322, dx
		jmp	loc_1AD6B
; ---------------------------------------------------------------------------

loc_1AA2E:				; CODE XREF: sub_1A9B3+41j
		mov	ax, word_4732C
		mov	dx, word_4732E
		cmp	[bp+var_2], dx
		jbe	short loc_1AA3D
		jmp	loc_1AAEB
; ---------------------------------------------------------------------------

loc_1AA3D:				; CODE XREF: sub_1A9B3+85j
		jb	short loc_1AA47
		cmp	[bp+var_4], ax
		jbe	short loc_1AA47
		jmp	loc_1AAEB
; ---------------------------------------------------------------------------

loc_1AA47:				; CODE XREF: sub_1A9B3:loc_1AA3Dj
					; sub_1A9B3+8Fj
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		cmp	ax, word_4732C
		jnz	short loc_1AA85
		cmp	dx, word_4732E
		jnz	short loc_1AA85
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	word_4732C, ax
		mov	word_4732E, dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	word_47320, ax
		adc	word_47322, dx
		jmp	loc_1AD6B
; ---------------------------------------------------------------------------

loc_1AA85:				; CODE XREF: sub_1A9B3+ACj
					; sub_1A9B3+B2j
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		push	[bp+var_6]
		push	[bp+var_8]
		push	dx
		push	ax
		push	dx
		push	ax
		push	word_4732E
		push	word_4732C
		call	__aFahdiff
		push	dx
		push	ax
		call	sub_1AD72
		mov	ax, 12h
		cwd
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	sub_1C4FA
		mov	word_4732C, ax
		mov	word_4732E, dx
		push	dx
		push	ax
		push	word_472F2
		push	word_472F0

loc_1AAE3:				; CODE XREF: sub_1A9B3+1BAj
		call	__aFahdiff
		jmp	loc_1AA24
; ---------------------------------------------------------------------------

loc_1AAEB:				; CODE XREF: sub_1A9B3+87j
					; sub_1A9B3+91j
		mov	ax, word_472F0
		mov	dx, word_472F2
		cmp	[bp+var_2], dx
		jb	short loc_1AB70
		ja	short loc_1AAFE
		cmp	[bp+var_4], ax
		jb	short loc_1AB70

loc_1AAFE:				; CODE XREF: sub_1A9B3+144j
		mov	ax, word_472F0
		mov	dx, word_472F2
		cmp	[bp+var_4], ax
		jnz	short loc_1AB0F
		cmp	[bp+var_2], dx
		jz	short loc_1AB43

loc_1AB0F:				; CODE XREF: sub_1A9B3+155j
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_472F2
		push	word_472F0
		push	word_472F2
		push	word_472F0
		mov	ax, 12h
		cwd
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	__aFahdiff
		push	dx
		push	ax
		call	sub_1AD72

loc_1AB43:				; CODE XREF: sub_1A9B3+15Aj
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	sub_1C4FA
		mov	word_472F0, ax
		mov	word_472F2, dx
		push	word_4732E
		push	word_4732C
		push	dx
		push	ax
		jmp	loc_1AAE3
; ---------------------------------------------------------------------------

loc_1AB70:				; CODE XREF: sub_1A9B3+142j
					; sub_1A9B3+149j
		sub	ax, ax
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], ax
		push	word_4732A
		push	word_47328
		jmp	loc_1AC18
; ---------------------------------------------------------------------------

loc_1AB83:				; CODE XREF: sub_1A9B3+2C4j
					; sub_1A9B3+2CCj
		les	bx, [bp+var_10]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	ax, [bp+var_14]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_12]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		shl	dx, cl
		add	dx, [bp+var_2]
		cmp	ax, [bp+var_C]
		jnz	short loc_1ABDC
		cmp	dx, [bp+var_A]
		jnz	short loc_1ABDC
		push	[bp+var_12]
		push	[bp+var_14]
		push	[bp+var_2]
		push	[bp+var_4]
		call	__aFahdiff
		les	bx, [bp+var_10]
		mov	es:[bx+4], ax
		mov	es:[bx+6], dx
		jmp	loc_1AD6B
; ---------------------------------------------------------------------------

loc_1ABDC:				; CODE XREF: sub_1A9B3+203j
					; sub_1A9B3+208j
		push	[bp+var_12]
		push	[bp+var_14]
		mov	ax, 12h
		cwd
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	__aFahdiff
		les	bx, [bp+var_10]
		jmp	loc_1AD24
; ---------------------------------------------------------------------------

loc_1AC01:				; CODE XREF: sub_1A9B3+291j
					; sub_1A9B3+298j
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	word ptr [bp+var_18], ax
		mov	word ptr [bp+var_18+2],	dx
		les	bx, [bp+var_10]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]

loc_1AC18:				; CODE XREF: sub_1A9B3+1CDj
		call	sub_1C4E0
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jnz	short loc_1AC28
		jmp	loc_1ACB9
; ---------------------------------------------------------------------------

loc_1AC28:				; CODE XREF: sub_1A9B3+270j
		les	bx, [bp+var_10]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	[bp+var_12], dx
		jb	short loc_1AC01
		ja	short loc_1AC4D
		cmp	[bp+var_14], ax
		jb	short loc_1AC01

loc_1AC4D:				; CODE XREF: sub_1A9B3+293j
		mov	ax, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		les	bx, [bp+var_10]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	[bp+var_14], ax
		jz	short loc_1AC7A
		jmp	loc_1AB83
; ---------------------------------------------------------------------------

loc_1AC7A:				; CODE XREF: sub_1A9B3+2C2j
		cmp	[bp+var_12], dx
		jz	short loc_1AC82
		jmp	loc_1AB83
; ---------------------------------------------------------------------------

loc_1AC82:				; CODE XREF: sub_1A9B3+2CAj
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_14]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_12]
		push	dx
		push	ax
		call	sub_1C4E0
		les	bx, [bp+var_10]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+var_10]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		sub	es:[bx+4], ax
		sbb	es:[bx+6], dx
		jmp	loc_1AD6B
; ---------------------------------------------------------------------------

loc_1ACB9:				; CODE XREF: sub_1A9B3+272j
		les	bx, [bp+var_18]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		les	bx, [bp+var_18]
		mov	cx, ax
		mov	si, dx
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		mov	bx, cx
		add	ax, bx
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, si
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	[bp+var_C], ax
		jnz	short loc_1ACF9
		cmp	[bp+var_A], dx
		jz	short loc_1AD6B

loc_1ACF9:				; CODE XREF: sub_1A9B3+33Fj
		mov	bx, word ptr [bp+var_18]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		push	dx
		push	ax
		mov	ax, 12h
		cwd
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	__aFahdiff
		les	bx, [bp+var_18]

loc_1AD24:				; CODE XREF: sub_1A9B3+24Bj
		mov	es:[bx+4], ax
		mov	es:[bx+6], dx
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		add	ax, [bp+var_4]
		adc	dx, 0
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		push	[bp+var_A]
		push	[bp+var_C]
		call	__aFahdiff
		push	dx
		push	ax
		call	sub_1AD72

loc_1AD6B:				; CODE XREF: sub_1A9B3+14j
					; sub_1A9B3+1Dj ...
		pop	si
		mov	sp, bp
		pop	bp
		retf	8
sub_1A9B3	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1AD72	proc near		; CODE XREF: sub_1A9B3+105p
					; sub_1A9B3+18Dp ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	sub_1C4C8
		les	bx, [bp+arg_8]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_8]
		mov	byte ptr es:[bx+10h], 0F0h ; '�'
		les	bx, [bp+arg_8]
		mov	byte ptr es:[bx+11h], 0
		les	bx, [bp+arg_8]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx+4], ax
		mov	es:[bx+6], dx
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		call	sub_1C4FA
		push	dx
		push	ax
		call	sub_1B8FF
		pop	bp
		retn	0Ch
sub_1AD72	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1ADC2	proc far		; CODE XREF: seg000:06D1p

var_28		= dword	ptr -28h
var_24		= REGS ptr -24h
var_16		= REGS ptr -16h
var_8		= SREGS	ptr -8

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		push	word_47336
		push	word_47334
		jmp	short loc_1AE14
; ---------------------------------------------------------------------------

loc_1ADD7:				; CODE XREF: sub_1ADC2+5Dj
		les	bx, [bp+var_28]
		cmp	word ptr es:[bx+6], 0
		jl	short loc_1AE0A
		jg	short loc_1ADEA
		cmp	word ptr es:[bx+4], 0
		jz	short loc_1AE0A

loc_1ADEA:				; CODE XREF: sub_1ADC2+1Fj
		mov	byte ptr [bp+var_16+1],	49h ; 'I'
		mov	ax, es
		mov	[bp+var_8._es],	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax		; struct SREGS *
		lea	ax, [bp+var_24]
		push	ss
		push	ax		; union	REGS *
		lea	ax, [bp+var_16]
		push	ss
		push	ax		; union	REGS *
		call	_intdosx
		add	sp, 0Ch

loc_1AE0A:				; CODE XREF: sub_1ADC2+1Dj
					; sub_1ADC2+26j
		les	bx, [bp+var_28]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]

loc_1AE14:				; CODE XREF: sub_1ADC2+13j
		call	sub_1C4C8
		mov	word ptr [bp+var_28], ax
		mov	word ptr [bp+var_28+2],	dx
		or	ax, dx
		jnz	short loc_1ADD7
		mov	word_41EEA, 0
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf
sub_1ADC2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_1AE31(size_t,	void *,	void *)
sub_1AE31	proc far		; CODE XREF: sub_1B551+202p
					; sub_1C2D0+F1p

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		add	ax, word ptr [bp+arg_6]
		mov	dx, word ptr [bp+arg_6+2]
		cmp	ax, word ptr [bp+arg_6]
		jnb	short loc_1AE56
		push	dx
		push	word ptr [bp+arg_6]
		call	sub_1C4C8
		mov	word ptr [bp+arg_6], ax
		mov	word ptr [bp+arg_6+2], dx

loc_1AE56:				; CODE XREF: sub_1AE31+16j
		mov	ax, [bp+arg_0]
		add	ax, word ptr [bp+arg_2]
		mov	dx, word ptr [bp+arg_2+2]
		cmp	ax, word ptr [bp+arg_2]
		jnb	short loc_1AE71
		push	dx
		push	word ptr [bp+arg_2]
		call	sub_1C4C8
		mov	word ptr [bp+arg_2], ax
		mov	word ptr [bp+arg_2+2], dx

loc_1AE71:				; CODE XREF: sub_1AE31+31j
		push	[bp+arg_0]	; size_t
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6] ; void *
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; void *
		call	_memmove
		add	sp, 0Ah
		mov	word_490A0, 0
		pop	bp
		retf	0Ah
sub_1AE31	endp


; =============== S U B	R O U T	I N E =======================================


sub_1AE92	proc far		; CODE XREF: sub_265F3+26P
					; sub_26A01+7EP ...
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		mov	ax, 2
		push	ax
		call	sub_1C2D0
		mov	word_490A0, 0
		retf
sub_1AE92	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1AEAD	proc far		; CODE XREF: sub_10A53+234p
					; sub_10FFD+8Ap ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1BD42
		or	ax, ax
		jz	short loc_1AEEA
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BB8B

loc_1AED9:				; CODE XREF: sub_1AEAD+53j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BB40
		mov	word_490A0, 0
		jmp	short loc_1AF08
; ---------------------------------------------------------------------------

loc_1AEEA:				; CODE XREF: sub_1AEAD+21j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BD92
		or	ax, ax
		jz	short loc_1AF02
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BC83
		jmp	short loc_1AED9
; ---------------------------------------------------------------------------

loc_1AF02:				; CODE XREF: sub_1AEAD+48j
		mov	word_490A0, 206h

loc_1AF08:				; CODE XREF: sub_1AEAD+3Bj
		mov	sp, bp
		pop	bp
		retf	4
sub_1AEAD	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		mov	word_490A0, 0
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_1C4FA
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		mov	ax, word_47328
		mov	dx, word_4732A
		jmp	short loc_1AF42
; ---------------------------------------------------------------------------

loc_1AF37:				; CODE XREF: seg000:AF75j seg000:AF7Cj ...
		les	bx, [bp-10h]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]

loc_1AF42:				; CODE XREF: seg000:AF35j
		mov	[bp-0Ch], ax
		mov	[bp-0Ah], dx
		or	ax, dx
		jz	short loc_1AFAE
		push	dx
		push	word ptr [bp-0Ch]
		call	sub_1C4E0
		mov	[bp-10h], ax
		mov	[bp-0Eh], dx
		les	bx, [bp-10h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp-8]
		mov	dx, [bp-6]
		cmp	[bp-2],	dx
		ja	short loc_1AF37
		jb	short loc_1AF7E
		cmp	[bp-4],	ax
		ja	short loc_1AF37

loc_1AF7E:				; CODE XREF: seg000:AF77j
		les	bx, [bp-10h]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	ax, [bp-4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp-2]
		cmp	dx, [bp-6]
		jb	short loc_1AF37
		ja	short loc_1AFA3
		cmp	ax, [bp-8]
		jbe	short loc_1AF37

loc_1AFA3:				; CODE XREF: seg000:AF9Cj
		push	word ptr [bp-0Ah]
		push	word ptr [bp-0Ch]
		call	sub_1C4C8
		jmp	short loc_1AFB1
; ---------------------------------------------------------------------------

loc_1AFAE:				; CODE XREF: seg000:AF4Aj
		sub	ax, ax
		cwd

loc_1AFB1:				; CODE XREF: seg000:AFACj
		mov	sp, bp
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1AFB7	proc far		; CODE XREF: sub_256C0+DP
					; sub_256C0:loc_256E5P

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, word_47320
		mov	dx, word_47322
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	word_4732A
		push	word_47328
		jmp	short loc_1AFF2
; ---------------------------------------------------------------------------

loc_1AFD9:				; CODE XREF: sub_1AFB7+46j
		les	bx, [bp+var_8]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]

loc_1AFF2:				; CODE XREF: sub_1AFB7+20j
		call	sub_1C4E0
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jnz	short loc_1AFD9
		mov	word_490A0, 0
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf
sub_1AFB7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B00F	proc far		; CODE XREF: sub_27D5E+144P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	word_490A0, 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+10h]
		sub	ah, ah
		pop	bp
		retf	4
sub_1B00F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B02C	proc far		; CODE XREF: sub_27D5E+157P
					; sub_27D5E+288P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	word_490A0, 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		pop	bp
		retf	4
sub_1B02C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B047	proc far		; CODE XREF: sub_10963+23p
					; sub_10A53+24Ep ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+10h], 80h
		mov	word_490A0, 0
		pop	bp
		retf	4
sub_1B047	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B063	proc far		; CODE XREF: sub_10963+A0p
					; sub_10963+E6p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+10h], 7Fh
		mov	word_490A0, 0
		pop	bp
		retf	4
sub_1B063	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B07F	proc far		; CODE XREF: _main+30p	sub_10167+8Dp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	word_41EE6, 633Ch
		jnz	short loc_1B0A6
		cmp	seg_41EE8, seg dseg
		jnz	short loc_1B0A6
		mov	ax, 0F0Ch
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1034A
; ---------------------------------------------------------------------------

loc_1B0A6:				; CODE XREF: sub_1B07F+10j
					; sub_1B07F+18j
		les	bx, dword ptr word_41EE6
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		mov	bx, word_41EE6
		add	word_41EE6, 4
		mov	es, seg_41EE8
		assume es:dseg
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		pop	bp
		retf	4
sub_1B07F	endp


; =============== S U B	R O U T	I N E =======================================


sub_1B0CF	proc far		; CODE XREF: sub_10167+10Ap
					; sub_10167+11Fp ...
		xor	ax, ax
		call	__chkstk
		cmp	word_41EE6, 6314h
		jnz	short loc_1B0E6
		cmp	seg_41EE8, seg dseg
		jz	short locret_1B0EB

loc_1B0E6:				; CODE XREF: sub_1B0CF+Dj
		sub	word_41EE6, 4

locret_1B0EB:				; CODE XREF: sub_1B0CF+15j
		retf
sub_1B0CF	endp


; =============== S U B	R O U T	I N E =======================================


sub_1B0EC	proc far		; CODE XREF: sub_1071A+2Fp
					; sub_107AD+5Ap ...
		xor	ax, ax
		call	__chkstk
		cmp	word_41EE6, 6314h
		jnz	short loc_1B103
		cmp	seg_41EE8, seg dseg
		jz	short locret_1B11F

loc_1B103:				; CODE XREF: sub_1B0EC+Dj
		mov	ax, 1
		push	ax		; int
		sub	word_41EE6, 4
		les	bx, dword ptr word_41EE6
		assume es:nothing
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; jmp_buf
		call	_longjmp
; ---------------------------------------------------------------------------
		add	sp, 6

locret_1B11F:				; CODE XREF: sub_1B0EC+15j
		retf
sub_1B0EC	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		sub	ax, ax
		mov	[bp-2],	ax
		mov	[bp-4],	ax
		mov	ax, word_4732C
		mov	dx, word_4732E
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		push	word_4732A
		push	word_47328
		jmp	short loc_1B1B4
; ---------------------------------------------------------------------------

loc_1B14A:				; CODE XREF: seg000:B1BFj
		les	bx, [bp-10h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp-0Ch], ax
		mov	[bp-0Ah], dx
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	dx
		push	ax
		call	__aFahdiff
		cmp	dx, [bp-2]
		jb	short loc_1B18D
		ja	short loc_1B176
		cmp	ax, [bp-4]
		jbe	short loc_1B18D

loc_1B176:				; CODE XREF: seg000:B16Fj
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word ptr [bp-0Ah]
		push	word ptr [bp-0Ch]
		call	__aFahdiff
		mov	[bp-4],	ax
		mov	[bp-2],	dx

loc_1B18D:				; CODE XREF: seg000:B16Dj seg000:B174j
		les	bx, [bp-10h]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	ax, [bp-0Ch]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp-0Ah]
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]

loc_1B1B4:				; CODE XREF: seg000:B148j
		call	sub_1C4E0
		mov	[bp-10h], ax
		mov	[bp-0Eh], dx
		or	ax, dx
		jnz	short loc_1B14A
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word_472F2
		push	word_472F0
		call	__aFahdiff
		cmp	dx, [bp-2]
		jb	short loc_1B1F9
		ja	short loc_1B1E0
		cmp	ax, [bp-4]
		jbe	short loc_1B1F9

loc_1B1E0:				; CODE XREF: seg000:B1D9j
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word_472F2
		push	word_472F0
		call	__aFahdiff
		mov	[bp-4],	ax
		mov	[bp-2],	dx

loc_1B1F9:				; CODE XREF: seg000:B1D7j seg000:B1DEj
		mov	word_490A0, 0
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B209	proc far		; CODE XREF: sub_107AD+87p
					; sub_108CB+66p ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		call	sub_1B815
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jnz	short loc_1B230

loc_1B221:				; CODE XREF: sub_1B209+43j
		mov	word_490A0, 201h
		push	cs
		call	near ptr sub_1B0EC
		sub	ax, ax
		cwd
		jmp	short loc_1B2A9
; ---------------------------------------------------------------------------

loc_1B230:				; CODE XREF: sub_1B209+16j
		push	[bp+arg_4]
		push	[bp+arg_0]
		call	sub_1BE02
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		or	dx, ax
		jnz	short loc_1B24E
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BB40
		jmp	short loc_1B221
; ---------------------------------------------------------------------------

loc_1B24E:				; CODE XREF: sub_1B209+38j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C4E0
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+var_8]
		mov	al, byte ptr [bp+arg_0]
		mov	es:[bx+10h], al
		les	bx, [bp+var_8]
		mov	al, [bp+arg_2]
		mov	es:[bx+11h], al
		les	bx, [bp+var_8]
		mov	ax, [bp+arg_4]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1B8FF
		mov	word_490A0, 0
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C4C8

loc_1B2A9:				; CODE XREF: sub_1B209+25j
		mov	sp, bp
		pop	bp
		retf	6
sub_1B209	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B2AF	proc far		; CODE XREF: sub_10167+38p
					; sub_180E4+4Fp ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		mov	word_490A0, 0
		test	[bp+arg_0], 0F0h
		jnz	short loc_1B2CD
		mov	[bp+var_E], 0FF0Fh
		jmp	short loc_1B2D2
; ---------------------------------------------------------------------------

loc_1B2CD:				; CODE XREF: sub_1B2AF+15j
		mov	[bp+var_E], 0FFFFh

loc_1B2D2:				; CODE XREF: sub_1B2AF+1Cj
		mov	ax, word_47328
		mov	dx, word_4732A
		jmp	short loc_1B2FC
; ---------------------------------------------------------------------------

loc_1B2DB:				; CODE XREF: sub_1B2AF+8Cj
		les	bx, [bp+var_8]
		test	byte ptr es:[bx+10h], 3
		jnz	short loc_1B2ED
		mov	word_490A0, 205h
		jmp	short loc_1B2F6
; ---------------------------------------------------------------------------

loc_1B2ED:				; CODE XREF: sub_1B2AF+34j
		push	[bp+var_A]
		push	[bp+var_C]
		call	sub_1BDE2

loc_1B2F6:				; CODE XREF: sub_1B2AF+3Cj
					; sub_1B2AF+85j ...
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_1B2FC:				; CODE XREF: sub_1B2AF+2Aj
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		or	ax, dx
		jz	short loc_1B345
		push	dx
		push	[bp+var_C]
		call	sub_1C4E0
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	al, es:[bx+11h]
		sub	ah, ah
		and	ax, [bp+var_E]
		mov	cl, [bp+arg_0]
		sub	ch, ch
		cmp	ax, cx
		jnz	short loc_1B2F6
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_1B2DB
		mov	word_490A0, 204h
		jmp	short loc_1B2F6
; ---------------------------------------------------------------------------

loc_1B345:				; CODE XREF: sub_1B2AF+55j
		mov	sp, bp
		pop	bp
		retf	2
sub_1B2AF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B34B	proc far		; CODE XREF: sub_10963+AFp
					; sub_28B00+E6P

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+10h], 80h
		jz	short loc_1B377
		mov	word_490A0, 204h
		jmp	short loc_1B3A2
; ---------------------------------------------------------------------------

loc_1B377:				; CODE XREF: sub_1B34B+22j
		test	byte ptr es:[bx+10h], 3
		jnz	short loc_1B386
		mov	word_490A0, 205h
		jmp	short loc_1B3A2
; ---------------------------------------------------------------------------

loc_1B386:				; CODE XREF: sub_1B34B+31j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BD42
		or	ax, ax
		jz	short loc_1B39C
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BDE2

loc_1B39C:				; CODE XREF: sub_1B34B+46j
		mov	word_490A0, 0

loc_1B3A2:				; CODE XREF: sub_1B34B+2Aj
					; sub_1B34B+39j
		mov	sp, bp
		pop	bp
		retf	4
sub_1B34B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B3A8	proc far		; CODE XREF: sub_256A4+7P sub_278AF+BP ...

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, word_47320
		mov	dx, word_47322
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	word_4732A
		push	word_47328
		jmp	short loc_1B3F1
; ---------------------------------------------------------------------------

loc_1B3CA:				; CODE XREF: sub_1B3A8+54j
		les	bx, [bp+var_8]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_1B3DB
		test	byte ptr es:[bx+10h], 3
		jnz	short loc_1B3E9

loc_1B3DB:				; CODE XREF: sub_1B3A8+2Aj
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx

loc_1B3E9:				; CODE XREF: sub_1B3A8+31j
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]

loc_1B3F1:				; CODE XREF: sub_1B3A8+20j
		call	sub_1C4E0
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jnz	short loc_1B3CA
		mov	word_490A0, 0
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf
sub_1B3A8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B40E	proc far		; CODE XREF: sub_286DF+7BP

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1BD42
		or	ax, ax
		jz	short loc_1B43A
		mov	word_490A0, 203h
		jmp	loc_1B4BA
; ---------------------------------------------------------------------------

loc_1B43A:				; CODE XREF: sub_1B40E+21j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BD92
		or	ax, ax
		jnz	short loc_1B44F
		mov	word_490A0, 206h
		jmp	short loc_1B4BA
; ---------------------------------------------------------------------------

loc_1B44F:				; CODE XREF: sub_1B40E+37j
		push	[bp+arg_8]
		push	[bp+arg_4]
		call	sub_1BE02
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		or	dx, ax
		jnz	short loc_1B46E
		push	cs
		call	near ptr sub_1B0EC
		mov	word_490A0, 201h
		jmp	short loc_1B4BA
; ---------------------------------------------------------------------------

loc_1B46E:				; CODE XREF: sub_1B40E+52j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BC83
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+arg_4]
		mov	es:[bx+10h], al
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_6]
		mov	es:[bx+11h], al
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1B8FF
		mov	word_490A0, 0

loc_1B4BA:				; CODE XREF: sub_1B40E+29j
					; sub_1B40E+3Fj ...
		mov	sp, bp
		pop	bp
		retf	0Ah
sub_1B40E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B4C0	proc far		; CODE XREF: sub_108CB+3Ap
					; sub_1F902+2Fp ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1BD42
		or	ax, ax
		jz	short loc_1B4EB
		mov	word_490A0, 203h
		jmp	short loc_1B54B
; ---------------------------------------------------------------------------

loc_1B4EB:				; CODE XREF: sub_1B4C0+21j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BD92
		or	ax, ax
		jnz	short loc_1B500
		mov	word_490A0, 206h
		jmp	short loc_1B54B
; ---------------------------------------------------------------------------

loc_1B500:				; CODE XREF: sub_1B4C0+36j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+4]
		mov	al, es:[bx+10h]
		sub	ah, ah
		push	ax
		call	sub_1BE02
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		or	dx, ax
		jnz	short loc_1B523
		mov	word_490A0, 201h
		jmp	short loc_1B54B
; ---------------------------------------------------------------------------

loc_1B523:				; CODE XREF: sub_1B4C0+59j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BC83
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1B8FF
		mov	word_490A0, 0

loc_1B54B:				; CODE XREF: sub_1B4C0+29j
					; sub_1B4C0+3Ej ...
		mov	sp, bp
		pop	bp
		retf	4
sub_1B4C0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B551	proc far		; CODE XREF: sub_16592+3B7p
					; sub_19BE4+1C3p ...

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		sub	dx, dx
		cmp	es:[bx+4], ax
		jnz	short loc_1B573
		cmp	es:[bx+6], dx
		jnz	short loc_1B573
		jmp	loc_1B798
; ---------------------------------------------------------------------------

loc_1B573:				; CODE XREF: sub_1B551+17j
					; sub_1B551+1Dj
		push	es
		push	bx
		call	sub_1C4FA
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1BD92
		or	ax, ax
		jz	short loc_1B5ED
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jz	short loc_1B59D
		mov	word_490A0, 202h
		jmp	loc_1B798
; ---------------------------------------------------------------------------

loc_1B59D:				; CODE XREF: sub_1B551+41j
		push	[bp+arg_4]
		mov	al, es:[bx+10h]
		sub	ah, ah
		push	ax
		call	sub_1BE02
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	dx, ax
		jnz	short loc_1B5C1

loc_1B5B4:				; CODE XREF: sub_1B551+1EAj
		mov	word_490A0, 201h

loc_1B5BA:				; CODE XREF: sub_1B551+AFj
		push	cs
		call	near ptr sub_1B0EC
		jmp	loc_1B798
; ---------------------------------------------------------------------------

loc_1B5C1:				; CODE XREF: sub_1B551+61j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BC83
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		jmp	loc_1B789
; ---------------------------------------------------------------------------

loc_1B5ED:				; CODE XREF: sub_1B551+34j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BD42
		or	ax, ax
		jnz	short loc_1B602
		mov	word_490A0, 206h
		jmp	short loc_1B5BA
; ---------------------------------------------------------------------------

loc_1B602:				; CODE XREF: sub_1B551+A7j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C450
		mov	cx, [bp+arg_4]
		sub	bx, bx
		cmp	bx, dx
		ja	short loc_1B63F
		jb	short loc_1B61A
		cmp	cx, ax
		ja	short loc_1B63F

loc_1B61A:				; CODE XREF: sub_1B551+C3j
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		cmp	[bp+arg_4], 0
		jz	short loc_1B633
		jmp	loc_1B792
; ---------------------------------------------------------------------------

loc_1B633:				; CODE XREF: sub_1B551+DDj
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BB8B
		jmp	loc_1B789
; ---------------------------------------------------------------------------

loc_1B63F:				; CODE XREF: sub_1B551+C1j
					; sub_1B551+C7j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C450
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		les	bx, [bp+arg_0]
		jmp	short loc_1B684
; ---------------------------------------------------------------------------

loc_1B653:				; CODE XREF: sub_1B551+152j
		les	bx, [bp+var_8]
		test	byte ptr es:[bx+10h], 0F0h
		jnz	short loc_1B6A5
		push	[bp+var_16]
		push	[bp+var_18]
		call	sub_1C450
		add	[bp+var_C], ax
		adc	[bp+var_A], dx
		les	bx, [bp+var_8]
		test	byte ptr es:[bx+10h], 3
		jnz	short loc_1B684
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		sub	[bp+var_C], ax
		sbb	[bp+var_A], dx

loc_1B684:				; CODE XREF: sub_1B551+100j
					; sub_1B551+123j
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		push	dx
		push	ax
		call	sub_1C4E0
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	ax, [bp+var_18]
		or	ax, [bp+var_16]
		jnz	short loc_1B653

loc_1B6A5:				; CODE XREF: sub_1B551+10Aj
		mov	ax, [bp+arg_4]
		sub	dx, dx
		cmp	dx, [bp+var_A]
		ja	short loc_1B6FD
		jb	short loc_1B6B6
		cmp	ax, [bp+var_C]
		ja	short loc_1B6FD

loc_1B6B6:				; CODE XREF: sub_1B551+15Ej
		mov	[bp+var_12], 2

loc_1B6BB:				; CODE XREF: sub_1B551+1AAj
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_12]
		call	sub_1C2D0
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C450
		mov	cx, [bp+arg_4]
		sub	bx, bx
		cmp	bx, dx
		ja	short loc_1B6F8
		jb	short loc_1B6E5
		cmp	cx, ax
		ja	short loc_1B6F8

loc_1B6E5:				; CODE XREF: sub_1B551+18Ej
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		jmp	loc_1B792
; ---------------------------------------------------------------------------

loc_1B6F8:				; CODE XREF: sub_1B551+18Cj
					; sub_1B551+192j
		dec	[bp+var_12]
		jnz	short loc_1B6BB

loc_1B6FD:				; CODE XREF: sub_1B551+15Cj
					; sub_1B551+163j
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+10h], 0F0h
		jz	short loc_1B710
		mov	word_490A0, 204h
		jmp	loc_1B798
; ---------------------------------------------------------------------------

loc_1B710:				; CODE XREF: sub_1B551+1B4j
		mov	al, es:[bx+10h]
		sub	ah, ah
		mov	[bp+var_14], ax
		and	byte ptr es:[bx+10h], 0FCh
		push	[bp+arg_4]
		push	[bp+var_14]
		call	sub_1BE02
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	dx, ax
		jnz	short loc_1B73E
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_14]
		mov	es:[bx+10h], al
		jmp	loc_1B5B4
; ---------------------------------------------------------------------------

loc_1B73E:				; CODE XREF: sub_1B551+1DEj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10] ; void *
		push	word ptr es:[bx+4] ; size_t
		push	cs
		call	near ptr sub_1AE31
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1BB8B
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_14]
		mov	es:[bx+10h], al

loc_1B789:				; CODE XREF: sub_1B551+99j
					; sub_1B551+EBj
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1B8FF

loc_1B792:				; CODE XREF: sub_1B551+DFj
					; sub_1B551+1A4j
		mov	word_490A0, 0

loc_1B798:				; CODE XREF: sub_1B551+1Fj
					; sub_1B551+49j ...
		mov	sp, bp
		pop	bp
		retf	6
sub_1B551	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B79E	proc far		; CODE XREF: sub_27A07+155P
					; sub_27A07+1E6P ...

arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	al, es:[bx+10h]
		and	al, 0FCh
		mov	cl, [bp+arg_4]
		and	cl, 3
		or	al, cl
		mov	es:[bx+10h], al
		mov	word_490A0, 0
		pop	bp
		retf	6
sub_1B79E	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	word_490A0, 0
		mov	ax, word_47320
		mov	dx, word_47322
		retf
; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		push	word_47326
		push	word_47324
		call	sub_1C4C8
		retf
; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		push	word_4731E
		push	word_4731C
		call	sub_1C4C8
		retf
; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		push	word_4732A
		push	word_47328
		call	sub_1C4C8
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B815	proc near		; CODE XREF: sub_1B209+Bp
					; sub_1B815+81p ...

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		mov	ax, word_47324
		or	ax, word_47326
		jz	short loc_1B851
		mov	ax, word_47324
		mov	dx, word_47326
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	word_47324, ax
		mov	word_47326, dx
		jmp	loc_1B8F5
; ---------------------------------------------------------------------------

loc_1B851:				; CODE XREF: sub_1B815+12j
		mov	ax, 384h
		push	ax
		call	sub_1BE24
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		or	dx, ax
		jnz	short loc_1B865
		jmp	loc_1B8ED
; ---------------------------------------------------------------------------

loc_1B865:				; CODE XREF: sub_1B815+4Bj
		mov	dx, [bp+var_E]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		add	ax, 384h
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		jmp	short loc_1B88B
; ---------------------------------------------------------------------------

loc_1B879:				; CODE XREF: sub_1B815+7Fj
		push	[bp+var_6]
		push	[bp+var_8]
		call	sub_1C4FA
		push	dx
		push	ax
		call	sub_1BB40
		add	[bp+var_8], 12h

loc_1B88B:				; CODE XREF: sub_1B815+62j
		mov	ax, [bp+var_14]
		mov	dx, [bp+var_12]
		cmp	[bp+var_8], ax
		jb	short loc_1B879
		call	sub_1B815
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		call	sub_1C4E0
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		les	bx, [bp+var_C]
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_E]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		les	bx, [bp+var_C]
		mov	byte ptr es:[bx+10h], 10h
		les	bx, [bp+var_C]
		mov	byte ptr es:[bx+11h], 0Fh
		les	bx, [bp+var_C]
		mov	word ptr es:[bx+4], 384h
		mov	word ptr es:[bx+6], 0
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1B938
		call	sub_1B815
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		jmp	short loc_1B8F5
; ---------------------------------------------------------------------------

loc_1B8ED:				; CODE XREF: sub_1B815+4Dj
		sub	ax, ax
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax

loc_1B8F5:				; CODE XREF: sub_1B815+39j
					; sub_1B815+D6j
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	sp, bp
		pop	bp
		retn
sub_1B815	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B8FF	proc near		; CODE XREF: sub_1AD72+49p
					; sub_1B209+8Ep ...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+4]
		or	ax, es:[bx+6]
		jnz	short loc_1B92B
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1BAC2
		jmp	short loc_1B934
; ---------------------------------------------------------------------------

loc_1B92B:				; CODE XREF: sub_1B8FF+1Fj
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1B938

loc_1B934:				; CODE XREF: sub_1B8FF+2Aj
		pop	bp
		retn	4
sub_1B8FF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1B938	proc near		; CODE XREF: sub_1B815+CAp
					; sub_1B8FF+32p

var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	di
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		mov	ax, word_47328
		or	ax, word_4732A
		jnz	short loc_1B98F
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_47330, ax
		mov	word_47332, dx
		mov	word_47328, ax
		mov	word_4732A, dx
		les	bx, [bp+var_10]
		mov	ax, es
		mov	si, bx
		sub	cx, cx
		sub	di, di
		mov	es:[si+0Ch], cx
		mov	es:[si+0Eh], di
		mov	es:[bx+8], cx
		mov	es:[bx+0Ah], di
		jmp	loc_1BABA
; ---------------------------------------------------------------------------

loc_1B98F:				; CODE XREF: sub_1B938+23j
		les	bx, [bp+var_10]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		mov	ax, word_47328
		mov	dx, word_4732A
		jmp	short loc_1B9EA
; ---------------------------------------------------------------------------

loc_1B9AB:				; CODE XREF: sub_1B938+11Ej
					; sub_1B938+126j
		les	bx, [bp+var_4]
		push	word ptr es:[bx+0Eh]
		push	word ptr es:[bx+0Ch]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx

loc_1B9CB:				; CODE XREF: sub_1B938+136j
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx
		jmp	loc_1BABA
; ---------------------------------------------------------------------------

loc_1B9DF:				; CODE XREF: sub_1B938+DEj
					; sub_1B938+E5j
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]

loc_1B9EA:				; CODE XREF: sub_1B938+71j
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		or	ax, dx
		jz	short loc_1BA71
		push	dx
		push	[bp+var_C]
		call	sub_1C4FA
		push	dx
		push	ax
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		cmp	dx, [bp+var_6]
		jb	short loc_1B9DF
		ja	short loc_1BA1F
		cmp	ax, [bp+var_8]
		jbe	short loc_1B9DF

loc_1BA1F:				; CODE XREF: sub_1B938+E0j
		les	bx, [bp+var_10]
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		les	bx, [bp+var_10]
		mov	ax, es
		les	si, [bp+var_4]
		mov	cx, es:[si+0Ch]
		mov	di, es:[si+0Eh]
		mov	es, ax
		mov	es:[bx+0Ch], cx
		mov	es:[bx+0Eh], di
		mov	ax, word_47328
		mov	dx, word_4732A
		cmp	[bp+var_C], ax
		jz	short loc_1BA59
		jmp	loc_1B9AB
; ---------------------------------------------------------------------------

loc_1BA59:				; CODE XREF: sub_1B938+11Cj
		cmp	[bp+var_A], dx
		jz	short loc_1BA61
		jmp	loc_1B9AB
; ---------------------------------------------------------------------------

loc_1BA61:				; CODE XREF: sub_1B938+124j
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_47328, ax
		mov	word_4732A, dx
		jmp	loc_1B9CB
; ---------------------------------------------------------------------------

loc_1BA71:				; CODE XREF: sub_1B938+BAj
		les	bx, [bp+var_10]
		sub	ax, ax
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], ax
		les	bx, [bp+var_10]
		mov	ax, word_47330
		mov	dx, word_47332
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx
		push	word_47332
		push	word_47330
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_47330, ax
		mov	word_47332, dx

loc_1BABA:				; CODE XREF: sub_1B938+54j
					; sub_1B938+A4j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	4
sub_1B938	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BAC2	proc near		; CODE XREF: sub_1B8FF+27p
					; sub_1BDE2+19p

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, word_4731C
		mov	dx, word_4731E
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], ax
		mov	ax, word_4731C
		or	ax, word_4731E
		jz	short loc_1BB21
		push	word_4731E
		push	word_4731C
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx

loc_1BB21:				; CODE XREF: sub_1BAC2+40j
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_4731C, ax
		mov	word_4731E, dx
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		mov	sp, bp
		pop	bp
		retn	4
sub_1BAC2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BB40	proc near		; CODE XREF: sub_1AEAD+32p
					; sub_1B209+40p ...

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, word_47324
		mov	dx, word_47326
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_47324, ax
		mov	word_47326, dx
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		mov	sp, bp
		pop	bp
		retn	4
sub_1BB40	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BB8B	proc near		; CODE XREF: sub_1AEAD+29p
					; sub_1B551+E8p ...

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	di
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, word_47328
		mov	dx, word_4732A
		cmp	[bp+arg_0], ax
		jnz	short loc_1BBEA
		cmp	[bp+arg_2], dx
		jnz	short loc_1BBEA
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	word_47328, ax
		mov	word_4732A, dx
		or	ax, dx
		jnz	short loc_1BBD1
		jmp	loc_1BC7B
; ---------------------------------------------------------------------------

loc_1BBD1:				; CODE XREF: sub_1BB8B+41j
		push	dx
		push	word_47328
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		sub	ax, ax
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], ax
		jmp	loc_1BC7B
; ---------------------------------------------------------------------------

loc_1BBEA:				; CODE XREF: sub_1BB8B+26j
					; sub_1BB8B+2Bj
		mov	ax, word_47330
		mov	dx, word_47332
		cmp	[bp+arg_0], ax
		jnz	short loc_1BC29
		cmp	[bp+arg_2], dx
		jnz	short loc_1BC29
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	word_47330, ax
		mov	word_47332, dx
		or	ax, dx
		jz	short loc_1BC7B
		push	dx
		push	word_47330
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		sub	ax, ax
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], ax
		jmp	short loc_1BC7B
; ---------------------------------------------------------------------------

loc_1BC29:				; CODE XREF: sub_1BB8B+69j
					; sub_1BB8B+6Ej
		les	bx, [bp+var_4]
		push	word ptr es:[bx+0Eh]
		push	word ptr es:[bx+0Ch]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es
		les	si, [bp+var_4]
		mov	cx, es:[si+8]
		mov	di, es:[si+0Ah]
		mov	es, ax
		mov	es:[bx+8], cx
		mov	es:[bx+0Ah], di
		les	bx, [bp+var_4]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es
		les	si, [bp+var_4]
		mov	cx, es:[si+0Ch]
		mov	di, es:[si+0Eh]
		mov	es, ax
		mov	es:[bx+0Ch], cx
		mov	es:[bx+0Eh], di

loc_1BC7B:				; CODE XREF: sub_1BB8B+43j
					; sub_1BB8B+5Cj ...
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	4
sub_1BB8B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BC83	proc near		; CODE XREF: sub_1AEAD+50p
					; sub_1B40E+66p ...

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	di
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, word_4731C
		mov	dx, word_4731E
		cmp	[bp+arg_0], ax
		jnz	short loc_1BCDE
		cmp	[bp+arg_2], dx
		jnz	short loc_1BCDE
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		mov	word_4731C, ax
		mov	word_4731E, dx
		or	ax, dx
		jz	short loc_1BD3A
		push	dx
		push	word_4731C
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		sub	ax, ax
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], ax
		jmp	short loc_1BD3A
; ---------------------------------------------------------------------------

loc_1BCDE:				; CODE XREF: sub_1BC83+26j
					; sub_1BC83+2Bj
		les	bx, [bp+var_4]
		push	word ptr es:[bx+0Eh]
		push	word ptr es:[bx+0Ch]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es
		les	si, [bp+var_4]
		mov	cx, es:[si+8]
		mov	di, es:[si+0Ah]
		mov	es, ax
		mov	es:[bx+8], cx
		mov	es:[bx+0Ah], di
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		or	ax, es:[bx+0Ah]
		jz	short loc_1BD3A
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es
		les	si, [bp+var_4]
		mov	cx, es:[si+0Ch]
		mov	di, es:[si+0Eh]
		mov	es, ax
		mov	es:[bx+0Ch], cx
		mov	es:[bx+0Eh], di

loc_1BD3A:				; CODE XREF: sub_1BC83+41j
					; sub_1BC83+59j ...
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	4
sub_1BC83	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BD42	proc near		; CODE XREF: sub_1AEAD+1Cp
					; sub_1B34B+41p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, word_47328
		mov	dx, word_4732A
		jmp	short loc_1BD6B
; ---------------------------------------------------------------------------

loc_1BD56:				; CODE XREF: sub_1BD42+3Cj
					; sub_1BD42+41j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]

loc_1BD6B:				; CODE XREF: sub_1BD42+12j
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	ax, dx
		jz	short loc_1BD8A
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[bp+var_4], ax
		jnz	short loc_1BD56
		cmp	[bp+var_2], dx
		jnz	short loc_1BD56
		mov	ax, 1
		jmp	short loc_1BD8C
; ---------------------------------------------------------------------------

loc_1BD8A:				; CODE XREF: sub_1BD42+31j
		sub	ax, ax

loc_1BD8C:				; CODE XREF: sub_1BD42+46j
		mov	sp, bp
		pop	bp
		retn	4
sub_1BD42	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BD92	proc near		; CODE XREF: sub_1AEAD+43p
					; sub_1B40E+32p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, word_4731C
		mov	dx, word_4731E
		jmp	short loc_1BDBB
; ---------------------------------------------------------------------------

loc_1BDA6:				; CODE XREF: sub_1BD92+3Cj
					; sub_1BD92+41j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]

loc_1BDBB:				; CODE XREF: sub_1BD92+12j
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	ax, dx
		jz	short loc_1BDDA
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[bp+var_4], ax
		jnz	short loc_1BDA6
		cmp	[bp+var_2], dx
		jnz	short loc_1BDA6
		mov	ax, 1
		jmp	short loc_1BDDC
; ---------------------------------------------------------------------------

loc_1BDDA:				; CODE XREF: sub_1BD92+31j
		sub	ax, ax

loc_1BDDC:				; CODE XREF: sub_1BD92+46j
		mov	sp, bp
		pop	bp
		retn	4
sub_1BD92	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BDE2	proc near		; CODE XREF: sub_1B2AF+44p
					; sub_1B34B+4Ep ...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1BB8B
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1BAC2
		pop	bp
		retn	4
sub_1BDE2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BE02	proc near		; CODE XREF: sub_1B209+2Dp
					; sub_1B40E+47p ...

arg_0		= byte ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		test	[bp+arg_0], 70h
		jz	short loc_1BE1A
		push	[bp+arg_2]
		call	sub_1BE24
		jmp	short loc_1BE20
; ---------------------------------------------------------------------------

loc_1BE1A:				; CODE XREF: sub_1BE02+Ej
		push	[bp+arg_2]
		call	sub_1C060

loc_1BE20:				; CODE XREF: sub_1BE02+16j
		pop	bp
		retn	4
sub_1BE02	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BE24	proc near		; CODE XREF: sub_1B815+40p
					; sub_1BE02+13p

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	[bp+arg_0]
		call	sub_1BE6D
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jz	short loc_1BE47

loc_1BE3F:				; CODE XREF: sub_1BE24+39j
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		jmp	short loc_1BE67
; ---------------------------------------------------------------------------

loc_1BE47:				; CODE XREF: sub_1BE24+19j
		mov	[bp+var_6], 2

loc_1BE4C:				; CODE XREF: sub_1BE24+3Ej
		push	[bp+arg_0]
		push	[bp+var_6]
		call	sub_1BF28
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jnz	short loc_1BE3F
		dec	[bp+var_6]
		jnz	short loc_1BE4C
		sub	ax, ax
		cwd

loc_1BE67:				; CODE XREF: sub_1BE24+21j
		mov	sp, bp
		pop	bp
		retn	2
sub_1BE24	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BE6D	proc near		; CODE XREF: sub_1BE24+Ep

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		mov	ax, word_4732C
		mov	dx, word_4732E
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	word_4732A
		push	word_47328
		jmp	short loc_1BEB6
; ---------------------------------------------------------------------------

loc_1BE8F:				; CODE XREF: sub_1BE6D+7Dj
					; sub_1BE6D+83j
		les	bx, [bp+var_C]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	ax, [bp+var_8]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_6]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]

loc_1BEB6:				; CODE XREF: sub_1BE6D+20j
		call	sub_1C4E0
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		or	ax, dx
		jz	short loc_1BEFD
		les	bx, [bp+var_C]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	[bp+var_4]
		push	dx
		push	ax
		call	__aFahdiff
		mov	cx, [bp+arg_0]
		sub	bx, bx
		cmp	dx, bx
		jl	short loc_1BE8F
		jg	short loc_1BEF2
		cmp	ax, cx
		jb	short loc_1BE8F

loc_1BEF2:				; CODE XREF: sub_1BE6D+7Fj
					; sub_1BE6D+ACj ...
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C4C8
		jmp	short loc_1BF22
; ---------------------------------------------------------------------------

loc_1BEFD:				; CODE XREF: sub_1BE6D+54j
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_472F2
		push	word_472F0
		call	__aFahdiff
		mov	cx, [bp+arg_0]
		sub	bx, bx
		cmp	dx, bx
		jl	short loc_1BF1F
		jg	short loc_1BEF2
		cmp	ax, cx
		jnb	short loc_1BEF2

loc_1BF1F:				; CODE XREF: sub_1BE6D+AAj
		sub	ax, ax
		cwd

loc_1BF22:				; CODE XREF: sub_1BE6D+8Ej
		mov	sp, bp
		pop	bp
		retn	2
sub_1BE6D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1BF28	proc near		; CODE XREF: sub_1BE24+2Ep

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		mov	ax, word_4732C
		mov	dx, word_4732E
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_16], ax
		mov	[bp+var_18], ax
		mov	[bp+var_A], ax
		mov	[bp+var_C], ax
		mov	ax, word_47328
		mov	dx, word_4732A
		jmp	short loc_1BFB4
; ---------------------------------------------------------------------------

loc_1BF57:				; CODE XREF: sub_1BF28+D2j
					; sub_1BF28+DBj
		les	bx, [bp+var_14]
		test	byte ptr es:[bx+10h], 0F0h
		jz	short loc_1BF93
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	ax, [bp+var_8]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_6]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_A], ax
		mov	[bp+var_C], ax
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_E]
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		jmp	short loc_1BFAC
; ---------------------------------------------------------------------------

loc_1BF93:				; CODE XREF: sub_1BF28+37j
		mov	al, es:[bx+10h]
		and	al, 3
		cmp	al, byte ptr [bp+arg_0]
		jnb	short loc_1BFAC
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	[bp+var_C], ax
		adc	[bp+var_A], dx

loc_1BFAC:				; CODE XREF: sub_1BF28+69j
					; sub_1BF28+74j
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]

loc_1BFB4:				; CODE XREF: sub_1BF28+2Dj
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		or	ax, dx
		jz	short loc_1C023
		push	dx
		push	[bp+var_10]
		call	sub_1C4E0
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		les	bx, [bp+var_14]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	[bp+var_4]
		push	dx
		push	ax
		call	__aFahdiff
		sub	ax, [bp+var_C]
		sbb	dx, [bp+var_A]
		mov	cx, [bp+arg_2]
		sub	bx, bx
		cmp	dx, bx
		jnb	short loc_1BFFD
		jmp	loc_1BF57
; ---------------------------------------------------------------------------

loc_1BFFD:				; CODE XREF: sub_1BF28+D0j
		ja	short loc_1C006
		cmp	ax, cx
		jnb	short loc_1C006
		jmp	loc_1BF57
; ---------------------------------------------------------------------------

loc_1C006:				; CODE XREF: sub_1BF28:loc_1BFFDj
					; sub_1BF28+D9j
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_E]
		push	[bp+var_10]

loc_1C012:				; CODE XREF: sub_1BF28+12Dj
		push	[bp+arg_0]
		call	sub_1C2D0
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_1C4C8
		jmp	short loc_1C05A
; ---------------------------------------------------------------------------

loc_1C023:				; CODE XREF: sub_1BF28+94j
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_472F2
		push	word_472F0
		call	__aFahdiff
		sub	ax, [bp+var_C]
		sbb	dx, [bp+var_A]
		mov	cx, [bp+arg_2]
		sub	bx, bx
		cmp	dx, bx
		jb	short loc_1C057
		ja	short loc_1C04B
		cmp	ax, cx
		jb	short loc_1C057

loc_1C04B:				; CODE XREF: sub_1BF28+11Dj
		push	[bp+var_16]
		push	[bp+var_18]
		sub	ax, ax
		push	ax
		push	ax
		jmp	short loc_1C012
; ---------------------------------------------------------------------------

loc_1C057:				; CODE XREF: sub_1BF28+11Bj
					; sub_1BF28+121j
		sub	ax, ax
		cwd

loc_1C05A:				; CODE XREF: sub_1BF28+F9j
		mov	sp, bp
		pop	bp
		retn	4
sub_1BF28	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C060	proc near		; CODE XREF: sub_1BE02+1Bp

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	[bp+arg_0]
		call	sub_1C0A9
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jz	short loc_1C083

loc_1C07B:				; CODE XREF: sub_1C060+39j
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		jmp	short loc_1C0A3
; ---------------------------------------------------------------------------

loc_1C083:				; CODE XREF: sub_1C060+19j
		mov	[bp+var_6], 2

loc_1C088:				; CODE XREF: sub_1C060+3Ej
		push	[bp+arg_0]
		push	[bp+var_6]
		call	sub_1C173
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, ax
		jnz	short loc_1C07B
		dec	[bp+var_6]
		jnz	short loc_1C088
		sub	ax, ax
		cwd

loc_1C0A3:				; CODE XREF: sub_1C060+21j
		mov	sp, bp
		pop	bp
		retn	2
sub_1C060	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C0A9	proc near		; CODE XREF: sub_1C060+Ep

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		mov	ax, word_472F0
		mov	dx, word_472F2
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	word_47332
		push	word_47330
		jmp	short loc_1C0E2
; ---------------------------------------------------------------------------

loc_1C0CB:				; CODE XREF: sub_1C0A9+78j
					; sub_1C0A9+7Ej
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		les	bx, [bp+var_C]
		push	word ptr es:[bx+0Eh]
		push	word ptr es:[bx+0Ch]

loc_1C0E2:				; CODE XREF: sub_1C0A9+20j
		call	sub_1C4E0
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		or	ax, dx
		jz	short loc_1C148
		les	bx, [bp+var_C]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	dx
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		call	__aFahdiff
		les	bx, [bp+var_C]
		sub	ax, es:[bx+4]
		sbb	dx, es:[bx+6]
		mov	cx, [bp+arg_0]
		sub	bx, bx
		cmp	dx, bx
		jl	short loc_1C0CB
		jg	short loc_1C129
		cmp	ax, cx
		jb	short loc_1C0CB

loc_1C129:				; CODE XREF: sub_1C0A9+7Aj
					; sub_1C0A9+BBj ...
		mov	ax, [bp+arg_0]
		sub	dx, dx
		neg	ax
		adc	dx, dx
		neg	dx
		add	ax, [bp+var_4]
		adc	dx, bx
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	sub_1C4C8
		jmp	short loc_1C16D
; ---------------------------------------------------------------------------

loc_1C148:				; CODE XREF: sub_1C0A9+44j
		push	word_4732E
		push	word_4732C
		push	[bp+var_2]
		push	[bp+var_4]
		call	__aFahdiff
		mov	cx, [bp+arg_0]
		sub	bx, bx
		cmp	dx, bx
		jl	short loc_1C16A
		jg	short loc_1C129
		cmp	ax, cx
		jnb	short loc_1C129

loc_1C16A:				; CODE XREF: sub_1C0A9+B9j
		sub	ax, ax
		cwd

loc_1C16D:				; CODE XREF: sub_1C0A9+9Dj
		mov	sp, bp
		pop	bp
		retn	2
sub_1C0A9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C173	proc near		; CODE XREF: sub_1C060+2Ep

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		mov	ax, word_472F0
		mov	dx, word_472F2
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_16], ax
		mov	[bp+var_18], ax
		mov	[bp+var_A], ax
		mov	[bp+var_C], ax
		mov	ax, word_47330
		mov	dx, word_47332
		jmp	short loc_1C1EF
; ---------------------------------------------------------------------------

loc_1C1A2:				; CODE XREF: sub_1C173+D0j
					; sub_1C173+D9j
		les	bx, [bp+var_14]
		test	byte ptr es:[bx+10h], 0F0h
		jz	short loc_1C1CE
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		sub	ax, ax
		mov	[bp+var_A], ax
		mov	[bp+var_C], ax
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_E]
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		jmp	short loc_1C1E7
; ---------------------------------------------------------------------------

loc_1C1CE:				; CODE XREF: sub_1C173+37j
		mov	al, es:[bx+10h]
		and	al, 3
		cmp	al, byte ptr [bp+arg_0]
		jnb	short loc_1C1E7
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	[bp+var_C], ax
		adc	[bp+var_A], dx

loc_1C1E7:				; CODE XREF: sub_1C173+59j
					; sub_1C173+64j
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]

loc_1C1EF:				; CODE XREF: sub_1C173+2Dj
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		or	ax, dx
		jnz	short loc_1C1FC
		jmp	loc_1C288
; ---------------------------------------------------------------------------

loc_1C1FC:				; CODE XREF: sub_1C173+84j
		push	dx
		push	[bp+var_10]
		call	sub_1C4E0
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		les	bx, [bp+var_14]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		push	dx
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		call	__aFahdiff
		les	bx, [bp+var_14]
		sub	ax, es:[bx+4]
		sbb	dx, es:[bx+6]
		sub	ax, [bp+var_C]
		sbb	dx, [bp+var_A]
		mov	cx, [bp+arg_2]
		sub	bx, bx
		cmp	dx, bx
		jnb	short loc_1C246
		jmp	loc_1C1A2
; ---------------------------------------------------------------------------

loc_1C246:				; CODE XREF: sub_1C173+CEj
		ja	short loc_1C24F
		cmp	ax, cx
		jnb	short loc_1C24F
		jmp	loc_1C1A2
; ---------------------------------------------------------------------------

loc_1C24F:				; CODE XREF: sub_1C173:loc_1C246j
					; sub_1C173+D7j
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+arg_0]
		call	sub_1C2D0
		mov	ax, [bp+arg_2]
		sub	dx, dx
		add	ax, [bp+var_C]
		adc	dx, [bp+var_A]

loc_1C26C:				; CODE XREF: sub_1C173+152j
		neg	ax
		adc	dx, 0
		neg	dx
		add	ax, [bp+var_4]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_2]
		push	dx
		push	ax
		call	sub_1C4C8
		jmp	short loc_1C2CA
; ---------------------------------------------------------------------------

loc_1C288:				; CODE XREF: sub_1C173+86j
		push	word_4732E
		push	word_4732C
		push	[bp+var_2]
		push	[bp+var_4]
		call	__aFahdiff
		sub	ax, [bp+var_C]
		sbb	dx, [bp+var_A]
		mov	cx, [bp+arg_2]
		sub	bx, bx
		cmp	dx, bx
		jb	short loc_1C2C7
		ja	short loc_1C2B0
		cmp	ax, cx
		jb	short loc_1C2C7

loc_1C2B0:				; CODE XREF: sub_1C173+137j
		sub	ax, ax
		push	ax
		push	ax
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+arg_0]
		call	sub_1C2D0
		mov	ax, [bp+arg_2]
		sub	dx, dx
		jmp	short loc_1C26C
; ---------------------------------------------------------------------------

loc_1C2C7:				; CODE XREF: sub_1C173+135j
					; sub_1C173+13Bj
		sub	ax, ax
		cwd

loc_1C2CA:				; CODE XREF: sub_1C173+113j
		mov	sp, bp
		pop	bp
		retn	4
sub_1C173	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C2D0	proc near		; CODE XREF: sub_1AE92+11p
					; sub_1B551+179p ...

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= byte ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 1Ch
		call	__chkstk
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		cmp	[bp+arg_2], ax
		jnz	short loc_1C2EE
		cmp	[bp+arg_4], dx
		jnz	short loc_1C2EE
		jmp	loc_1C44A
; ---------------------------------------------------------------------------

loc_1C2EE:				; CODE XREF: sub_1C2D0+14j
					; sub_1C2D0+19j
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jz	short loc_1C325
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		jmp	short loc_1C339
; ---------------------------------------------------------------------------

loc_1C325:				; CODE XREF: sub_1C2D0+24j
		mov	ax, word_472F0
		mov	dx, word_472F2
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		mov	ax, word_47330
		mov	dx, word_47332

loc_1C339:				; CODE XREF: sub_1C2D0+53j
		mov	[bp+arg_2], ax
		mov	[bp+arg_4], dx
		jmp	loc_1C3EF
; ---------------------------------------------------------------------------

loc_1C342:				; CODE XREF: sub_1C2D0+16Fj
		les	bx, [bp+var_18]
		mov	al, es:[bx+10h]
		and	al, 3
		cmp	al, [bp+arg_0]
		jb	short loc_1C35C
		push	[bp+var_12]
		push	[bp+var_14]
		call	sub_1BDE2
		jmp	loc_1C3E9
; ---------------------------------------------------------------------------

loc_1C35C:				; CODE XREF: sub_1C2D0+7Ej
		les	bx, [bp+var_18]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		add	ax, [bp+var_8]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+var_6]
		cmp	dx, [bp+var_E]
		ja	short loc_1C3D6
		jb	short loc_1C381
		cmp	ax, [bp+var_10]
		jnb	short loc_1C3D6

loc_1C381:				; CODE XREF: sub_1C2D0+AAj
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+6]
		neg	ax
		adc	dx, 0
		neg	dx
		sub	bx, bx
		mov	cx, ax
		add	[bp+var_10], cx
		adc	bx, dx
		mov	cx, 0Ch
		shl	bx, cl
		add	[bp+var_E], bx
		push	[bp+var_E]
		push	[bp+var_10]
		call	sub_1C4C8
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		les	bx, [bp+var_18]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		push	dx
		push	ax		; void *
		push	word ptr es:[bx+4] ; size_t
		push	cs
		call	near ptr sub_1AE31
		les	bx, [bp+var_18]
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		jmp	short loc_1C3E9
; ---------------------------------------------------------------------------

loc_1C3D6:				; CODE XREF: sub_1C2D0+A8j
					; sub_1C2D0+AFj
		les	bx, [bp+var_18]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA

loc_1C3E3:				; CODE XREF: sub_1C2D0+178j
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx

loc_1C3E9:				; CODE XREF: sub_1C2D0+89j
					; sub_1C2D0+104j
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_1C3EF:				; CODE XREF: sub_1C2D0+6Fj
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		cmp	[bp+var_14], ax
		jnz	short loc_1C405
		cmp	[bp+var_12], dx
		jz	short loc_1C44A

loc_1C405:				; CODE XREF: sub_1C2D0+12Ej
		push	[bp+var_12]
		push	[bp+var_14]
		call	sub_1C4E0
		mov	word ptr [bp+var_18], ax
		mov	word ptr [bp+var_18+2],	dx
		les	bx, [bp+var_18]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		les	bx, [bp+var_18]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		test	byte ptr es:[bx+10h], 0F0h
		jnz	short loc_1C442
		jmp	loc_1C342
; ---------------------------------------------------------------------------

loc_1C442:				; CODE XREF: sub_1C2D0+16Dj
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		jmp	short loc_1C3E3
; ---------------------------------------------------------------------------

loc_1C44A:				; CODE XREF: sub_1C2D0+1Bj
					; sub_1C2D0+133j
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_1C2D0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C450	proc near		; CODE XREF: sub_1B551+B7p
					; sub_1B551+F4p ...

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1C4E0
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		or	ax, es:[bx+0Ah]
		jz	short loc_1C4A8
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		push	dx
		push	ax
		les	bx, [bp+var_4]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		call	sub_1C4E0
		mov	bx, ax
		mov	es, dx
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		push	dx
		push	ax

loc_1C4A1:				; CODE XREF: sub_1C450+6Fj
		call	__aFahdiff
		jmp	short loc_1C4C1
; ---------------------------------------------------------------------------

loc_1C4A8:				; CODE XREF: sub_1C450+25j
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1C4FA
		push	dx
		push	ax
		push	word_472F2
		push	word_472F0
		jmp	short loc_1C4A1
; ---------------------------------------------------------------------------

loc_1C4C1:				; CODE XREF: sub_1C450+56j
		mov	sp, bp
		pop	bp
		retn	4
sub_1C450	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C4C8	proc near		; CODE XREF: sub_1A746+1A8p
					; sub_1AD72+10p ...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		mov	bx, ax
		mov	cl, 4
		shr	bx, cl
		add	dx, bx
		and	ax, 0Fh
		pop	bp
		retn	4
sub_1C4C8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C4E0	proc near		; CODE XREF: sub_1A9B3+31p
					; sub_1A9B3:loc_1AC18p	...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		cmp	ax, 0FFF0h
		jnb	short loc_1C4F2
		pop	bp
		retn	4
; ---------------------------------------------------------------------------

loc_1C4F2:				; CODE XREF: sub_1C4E0+Cj
		sub	ax, 10h
		inc	dx
		pop	bp
		retn	4
sub_1C4E0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C4FA	proc near		; CODE XREF: sub_1A746+62p
					; sub_1A746+19Dp ...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		mov	bx, dx
		mov	cl, 4
		shl	bx, cl
		and	dx, 0F000h
		add	ax, bx
		jb	short loc_1C515
		pop	bp
		retn	4
; ---------------------------------------------------------------------------

loc_1C515:				; CODE XREF: sub_1C4FA+15j
		add	dx, 1000h
		pop	bp
		retn	4
sub_1C4FA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C51D	proc far		; CODE XREF: sub_13524+C3p
					; sub_1632A+14Fp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		xor	ax, ax
		push	ax
		mov	ax, [bp+2]
		sub	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_1A9B3
		mov	sp, bp
		pop	bp
		retf	4
sub_1C51D	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C53C	proc far		; CODE XREF: sub_23F23+B3P

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, 125Ah
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], ds
		mov	ax, 128Ah
		mov	[bp+var_4], ax
		mov	[bp+var_2], ds
		jmp	short loc_1C57C
; ---------------------------------------------------------------------------

loc_1C55B:				; CODE XREF: sub_1C53C+49j
		les	bx, [bp+var_8]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1DD8F
		push	dx
		push	ax
		les	bx, [bp+var_8]
		push	word ptr es:[bx+4]
		nop
		push	cs
		call	near ptr sub_1D5C5
		add	word ptr [bp+var_8], 6

loc_1C57C:				; CODE XREF: sub_1C53C+1Dj
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	word ptr [bp+var_8], ax
		jb	short loc_1C55B
		nop
		push	cs
		call	near ptr sub_1D2AA
		mov	word_4878C, ax
		mov	word_42228, ax
		mov	ax, 125Ah
		push	ds
		push	ax
		mov	ax, 30h	; '0'
		cwd
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1A9B3
		mov	ax, 0C53Ch
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		mov	sp, bp
		pop	bp
		retf
sub_1C53C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C5B3	proc far		; CODE XREF: sub_10167+105p

var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	al, [bp+arg_0]
		sub	ah, ah
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		cmp	ax, 4
		jnz	short loc_1C5D1
		jmp	loc_1C7BE
; ---------------------------------------------------------------------------

loc_1C5D1:				; CODE XREF: sub_1C5B3+19j
		jle	short loc_1C5D6
		jmp	loc_1C873
; ---------------------------------------------------------------------------

loc_1C5D6:				; CODE XREF: sub_1C5B3:loc_1C5D1j
		cmp	ax, 1
		jz	short loc_1C5EB
		cmp	ax, 2
		jz	short loc_1C617
		cmp	ax, 3
		jnz	short loc_1C5E8
		jmp	loc_1C69F
; ---------------------------------------------------------------------------

loc_1C5E8:				; CODE XREF: sub_1C5B3+30j
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C5EB:				; CODE XREF: sub_1C5B3+26j
		mov	ax, [bp+var_2]
		or	ax, ax
		jz	short loc_1C5FF
		cmp	ax, 1
		jz	short loc_1C607
		cmp	ax, 2
		jz	short loc_1C60F
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C5FF:				; CODE XREF: sub_1C5B3+3Dj
		call	sub_24E21
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C607:				; CODE XREF: sub_1C5B3+42j
		call	sub_256C0
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C60F:				; CODE XREF: sub_1C5B3+47j
		call	sub_25ACE
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C617:				; CODE XREF: sub_1C5B3+2Bj
		mov	ax, [bp+var_2]
		cmp	ax, 0Ah
		jbe	short loc_1C622
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C622:				; CODE XREF: sub_1C5B3+6Aj
		add	ax, ax
		xchg	ax, bx
		jmp	word ptr cs:[bx-397Ah]
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		push	cs
		call	near ptr sub_17F89
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		push	cs
		call	near ptr sub_17E89
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		sub	ax, ax
		push	ax
		mov	ax, 8FF1h
		mov	dx, seg	seg000
		push	dx
		push	ax
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_18DDC
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		align 2
		push	cs
		call	near ptr sub_1FD8B
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		align 2
		push	cs
		call	near ptr sub_1A095
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		call	sub_28A28
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		call	sub_25C36
		cmp	ax, 1
		jz	short loc_1C676
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C676:				; CODE XREF: sub_1C5B3+BEj
		nop
		push	cs
		call	near ptr sub_1800D
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		push	cs
		call	near ptr sub_180E4
		jmp	loc_1C88D
; ---------------------------------------------------------------------------
		db 2Ah,	0C6h, 8Dh, 0C8h, 32h, 0C6h, 8Dh, 0C8h, 3Ah, 0C6h
		db 8Dh,	0C8h, 51h, 0C6h, 59h, 0C6h, 61h, 0C6h, 69h, 0C6h
		db 7Eh,	0C6h, 0E9h, 0EEh, 1
; ---------------------------------------------------------------------------

loc_1C69F:				; CODE XREF: sub_1C5B3+32j
		mov	ax, [bp+var_2]
		cmp	ax, 8
		jnz	short loc_1C6AA
		jmp	loc_1C752
; ---------------------------------------------------------------------------

loc_1C6AA:				; CODE XREF: sub_1C5B3+F2j
		jle	short loc_1C6AF
		jmp	loc_1C78E
; ---------------------------------------------------------------------------

loc_1C6AF:				; CODE XREF: sub_1C5B3:loc_1C6AAj
		or	ax, ax
		jz	short loc_1C6D2
		cmp	ax, 1
		jz	short loc_1C70C
		cmp	ax, 2
		jz	short loc_1C726
		cmp	ax, 3
		jz	short loc_1C731
		cmp	ax, 7
		jz	short loc_1C739
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C6CA:				; CODE XREF: sub_1C5B3+1E5j
		call	sub_2607A
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C6D2:				; CODE XREF: sub_1C5B3+FEj
		call	sub_2625F
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C6DA:				; CODE XREF: sub_1C5B3+1EDj
		call	sub_2628D
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C6E2:				; CODE XREF: sub_1C5B3+1F5j
		call	sub_26308
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C6EA:				; CODE XREF: sub_1C5B3+1FDj
		call	sub_26352
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C6F2:				; CODE XREF: sub_1C5B3+205j
		mov	ax, 128Ah
		push	ds
		push	ax
		call	sub_25149
		cmp	ax, 1
		jz	short loc_1C704
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C704:				; CODE XREF: sub_1C5B3+14Cj
		call	sub_2645E
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C70C:				; CODE XREF: sub_1C5B3+103j
		mov	ax, 1290h
		push	ds
		push	ax
		call	sub_25149
		cmp	ax, 1
		jz	short loc_1C71E
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C71E:				; CODE XREF: sub_1C5B3+166j
		call	sub_264D7
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C726:				; CODE XREF: sub_1C5B3+108j
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_16592
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C731:				; CODE XREF: sub_1C5B3+10Dj
		call	sub_24F8E
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C739:				; CODE XREF: sub_1C5B3+112j
		cmp	word_4E92C, 1
		sbb	ax, ax
		neg	ax
		mov	word_4E92C, ax
		push	ax
		mov	ax, 307h
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C752:				; CODE XREF: sub_1C5B3+F4j
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		cmp	[bx-5B54h], ax
		jnz	short loc_1C776
		cmp	[bx-5B52h], dx
		jnz	short loc_1C776
		call	sub_278A3
		or	ax, ax
		jz	short loc_1C77E

loc_1C776:				; CODE XREF: sub_1C5B3+1B2j
					; sub_1C5B3+1B8j
		call	sub_254CA
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C77E:				; CODE XREF: sub_1C5B3+1C1j
		call	sub_25213
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C786:				; CODE XREF: sub_1C5B3+1DEj
		call	sub_25834
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C78E:				; CODE XREF: sub_1C5B3+F9j
		cmp	ax, 9
		jz	short loc_1C786
		cmp	ax, 0FAh ; '�'
		jnz	short loc_1C79B
		jmp	loc_1C6CA
; ---------------------------------------------------------------------------

loc_1C79B:				; CODE XREF: sub_1C5B3+1E3j
		cmp	ax, 0FBh ; '�'
		jnz	short loc_1C7A3
		jmp	loc_1C6DA
; ---------------------------------------------------------------------------

loc_1C7A3:				; CODE XREF: sub_1C5B3+1EBj
		cmp	ax, 0FCh ; '�'
		jnz	short loc_1C7AB
		jmp	loc_1C6E2
; ---------------------------------------------------------------------------

loc_1C7AB:				; CODE XREF: sub_1C5B3+1F3j
		cmp	ax, 0FDh ; '�'
		jnz	short loc_1C7B3
		jmp	loc_1C6EA
; ---------------------------------------------------------------------------

loc_1C7B3:				; CODE XREF: sub_1C5B3+1FBj
		cmp	ax, 0FEh ; '�'
		jnz	short loc_1C7BB
		jmp	loc_1C6F2
; ---------------------------------------------------------------------------

loc_1C7BB:				; CODE XREF: sub_1C5B3+203j
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C7BE:				; CODE XREF: sub_1C5B3+1Bj
		mov	ax, [bp+var_2]
		cmp	ax, 0FFh
		jnz	short loc_1C7DF
		call	sub_2BACC
		mov	[bp+var_2], ax
		or	ax, ax
		jge	short loc_1C7D5
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C7D5:				; CODE XREF: sub_1C5B3+21Dj
		cmp	word_490B6, 0
		jnz	short loc_1C7DF
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C7DF:				; CODE XREF: sub_1C5B3+211j
					; sub_1C5B3+227j
		push	ax
		call	sub_24637
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C7E8:				; CODE XREF: sub_1C5B3+2CFj
		cmp	[bp+var_2], 0FFh
		jnz	short loc_1C7F7
		call	sub_26533
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C7F7:				; CODE XREF: sub_1C5B3+23Aj
		push	[bp+var_2]
		call	sub_247B6
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C802:				; CODE XREF: sub_1C5B3+2D7j
		push	[bp+var_2]
		call	sub_247E7
		jmp	loc_1C88D
; ---------------------------------------------------------------------------

loc_1C80D:				; CODE XREF: sub_1C5B3+2C3j
		mov	ax, [bp+var_2]
		cmp	ax, 0FEh ; '�'
		jz	short loc_1C829
		cmp	ax, 0FFh
		jz	short loc_1C822

loc_1C81A:				; CODE XREF: sub_1C5B3+279j
		push	ax
		call	sub_2B552
		jmp	short loc_1C88D
; ---------------------------------------------------------------------------

loc_1C822:				; CODE XREF: sub_1C5B3+265j
		call	sub_2B0C0
		jmp	short loc_1C88D
; ---------------------------------------------------------------------------

loc_1C829:				; CODE XREF: sub_1C5B3+260j
		mov	ax, 0FFFFh
		jmp	short loc_1C81A
; ---------------------------------------------------------------------------

loc_1C82E:				; CODE XREF: sub_1C5B3+2C8j
		mov	ax, [bp+var_2]
		cmp	ax, 0FCh ; '�'
		jz	short loc_1C867
		cmp	ax, 0FDh ; '�'
		jz	short loc_1C860
		cmp	ax, 0FEh ; '�'
		jz	short loc_1C86E
		cmp	ax, 0FFh
		jnz	short loc_1C858
		nop
		push	cs
		call	near ptr sub_1EF9A
		mov	[bp+var_2], ax
		or	ax, ax
		jl	short loc_1C88D
		cmp	word_490B6, 0
		jz	short loc_1C88D

loc_1C858:				; CODE XREF: sub_1C5B3+290j
					; sub_1C5B3+2BEj
		push	ax
		nop
		push	cs
		call	near ptr sub_1F3C7
		jmp	short loc_1C88D
; ---------------------------------------------------------------------------

loc_1C860:				; CODE XREF: sub_1C5B3+286j
		nop
		push	cs
		call	near ptr sub_1F4CD
		jmp	short loc_1C88D
; ---------------------------------------------------------------------------

loc_1C867:				; CODE XREF: sub_1C5B3+281j
		nop
		push	cs
		call	near ptr sub_1F56D
		jmp	short loc_1C88D
; ---------------------------------------------------------------------------

loc_1C86E:				; CODE XREF: sub_1C5B3+28Bj
		mov	ax, 0FFFFh
		jmp	short loc_1C858
; ---------------------------------------------------------------------------

loc_1C873:				; CODE XREF: sub_1C5B3+20j
		cmp	ax, 5
		jz	short loc_1C80D
		cmp	ax, 6
		jz	short loc_1C82E
		cmp	ax, 64h	; 'd'
		jnz	short loc_1C885
		jmp	loc_1C7E8
; ---------------------------------------------------------------------------

loc_1C885:				; CODE XREF: sub_1C5B3+2CDj
		cmp	ax, 6Eh	; 'n'
		jnz	short loc_1C88D
		jmp	loc_1C802
; ---------------------------------------------------------------------------

loc_1C88D:				; CODE XREF: sub_1C5B3:loc_1C5E8j
					; sub_1C5B3+49j ...
		mov	sp, bp
		pop	bp
		retf	4
sub_1C5B3	endp


; =============== S U B	R O U T	I N E =======================================


sub_1C893	proc far		; CODE XREF: sub_2625F+23P
		xor	ax, ax
		call	__chkstk
		mov	ax, 0FBh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		mov	ax, 0FCh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		mov	ax, 0FEh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		mov	ax, 301h
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		retf
sub_1C893	endp


; =============== S U B	R O U T	I N E =======================================


sub_1C8BF	proc far		; CODE XREF: sub_26818:loc_269F3P
		xor	ax, ax
		call	__chkstk
		mov	ax, 0FDh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		retf
sub_1C8BF	endp


; =============== S U B	R O U T	I N E =======================================


sub_1C8D0	proc near		; CODE XREF: sub_1C9A8+4Fp
		xor	ax, ax
		call	__chkstk
		mov	ax, 64FFh
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		mov	bx, word_4879A
		push	word ptr [bx+4]
		mov	ax, 64FFh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		mov	ax, 303h
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291
		mov	bx, word_4879A
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		cmp	ax, word_4B45F
		jnz	short locret_1C918
		mov	ax, 302h
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291

locret_1C918:				; CODE XREF: sub_1C8D0+3Dj
		retn
sub_1C8D0	endp


; =============== S U B	R O U T	I N E =======================================


sub_1C919	proc far		; CODE XREF: sub_181DF+3Ap
					; sub_2607A+108P ...
		xor	ax, ax
		call	__chkstk
		mov	ax, 0FBh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		mov	ax, 0FCh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		mov	ax, 0FEh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		mov	ax, 301h
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		retf
sub_1C919	endp


; =============== S U B	R O U T	I N E =======================================


sub_1C945	proc far		; CODE XREF: sub_26A01+79P
		xor	ax, ax
		call	__chkstk
		mov	ax, 0FDh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		retf
sub_1C945	endp


; =============== S U B	R O U T	I N E =======================================


sub_1C956	proc near		; CODE XREF: sub_1C9A8+7Ep
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		mov	ax, 64FFh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		mov	ax, 64FFh
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		mov	ax, 303h
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		mov	ax, 302h
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		retn
sub_1C956	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C985	proc far		; CODE XREF: sub_10167+1Bp
					; sub_10167+2Dp ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1C9A8
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1CCFD
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1CD6A
		pop	bp
		retf	2
sub_1C985	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1C9A8	proc far		; CODE XREF: sub_137E6+4A3p
					; sub_137E6+4B2p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_1CA03
		cmp	word_4879A, 0
		jz	short loc_1CA32
		mov	bx, word_4879A
		cmp	word ptr [bx+1Ch], 8
		jle	short loc_1C9CE
		mov	bx, 9
		jmp	short loc_1C9D5
; ---------------------------------------------------------------------------

loc_1C9CE:				; CODE XREF: sub_1C9A8+1Fj
		mov	bx, word_4879A
		mov	bx, [bx+1Ch]

loc_1C9D5:				; CODE XREF: sub_1C9A8+24j
		mov	al, [bx+1296h]
		cbw
		push	ax
		mov	bx, word_4879A
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		add	ah, 4
		push	ax
		nop
		push	cs
		call	near ptr sub_1E0A0
		call	sub_1CA36
		call	sub_1C8D0
		mov	ax, 1
		push	ax
		call	sub_1CCB1
		jmp	short loc_1CA32
; ---------------------------------------------------------------------------

loc_1CA03:				; CODE XREF: sub_1C9A8+Ej
		cmp	word_4879A, 0
		jz	short loc_1CA32
		sub	ax, ax
		push	ax
		mov	bx, word_4879A
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		add	ah, 4
		push	ax
		nop
		push	cs
		call	near ptr sub_1E0A0
		call	sub_1C956
		sub	ax, ax
		push	ax
		call	sub_1CCB1
		call	sub_1CBDD

loc_1CA32:				; CODE XREF: sub_1C9A8+15j
					; sub_1C9A8+59j ...
		pop	bp
		retf	2
sub_1C9A8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CA36	proc near		; CODE XREF: sub_1C9A8+4Cp

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		mov	bx, word_4879A
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		cmp	ax, word_4B45F
		jz	short loc_1CAA7
		mov	bx, [bx+16h]
		mov	ax, [bx+3Ch]
		mov	dx, [bx+3Eh]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	[bp+var_4], 0
		jmp	short loc_1CA93
; ---------------------------------------------------------------------------

loc_1CA6E:				; CODE XREF: sub_1CA36:loc_1CAA5j
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D61D
		les	di, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		add	word ptr [bp+var_8], cx
		inc	[bp+var_4]

loc_1CA93:				; CODE XREF: sub_1CA36+36j
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bp+var_4]
		cmp	[bx+3Ah], ax
		jg	short loc_1CAA5
		jmp	loc_1CB67
; ---------------------------------------------------------------------------

loc_1CAA5:				; CODE XREF: sub_1CA36+6Aj
		jmp	short loc_1CA6E
; ---------------------------------------------------------------------------

loc_1CAA7:				; CODE XREF: sub_1CA36+20j
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bx+3Ah]
		mov	bx, word_4879A
		sub	ax, [bx+1Ch]
		dec	ax
		cwd
		mov	cx, 5
		idiv	cx
		imul	cx
		add	ax, [bx+1Ch]
		mov	[bp+var_2], ax
		or	ax, ax
		jl	short loc_1CAEA
		mov	ax, 26h	; '&'
		imul	[bp+var_2]
		add	ax, 77D2h
		mov	[bp+var_A], ax

loc_1CAD7:				; CODE XREF: sub_1CA36+B2j
		mov	bx, [bp+var_A]
		cmp	word ptr [bx], 0
		jnz	short loc_1CAEA
		sub	[bp+var_A], 0BEh ; '�'
		sub	[bp+var_2], 5
		jns	short loc_1CAD7

loc_1CAEA:				; CODE XREF: sub_1CA36+93j
					; sub_1CA36+A7j
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bp+var_2]
		add	ax, 5
		cmp	[bx+3Ah], ax
		jle	short loc_1CB00
		add	[bp+var_2], 5

loc_1CB00:				; CODE XREF: sub_1CA36+C4j
		mov	bx, word_4879A
		mov	ax, [bp+var_2]
		cmp	[bx+0Ch], ax
		jle	short loc_1CB12
		mov	ax, [bx+0Ch]
		mov	[bp+var_2], ax

loc_1CB12:				; CODE XREF: sub_1CA36+D4j
		mov	bx, [bx+16h]
		mov	ax, [bx+3Ch]
		mov	dx, [bx+3Eh]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	[bp+var_4], 0
		jmp	short loc_1CB5F
; ---------------------------------------------------------------------------

loc_1CB28:				; CODE XREF: sub_1CA36+12Fj
		mov	ax, [bp+var_4]
		cwd
		mov	cx, 5
		idiv	cx
		mov	bx, word_4879A
		cmp	dx, [bx+1Ch]
		jnz	short loc_1CB4D
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D61D

loc_1CB4D:				; CODE XREF: sub_1CA36+102j
		les	di, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		add	word ptr [bp+var_8], cx
		inc	[bp+var_4]	; CODE XREF: seg000:053Dj

loc_1CB5F:				; CODE XREF: sub_1CA36+F0j
		mov	ax, [bp+var_2]
		cmp	[bp+var_4], ax
		jle	short loc_1CB28

loc_1CB67:				; CODE XREF: sub_1CA36+6Cj
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bx+42h]
		mov	dx, [bx+44h]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		mov	[bp+var_4], 0
		jmp	short loc_1CBA6
; ---------------------------------------------------------------------------

loc_1CB81:				; CODE XREF: sub_1CA36+17Dj
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 6Eh	; 'n'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D61D
		les	di, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		add	word ptr [bp+var_8], cx
		inc	[bp+var_4]

loc_1CBA6:				; CODE XREF: sub_1CA36+149j
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bp+var_4]
		cmp	[bx+40h], ax
		jg	short loc_1CB81
		mov	ax, 6EFFh
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF96
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 6Eh	; 'n'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		pop	di
		mov	sp, bp
		pop	bp
		retn
sub_1CA36	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CBDD	proc near		; CODE XREF: sub_1C9A8+87p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 12A1h
		push	ds
		push	ax
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 6Eh	; 'n'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D61D
		mov	bx, word_4879A
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		cmp	ax, word_4B45F
		jz	short loc_1CC37
		mov	[bp+var_2], 0
		jmp	short loc_1CC26
; ---------------------------------------------------------------------------

loc_1CC17:				; CODE XREF: sub_1CBDD+58j
		mov	ax, [bp+var_2]
		add	ah, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF96
		inc	[bp+var_2]

loc_1CC26:				; CODE XREF: sub_1CBDD+38j
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bp+var_2]
		cmp	[bx+3Ah], ax
		jle	short loc_1CC6E
		jmp	short loc_1CC17
; ---------------------------------------------------------------------------

loc_1CC37:				; CODE XREF: sub_1CBDD+31j
		mov	[bp+var_2], 0
		jmp	short loc_1CC5F
; ---------------------------------------------------------------------------

loc_1CC3E:				; CODE XREF: sub_1CBDD+8Fj
		mov	ax, [bp+var_2]
		cwd
		mov	cx, 5
		idiv	cx
		mov	bx, word_4879A
		cmp	dx, [bx+1Ch]
		jnz	short loc_1CC5C
		mov	ax, [bp+var_2]
		add	ah, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF96

loc_1CC5C:				; CODE XREF: sub_1CBDD+71j
		inc	[bp+var_2]

loc_1CC5F:				; CODE XREF: sub_1CBDD+5Fj
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bp+var_2]
		cmp	[bx+3Ah], ax
		jg	short loc_1CC3E

loc_1CC6E:				; CODE XREF: sub_1CBDD+56j
		mov	[bp+var_2], 0
		jmp	short loc_1CC84
; ---------------------------------------------------------------------------

loc_1CC75:				; CODE XREF: sub_1CBDD+B4j
		mov	ax, [bp+var_2]
		add	ah, 6Eh	; 'n'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF96
		inc	[bp+var_2]

loc_1CC84:				; CODE XREF: sub_1CBDD+96j
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	ax, [bp+var_2]
		cmp	[bx+40h], ax
		jg	short loc_1CC75
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 6Eh	; 'n'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		mov	sp, bp
		pop	bp
		retn
sub_1CBDD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CCB1	proc near		; CODE XREF: sub_1C9A8+56p
					; sub_1C9A8+84p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	bx, word_4879A
		cmp	word ptr [bx+6], 0FFFFh
		jz	short loc_1CCF9
		push	[bp+arg_0]
		mov	ax, [bx+6]
		cwd
		mov	bx, [bx+16h]
		mov	cx, [bx+40h]
		idiv	cx
		add	ah, 64h	; 'd'
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		push	[bp+arg_0]
		mov	bx, word_4879A
		mov	ax, [bx+6]
		cwd
		mov	bx, [bx+16h]	; DATA XREF: sub_2C7FE+21r
		mov	cx, [bx+40h]
		idiv	cx
		add	dh, 6Eh	; 'n'
		push	dx
		nop
		push	cs
		call	near ptr sub_1CF73

loc_1CCF9:				; CODE XREF: sub_1CCB1+12j
		pop	bp
		retn	2
sub_1CCB1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CCFD	proc far		; CODE XREF: sub_1C985+15p
					; sub_2B5F2+17P ...

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+1]
		sub	ah, ah
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_1CD4D
		push	[bp+arg_0]
		add	ax, 4FFh
		jmp	short loc_1CD53
; ---------------------------------------------------------------------------

loc_1CD4D:				; CODE XREF: sub_1CCFD+46j
		push	[bp+arg_0]
		mov	ax, 5FEh

loc_1CD53:				; CODE XREF: sub_1CCFD+4Ej
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	sp, bp
		pop	bp
		retf	2
sub_1CCFD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CD6A	proc far		; CODE XREF: sub_1C985+1Cp
					; sub_1F45E+18p ...

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_1CDBA
		push	[bp+arg_0]
		add	ax, 5FFh
		jmp	short loc_1CDC0
; ---------------------------------------------------------------------------

loc_1CDBA:				; CODE XREF: sub_1CD6A+46j
		push	[bp+arg_0]
		mov	ax, 6FEh

loc_1CDC0:				; CODE XREF: sub_1CD6A+4Ej
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF73
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	sp, bp
		pop	bp
		retf	2
sub_1CD6A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CDD7	proc far		; CODE XREF: sub_181DF+42p
					; sub_1F45E+10p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	bx, [bp+arg_0]
		mov	word_4E940, bx
		shl	bx, 1
		push	ds
		push	word ptr [bx+124Ch]
		mov	ax, 0FAh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1E0E8
		cmp	[bp+arg_0], 0
		jnz	short loc_1CE09
		mov	ax, 0FAh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D11E
		jmp	short loc_1CE12
; ---------------------------------------------------------------------------

loc_1CE09:				; CODE XREF: sub_1CDD7+25j
		mov	ax, 0FAh ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1D291

loc_1CE12:				; CODE XREF: sub_1CDD7+30j
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		pop	bp
		retf	2
sub_1CDD7	endp


; =============== S U B	R O U T	I N E =======================================


sub_1CE23	proc far		; CODE XREF: sub_10167+187p
					; sub_14619+14Ep ...
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF96, 0
		jz	short locret_1CE71
		mov	word_4DF96, 0
		mov	ax, 1
		push	ax
		mov	ax, 1244h
		push	ds
		push	ax
		call	sub_23E31
		mov	ax, word_4878C
		sub	word_42AE6, ax
		add	word_42AEA, 1Fh
		call	sub_232D3
		mov	ax, 1B06h
		push	ds
		push	ax
		call	sub_29DCE
		call	sub_232B2
		mov	word_49098, 1FF6h
		mov	word_4909A, 0

locret_1CE71:				; CODE XREF: sub_1CE23+Cj
		retf
sub_1CE23	endp


; =============== S U B	R O U T	I N E =======================================


sub_1CE72	proc far		; CODE XREF: sub_10167+4Dp
					; sub_14619+156p ...
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF96, 0
		jnz	short locret_1CEB5
		mov	word_4DF96, 1
		sub	ax, ax
		push	ax
		mov	ax, 1244h
		push	ds
		push	ax
		call	sub_23E31
		mov	ax, word_4878C
		add	word_42AE6, ax
		sub	word_42AEA, 1Fh
		nop
		push	cs
		call	near ptr sub_1D137
		nop
		push	cs
		call	near ptr sub_135EB
		mov	word_49098, 1FFFh
		mov	word_4909A, 0

locret_1CEB5:				; CODE XREF: sub_1CE72+Cj
		retf
sub_1CE72	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CEB6	proc far		; CODE XREF: sub_23E78+5DP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	word_42298, 0
		jnz	short loc_1CF07
		mov	word_42298, 1
		mov	ax, [bp+arg_0]
		and	ax, 0Fh
		or	al, 0Ah
		mov	word_47346, ax
		mov	word ptr dword_47342, offset loc_1EB41
		mov	word ptr dword_47342+2,	seg seg000
		sub	ax, ax
		mov	word_4733C, ax
		mov	word_4733A, ax
		mov	ax, 12BCh
		push	ds
		push	ax
		push	cs
		call	near ptr sub_1DEC7
		mov	word_47348, ax
		mov	word_4734A, dx
		mov	word ptr dword_4733E, ax
		mov	word ptr dword_4733E+2,	dx
		push	cs
		call	near ptr sub_1D2AA

loc_1CF07:				; CODE XREF: sub_1CEB6+Fj
		mov	word_490A0, 0
		pop	bp
		retf	2
sub_1CEB6	endp


; =============== S U B	R O U T	I N E =======================================


sub_1CF11	proc far		; CODE XREF: seg000:06C2p
		xor	ax, ax
		call	__chkstk
		mov	word_42298, 0
		mov	word_490A0, 0
		retf
sub_1CF11	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CF25	proc far		; CODE XREF: sub_1CA36+192p
					; sub_1CA36+19Fp ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_0]
		call	sub_1E34B
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_1CF67
		push	word ptr [bp+var_4+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		push	[bp+arg_4]
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1E7AA
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1CF67:				; CODE XREF: sub_1CF25+19j
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	6
sub_1CF25	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CF73	proc far		; CODE XREF: sub_16592+269p
					; sub_16592+279p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		cmp	[bp+arg_2], 0
		jz	short loc_1CF88
		mov	ax, 12h
		jmp	short loc_1CF8A
; ---------------------------------------------------------------------------

loc_1CF88:				; CODE XREF: sub_1CF73+Ej
		sub	ax, ax

loc_1CF8A:				; CODE XREF: sub_1CF73+13j
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1E0A0
		pop	bp
		retf	4
sub_1CF73	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1CF96	proc far		; CODE XREF: sub_1CA36+185p
					; sub_1CBDD+43p ...

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		mov	ax, word_4733A
		mov	dx, word_4733C
		jmp	loc_1D0D3
; ---------------------------------------------------------------------------

loc_1CFAB:				; CODE XREF: sub_1CF96+C0j
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_14]
		les	bx, es:[bx]
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1CFD5:				; CODE XREF: sub_1CF96+D1j
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1AEAD
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	loc_1D112
; ---------------------------------------------------------------------------

loc_1CFF9:				; CODE XREF: sub_1CF96+B6j
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_1D012:				; CODE XREF: sub_1CF96+129j
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jz	short loc_1D06A
		push	dx
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_28], ax
		mov	word ptr [bp+var_28+2],	dx
		les	bx, [bp+var_28]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+arg_0]
		cmp	es:[bx], ax
		jnz	short loc_1CFF9
		mov	ax, word ptr [bp+var_14]
		or	ax, word ptr [bp+var_14+2]
		jz	short loc_1D059
		jmp	loc_1CFAB
; ---------------------------------------------------------------------------

loc_1D059:				; CODE XREF: sub_1CF96+BEj
		les	bx, [bp+var_4]
		mov	ax, [bp+var_C]
		mov	es:[bx+0Dh], ax
		mov	es:[bx+0Fh], dx
		jmp	loc_1CFD5
; ---------------------------------------------------------------------------

loc_1D06A:				; CODE XREF: sub_1CF96+84j
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]

loc_1D07B:				; CODE XREF: sub_1CF96+179j
		mov	word ptr [bp+var_20], ax
		mov	word ptr [bp+var_20+2],	dx
		or	ax, dx
		jz	short loc_1D0C2
		push	dx
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_20]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		sub	ax, ax
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], ax
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1D012
; ---------------------------------------------------------------------------

loc_1D0C2:				; CODE XREF: sub_1CF96+EDj
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]

loc_1D0D3:				; CODE XREF: sub_1CF96+12j
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	dx
		or	ax, dx
		jz	short loc_1D112
		push	dx
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_24]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1D07B
; ---------------------------------------------------------------------------

loc_1D112:				; CODE XREF: sub_1CF96+60j
					; sub_1CF96+145j
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	2
sub_1CF96	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D11E	proc far		; CODE XREF: sub_1C919+Dp
					; sub_1C919+16p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 80h	; '�'
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1E042
		pop	bp
		retf	2
sub_1D11E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D137	proc far		; CODE XREF: sub_1630A+9p
					; sub_1CE72+2Fp

var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 24h	; '$'
		call	__chkstk
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, dword_4733E
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_18], ax
		mov	word ptr [bp+var_18+2],	dx
		push	dx
		push	ax
		push	dx
		push	ax
		call	sub_1EB4F
		les	bx, [bp+var_18]
		mov	ax, es:[bx]
		inc	ax
		mov	[bp+var_8], ax
		mov	ax, es:[bx+4]
		dec	ax
		mov	[bp+var_4], ax
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_20483
		les	bx, [bp+var_18]
		mov	al, es:[bx+8]
		sub	ah, ah
		and	ax, 3Fh
		add	ax, es:[bx+2]
		mov	[bp+var_1A], ax
		mov	ax, es:[bx]
		add	ax, [bp+var_A]
		add	ax, [bp+var_10]
		inc	ax
		mov	[bp+var_1C], ax
		mov	al, es:[bx+9]
		and	al, 0Fh
		sub	ah, ah
		push	ax
		call	sub_20AC6
		les	bx, [bp+var_18]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+0Bh]
		mov	cl, 4
		call	__aFulshr
		and	al, 0Fh
		mov	byte_48766, al
		les	bx, [bp+var_18]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1D26D
; ---------------------------------------------------------------------------

loc_1D1D6:				; CODE XREF: sub_1D137+140j
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_24]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		les	bx, [bp+var_14]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_20], ax
		mov	[bp+var_1E], dx
		push	[bp+var_1A]
		push	[bp+var_1C]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+0Bh]
		inc	ax
		push	dx
		push	ax
		les	bx, es:[bx+9]
		mov	al, es:[bx]
		cbw
		push	ax
		call	sub_23537
		mov	ax, [bp+var_1A]
		mov	[bp+var_6], ax
		les	bx, [bp+var_14]
		mov	ax, es:[bx+7]
		add	ax, [bp+var_1A]
		mov	[bp+var_2], ax
		mov	[bp+var_1A], ax
		test	byte ptr es:[bx+6], 80h
		jz	short loc_1D248
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_23427

loc_1D248:				; CODE XREF: sub_1D137+105j
		les	bx, [bp+var_14]
		test	byte ptr es:[bx+6], 40h
		jz	short loc_1D25C
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_205C8

loc_1D25C:				; CODE XREF: sub_1D137+119j
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_20]
		mov	dx, [bp+var_1E]

loc_1D26D:				; CODE XREF: sub_1D137+9Cj
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	dx
		or	ax, dx
		jz	short loc_1D27A
		jmp	loc_1D1D6
; ---------------------------------------------------------------------------

loc_1D27A:				; CODE XREF: sub_1D137+13Ej
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf
sub_1D137	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D291	proc far		; CODE XREF: sub_1C893+Dp
					; sub_1C893+16p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 0FF7Fh
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1E042
		pop	bp
		retf	2
sub_1D291	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D2AA	proc far		; CODE XREF: sub_1632A+8Cp
					; sub_1C53C+4Dp ...

var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 1Ah
		call	__chkstk
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, dword_4733E
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_20483
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	ax, [bp+var_8]
		add	ax, [bp+var_6]
		inc	ax
		inc	ax
		mov	[bp+var_1A], ax
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		add	ax, [bp+var_1A]
		mov	es:[bx+4], ax
		les	bx, [bp+var_10]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1D36D
; ---------------------------------------------------------------------------

loc_1D307:				; CODE XREF: sub_1D2AA+CBj
		push	word ptr [bp+var_18+2]
		push	word ptr [bp+var_18]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_18]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		les	bx, [bp+var_C]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		mov	ax, 0FFFFh
		push	ax
		push	ax
		push	es
		push	bx
		call	sub_1E7AA
		les	bx, [bp+var_C]
		cmp	word ptr es:[bx+7], 0
		jnz	short loc_1D35C
		les	bx, es:[bx+9]
		mov	al, es:[bx]
		cbw
		mov	cl, 3
		shl	ax, cl
		inc	ax
		inc	ax
		les	bx, [bp+var_C]
		mov	es:[bx+7], ax

loc_1D35C:				; CODE XREF: sub_1D2AA+9Bj
		push	word ptr [bp+var_18+2]
		push	word ptr [bp+var_18]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_14]
		mov	dx, [bp+var_12]

loc_1D36D:				; CODE XREF: sub_1D2AA+5Bj
		mov	word ptr [bp+var_18], ax
		mov	word ptr [bp+var_18+2],	dx
		or	ax, dx
		jnz	short loc_1D307
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, [bp+var_1A]
		mov	sp, bp
		pop	bp
		retf
sub_1D2AA	endp


; =============== S U B	R O U T	I N E =======================================


sub_1D391	proc far		; CODE XREF: sub_1632A+18p
					; sub_16592+1A2p
		xor	ax, ax
		call	__chkstk
		mov	word_490A0, 0
		mov	ax, word ptr dword_4733E
		mov	dx, word ptr dword_4733E+2
		retf
sub_1D391	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	word ptr [bp+6]
		call	sub_1E423
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		or	dx, ax
		jnz	short loc_1D3CB
		mov	word_490A0, 0
		sub	ax, ax
		jmp	short loc_1D3F9
; ---------------------------------------------------------------------------

loc_1D3CB:				; CODE XREF: seg000:D3BFj
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp-4]
		les	bx, es:[bx]
		mov	al, es:[bx+4]
		sub	ah, ah
		mov	[bp-6],	ax
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	ax, [bp-6]

loc_1D3F9:				; CODE XREF: seg000:D3C9j
		mov	sp, bp
		pop	bp
		retf	2

; =============== S U B	R O U T	I N E =======================================


sub_1D3FF	proc far		; CODE XREF: sub_23CFB+CDP
					; sub_23E31+11P ...
		xor	ax, ax
		call	__chkstk
		mov	word_490A0, 0
		mov	ax, word_47348
		mov	dx, word_4734A
		retf
sub_1D3FF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D414	proc far		; CODE XREF: sub_10167+115p
					; sub_16592+2D2p ...

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 32h	; '2'
		call	__chkstk
		push	[bp+arg_0]
		call	sub_1E34B
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_32+2],	dx

loc_1D42B:				; DATA XREF: sub_2D005+6E5r
		or	dx, ax
		jnz	short loc_1D432
		jmp	loc_1D5B9
; ---------------------------------------------------------------------------

loc_1D432:				; CODE XREF: sub_1D414+19j
		push	word ptr [bp+var_32+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_32]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_20], ax
		mov	word ptr [bp+var_20+2],	dx
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, dword_4733E
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_28], ax
		mov	word ptr [bp+var_28+2],	dx
		lea	ax, [bp+var_18]
		push	ss
		push	ax
		call	sub_20483
		les	bx, [bp+var_28]
		mov	ax, es:[bx]
		inc	ax
		mov	[bp+var_8], ax
		mov	ax, es:[bx+4]
		dec	ax
		mov	[bp+var_4], ax
		mov	al, es:[bx+8]
		sub	ah, ah
		and	ax, 3Fh
		add	ax, es:[bx+2]
		mov	[bp+var_2A], ax
		mov	[bp+var_6], ax
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1D4BD
; ---------------------------------------------------------------------------

loc_1D4A2:				; CODE XREF: sub_1D414+E6j
					; sub_1D414+EBj
		les	bx, [bp+var_2E]
		mov	ax, es:[bx+7]
		add	[bp+var_6], ax
		push	word ptr [bp+var_24+2]
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]

loc_1D4BD:				; CODE XREF: sub_1D414+8Cj
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	dx
		or	ax, dx
		jz	short loc_1D501
		push	dx
		push	word ptr [bp+var_24]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_24]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_2E], ax
		mov	word ptr [bp+var_2E+2],	dx
		les	bx, [bp+var_2E]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		mov	ax, word ptr [bp+var_32]
		mov	dx, word ptr [bp+var_32+2]
		cmp	word ptr [bp+var_24], ax
		jnz	short loc_1D4A2
		cmp	word ptr [bp+var_24+2],	dx
		jnz	short loc_1D4A2

loc_1D501:				; CODE XREF: sub_1D414+B1j
		mov	ax, word ptr [bp+var_24]
		or	ax, word ptr [bp+var_24+2]
		jnz	short loc_1D50C
		jmp	loc_1D5B9
; ---------------------------------------------------------------------------

loc_1D50C:				; CODE XREF: sub_1D414+F3j
		les	bx, [bp+var_20]
		mov	ax, es:[bx+7]
		add	ax, [bp+var_6]
		mov	[bp+var_2], ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_321A6
		mov	ax, [bp+var_2A]
		cmp	[bp+var_E], ax
		jnz	short loc_1D534
		sub	[bp+var_E], 4

loc_1D534:				; CODE XREF: sub_1D414+11Aj
		push	word ptr [bp+var_28+2]
		push	word ptr [bp+var_28]
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_1EBB5
		push	[bp+var_6]
		mov	ax, [bp+var_8]
		add	ax, [bp+var_12]
		add	ax, [bp+var_18]
		push	ax
		les	bx, [bp+var_20]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+0Bh]
		inc	ax
		push	dx
		push	ax
		les	bx, es:[bx+9]
		mov	al, es:[bx]
		cbw
		push	ax
		call	sub_23537
		les	bx, [bp+var_20]
		test	byte ptr es:[bx+6], 80h
		jz	short loc_1D57F
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_23427

loc_1D57F:				; CODE XREF: sub_1D414+15Fj
		cmp	[bp+arg_2], 0
		jz	short loc_1D599
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_205C8
		les	bx, [bp+var_20]
		or	byte ptr es:[bx+6], 40h
		jmp	short loc_1D5A1
; ---------------------------------------------------------------------------

loc_1D599:				; CODE XREF: sub_1D414+16Fj
		les	bx, [bp+var_20]
		and	byte ptr es:[bx+6], 0BFh

loc_1D5A1:				; CODE XREF: sub_1D414+183j
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_32+2]
		push	word ptr [bp+var_32]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1D5B9:				; CODE XREF: sub_1D414+1Bj
					; sub_1D414+F5j
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4
sub_1D414	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D5C5	proc far		; CODE XREF: sub_1632A+6Bp
					; sub_1632A+87p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B047
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B047
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		push	[bp+arg_0]
		call	sub_1E14F

loc_1D5FB:				; DATA XREF: sub_2D005+58Dr
		push	[bp+arg_4]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr dword_4733E+2
		push	word ptr dword_4733E
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		pop	bp
		retf	6
sub_1D5C5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D61D	proc far		; CODE XREF: sub_1CA36+48p
					; sub_1CA36+114p ...

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 1Ah
		call	__chkstk
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1D643
		jmp	loc_1D6C4
; ---------------------------------------------------------------------------

loc_1D643:				; CODE XREF: sub_1D61D+21j
		mov	ax, 10h
		push	ax
		push	word_47346
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		push	[bp+arg_0]
		call	sub_1E34B
		mov	[bp+var_1A], ax
		mov	[bp+var_18], dx
		or	dx, ax
		jnz	short loc_1D66E
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_1D66E:				; CODE XREF: sub_1D61D+4Aj
		push	[bp+var_18]
		push	[bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B047
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B047
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1E63F
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; DATA XREF: sub_2D005+459r
		push	[bp+var_18]
		push	[bp+var_1A]
		push	[bp+arg_2]
		call	sub_1E24D
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B063
		push	[bp+var_18]
		push	[bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B063
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_1D6C4:				; CODE XREF: sub_1D61D+23j
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	8
sub_1D61D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D6D0	proc far		; CODE XREF: sub_23CFB+94P

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 1Eh
		call	__chkstk
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jnz	short loc_1D6F0
		mov	ax, word_47348
		mov	dx, word_4734A
		mov	word ptr [bp+arg_0], ax
		mov	word ptr [bp+arg_0+2], dx

loc_1D6F0:				; CODE XREF: sub_1D6D0+11j
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		mov	word ptr dword_4733E, ax
		mov	word ptr dword_4733E+2,	dx
		les	bx, [bp+arg_4]
		mov	al, es:[bx+2]
		sub	ah, ah
		mov	[bp+var_12], ax
		or	ax, ax
		jnz	short loc_1D710
		jmp	loc_1D83F
; ---------------------------------------------------------------------------

loc_1D710:				; CODE XREF: sub_1D6D0+3Bj
		push	dx
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1D7EE
; ---------------------------------------------------------------------------

loc_1D737:				; CODE XREF: sub_1D6D0+B4j
					; sub_1D6D0+C3j
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_1D748:				; CODE XREF: sub_1D6D0+161j
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jnz	short loc_1D755
		jmp	loc_1D7DD
; ---------------------------------------------------------------------------

loc_1D755:				; CODE XREF: sub_1D6D0+80j
		push	dx
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_1E], ax
		mov	word ptr [bp+var_1E+2],	dx
		les	bx, [bp+var_1E]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		test	byte ptr es:[bx+4], 80h
		jnz	short loc_1D737
		mov	al, byte ptr [bp+var_12]
		cmp	es:[bx+5], al
		jz	short loc_1D795
		cmp	es:[bx+6], al
		jnz	short loc_1D737

loc_1D795:				; CODE XREF: sub_1D6D0+BDj
		les	bx, [bp+var_4]
		mov	dx, es:[bx]
		les	bx, [bp+var_1E]
		mov	ax, es:[bx]
		les	bx, [bp+arg_4]
		mov	es:[bx+10h], ax
		mov	es:[bx+12h], dx
		mov	ax, 1
		push	ax
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		push	cs
		call	near ptr sub_1D414
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	short loc_1D84C
; ---------------------------------------------------------------------------

loc_1D7DD:				; CODE XREF: sub_1D6D0+82j
					; sub_1D6D0+157j
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_16]
		mov	dx, [bp+var_14]

loc_1D7EE:				; CODE XREF: sub_1D6D0+64j
		mov	word ptr [bp+var_1A], ax
		mov	word ptr [bp+var_1A+2],	dx
		or	ax, dx
		jz	short loc_1D834
		push	dx
		push	word ptr [bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_1A]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_16], ax
		mov	[bp+var_14], dx
		test	byte ptr es:[bx+6], 80h
		jnz	short loc_1D7DD
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1D748
; ---------------------------------------------------------------------------

loc_1D834:				; CODE XREF: sub_1D6D0+126j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1D83F:				; CODE XREF: sub_1D6D0+3Dj
		les	bx, [bp+arg_4]
		sub	ax, ax
		mov	es:[bx+12h], ax
		mov	es:[bx+10h], ax

loc_1D84C:				; CODE XREF: sub_1D6D0+10Bj
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	8
sub_1D6D0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D858	proc far		; CODE XREF: sub_16592+1D7p
					; sub_16592+4ACp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word ptr dword_47342, ax
		mov	word ptr dword_47342+2,	dx
		mov	word_490A0, 0
		pop	bp
		retf	4
sub_1D858	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1D879	proc far		; CODE XREF: sub_16592+2B4p
					; sub_23CFB+F6P

var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 5Ah	; 'Z'
		call	__chkstk
		les	bx, [bp+arg_4]
		test	byte ptr es:[bx+0Eh], 1
		jz	short loc_1D892
		sub	ax, ax
		jmp	short loc_1D8A1
; ---------------------------------------------------------------------------

loc_1D892:				; CODE XREF: sub_1D879+13j
		test	byte ptr es:[bx+0Eh], 2
		jz	short loc_1D89E
		mov	ax, 1
		jmp	short loc_1D8A1
; ---------------------------------------------------------------------------

loc_1D89E:				; CODE XREF: sub_1D879+1Ej
		mov	ax, 2

loc_1D8A1:				; CODE XREF: sub_1D879+17j
					; sub_1D879+23j
		mov	[bp+var_46], ax
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jnz	short loc_1D8B9
		mov	ax, word_47348
		mov	dx, word_4734A
		mov	word ptr [bp+arg_0], ax
		mov	word ptr [bp+arg_0+2], dx

loc_1D8B9:				; CODE XREF: sub_1D879+31j
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		mov	word ptr dword_4733E, ax
		mov	word ptr dword_4733E+2,	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_32+2],	dx
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		call	sub_20483
		mov	ax, [bp+var_1A]
		add	ax, [bp+var_18]
		add	ax, [bp+var_14]
		inc	ax
		mov	[bp+var_3A], ax
		sub	ax, ax
		mov	word ptr [bp+var_56+2],	ax
		mov	word ptr [bp+var_56], ax
		mov	word ptr [bp+var_38+2],	ax
		mov	word ptr [bp+var_38], ax
		mov	[bp+var_40], ax
		les	bx, [bp+var_32]
		mov	ax, es:[bx]
		inc	ax
		mov	[bp+var_8], ax
		mov	ax, es:[bx+4]
		dec	ax
		mov	[bp+var_4], ax
		sub	ax, ax
		mov	[bp+var_2], ax
		mov	[bp+var_6], ax
		mov	ax, es:[bx+4]
		dec	ax
		mov	[bp+var_22], ax
		sub	ax, ax
		mov	[bp+var_1C], ax
		mov	[bp+var_20], ax
		mov	[bp+var_1E], ax
		mov	[bp+var_48], ax
		mov	[bp+var_4C], ax
		mov	[bp+var_4A], ax
		mov	[bp+var_4E], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_44], ax
		mov	ax, es:[bx+0Ch]
		mov	[bp+var_42], ax

loc_1D94F:				; CODE XREF: sub_1D879+414j
		mov	ax, word ptr [bp+var_38]
		or	ax, word ptr [bp+var_38+2]
		jz	short loc_1D988
		lea	ax, [bp+var_44]
		push	ss
		push	ax
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_1D988
		cmp	[bp+var_40], 0
		jz	short loc_1D97A
		lea	ax, [bp+var_4E]
		push	ss
		push	ax
		call	sub_205C8

loc_1D97A:				; CODE XREF: sub_1D879+F5j
		sub	ax, ax
		mov	word ptr [bp+var_38+2],	ax
		mov	word ptr [bp+var_38], ax
		mov	[bp+var_4A], ax
		mov	[bp+var_4E], ax

loc_1D988:				; CODE XREF: sub_1D879+DCj
					; sub_1D879+EFj
		lea	ax, [bp+var_44]
		push	ss
		push	ax
		push	word ptr [bp+var_32+2]
		push	word ptr [bp+var_32]
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_1D99F
		jmp	loc_1DB45
; ---------------------------------------------------------------------------

loc_1D99F:				; CODE XREF: sub_1D879+121j
		mov	ax, [bp+var_6]
		cmp	[bp+var_42], ax
		jl	short loc_1D9B2
		mov	ax, [bp+var_2]
		cmp	[bp+var_42], ax
		jge	short loc_1D9B2
		jmp	loc_1DC7A
; ---------------------------------------------------------------------------

loc_1D9B2:				; CODE XREF: sub_1D879+12Cj
					; sub_1D879+134j
		mov	ax, [bp+var_2]
		cmp	[bp+var_6], ax
		jge	short loc_1D9D3
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_205C8
		inc	[bp+var_22]
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		call	dword_47342
		dec	[bp+var_22]

loc_1D9D3:				; CODE XREF: sub_1D879+13Fj
		sub	ax, ax
		mov	word ptr [bp+var_56+2],	ax
		mov	word ptr [bp+var_56], ax
		mov	word ptr [bp+var_38+2],	ax
		mov	word ptr [bp+var_38], ax
		mov	[bp+var_40], ax
		mov	[bp+var_1C], ax
		mov	[bp+var_20], ax
		mov	[bp+var_1E], ax
		les	bx, [bp+var_32]
		mov	al, es:[bx+8]
		sub	ah, ah
		and	ax, 3Fh
		add	ax, es:[bx+2]
		mov	[bp+var_34], ax
		mov	[bp+var_6], ax
		mov	[bp+var_2], ax
		sub	ax, ax
		mov	[bp+var_4A], ax
		mov	[bp+var_4E], ax
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1DA2F
; ---------------------------------------------------------------------------

loc_1DA18:				; CODE XREF: sub_1D879+206j
					; sub_1D879+20Ej
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax

loc_1DA1E:				; CODE XREF: sub_1D879+224j
		push	word ptr [bp+var_2E+2]
		push	word ptr [bp+var_2E]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_26]
		mov	dx, [bp+var_24]

loc_1DA2F:				; CODE XREF: sub_1D879+19Dj
		mov	word ptr [bp+var_2E], ax
		mov	word ptr [bp+var_2E+2],	dx
		or	ax, dx
		jz	short loc_1DAA0
		push	dx
		push	word ptr [bp+var_2E]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_2E]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_52], ax
		mov	word ptr [bp+var_52+2],	dx
		les	bx, [bp+var_52]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_26], ax
		mov	[bp+var_24], dx
		mov	ax, es:[bx+7]
		add	ax, [bp+var_6]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_34]
		cmp	[bp+var_6], ax
		jnz	short loc_1DA79
		sub	[bp+var_6], 4

loc_1DA79:				; CODE XREF: sub_1D879+1FAj
		mov	ax, [bp+var_6]
		cmp	[bp+var_42], ax
		jl	short loc_1DA18
		mov	ax, [bp+var_2]
		cmp	[bp+var_42], ax
		jge	short loc_1DA18
		mov	ax, word ptr [bp+var_2E]
		mov	dx, word ptr [bp+var_2E+2]
		mov	word ptr [bp+var_56], ax
		mov	word ptr [bp+var_56+2],	dx
		sub	ax, ax
		mov	[bp+var_24], ax
		mov	[bp+var_26], ax
		jmp	loc_1DA1E
; ---------------------------------------------------------------------------

loc_1DAA0:				; CODE XREF: sub_1D879+1BEj
		mov	ax, word ptr [bp+var_56]
		or	ax, word ptr [bp+var_56+2]
		jnz	short loc_1DAAB
		jmp	loc_1DC7A
; ---------------------------------------------------------------------------

loc_1DAAB:				; CODE XREF: sub_1D879+22Dj
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_205C8
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_56]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_2A], ax
		mov	word ptr [bp+var_2A+2],	dx
		les	bx, [bp+var_2A]
		mov	ax, es:[bx+4]
		add	ax, [bp+var_22]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_20], ax
		mov	ax, es:[bx+2]
		add	ax, [bp+var_20]
		mov	[bp+var_1C], ax
		les	bx, [bp+var_32]
		cmp	es:[bx+6], ax
		jge	short loc_1DB17
		mov	ax, es:[bx+6]
		mov	[bp+var_1C], ax
		les	bx, [bp+var_2A]
		sub	ax, es:[bx+2]
		mov	[bp+var_20], ax
		les	bx, [bp+var_32]
		cmp	es:[bx+2], ax
		jle	short loc_1DB17
		mov	ax, es:[bx+2]
		mov	[bp+var_20], ax

loc_1DB17:				; CODE XREF: sub_1D879+27Bj
					; sub_1D879+295j
		mov	ax, [bp+var_20]
		inc	ax
		inc	ax
		mov	[bp+var_4C], ax
		mov	ax, [bp+var_1C]
		dec	ax
		dec	ax
		mov	[bp+var_48], ax
		push	es
		push	bx
		push	word ptr [bp+var_2A+2]
		push	word ptr [bp+var_2A]
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		call	sub_1E94D
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	loc_1DC7A
; ---------------------------------------------------------------------------

loc_1DB45:				; CODE XREF: sub_1D879+123j
		lea	ax, [bp+var_44]
		push	ss
		push	ax
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		call	sub_20A1B
		or	ax, ax
		jnz	short loc_1DB5B
		jmp	loc_1DC7A
; ---------------------------------------------------------------------------

loc_1DB5B:				; CODE XREF: sub_1D879+2DDj
		mov	ax, [bp+var_4E]
		cmp	[bp+var_44], ax
		jl	short loc_1DB6E
		mov	ax, [bp+var_4A]
		cmp	[bp+var_44], ax
		jge	short loc_1DB6E
		jmp	loc_1DC7A
; ---------------------------------------------------------------------------

loc_1DB6E:				; CODE XREF: sub_1D879+2E8j
					; sub_1D879+2F0j
		cmp	[bp+var_40], 0
		jz	short loc_1DB7E
		lea	ax, [bp+var_4E]
		push	ss
		push	ax
		call	sub_205C8

loc_1DB7E:				; CODE XREF: sub_1D879+2F9j
		sub	ax, ax
		mov	word ptr [bp+var_38+2],	ax
		mov	word ptr [bp+var_38], ax
		les	bx, [bp+var_32]
		mov	ax, es:[bx+4]
		mov	[bp+var_4A], ax
		mov	[bp+var_4E], ax
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_56]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_2A], ax
		mov	word ptr [bp+var_2A+2],	dx
		les	bx, [bp+var_2A]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1DBE1
; ---------------------------------------------------------------------------

loc_1DBBB:				; CODE XREF: sub_1D879+3C8j
					; sub_1D879+3D5j
		sub	ax, ax

loc_1DBBD:				; CODE XREF: sub_1D879+3DBj
		mov	[bp+var_40], ax
		sub	ax, ax
		mov	[bp+var_A], ax
		mov	[bp+var_C], ax
		jmp	short loc_1DBD0
; ---------------------------------------------------------------------------

loc_1DBCA:				; CODE XREF: sub_1D879+3ABj
					; sub_1D879+3B3j
		mov	ax, [bp+var_4A]
		mov	[bp+var_4E], ax

loc_1DBD0:				; CODE XREF: sub_1D879+34Fj
		push	word ptr [bp+var_12+2]
		push	word ptr [bp+var_12]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_1DBE1:				; CODE XREF: sub_1D879+340j
		mov	word ptr [bp+var_12], ax
		mov	word ptr [bp+var_12+2],	dx
		or	ax, dx
		jz	short loc_1DC57
		push	dx
		push	word ptr [bp+var_12]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_12]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_3E], ax
		mov	word ptr [bp+var_3E+2],	dx
		les	bx, [bp+var_3E]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+var_4E]
		add	ax, [bp+var_3A]
		mov	[bp+var_4A], ax
		mov	ax, [bp+var_4E]
		cmp	[bp+var_44], ax
		jl	short loc_1DBCA
		mov	ax, [bp+var_4A]
		cmp	[bp+var_44], ax
		jge	short loc_1DBCA
		mov	ax, word ptr [bp+var_12]
		mov	dx, word ptr [bp+var_12+2]
		mov	word ptr [bp+var_38], ax
		mov	word ptr [bp+var_38+2],	dx
		test	byte ptr es:[bx+4], 80h
		jz	short loc_1DC44
		jmp	loc_1DBBB
; ---------------------------------------------------------------------------

loc_1DC44:				; CODE XREF: sub_1D879+3C6j
		les	bx, [bp+var_2A]
		test	byte ptr es:[bx+6], 80h
		jz	short loc_1DC51
		jmp	loc_1DBBB
; ---------------------------------------------------------------------------

loc_1DC51:				; CODE XREF: sub_1D879+3D3j
		mov	ax, 1
		jmp	loc_1DBBD
; ---------------------------------------------------------------------------

loc_1DC57:				; CODE XREF: sub_1D879+370j
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, word ptr [bp+var_38]
		or	ax, word ptr [bp+var_38+2]
		jz	short loc_1DC7A
		cmp	[bp+var_40], 0
		jz	short loc_1DC7A
		lea	ax, [bp+var_4E]
		push	ss
		push	ax
		call	sub_205C8

loc_1DC7A:				; CODE XREF: sub_1D879+136j
					; sub_1D879+22Fj ...
		lea	ax, [bp+var_44]
		push	ss
		push	ax
		call	sub_26E07
		call	sub_26F25
		or	ax, ax
		jz	short loc_1DC90
		jmp	loc_1D94F
; ---------------------------------------------------------------------------

loc_1DC90:				; CODE XREF: sub_1D879+412j
		les	bx, [bp+arg_4]
		sub	ax, ax
		mov	es:[bx+12h], ax
		mov	es:[bx+10h], ax
		mov	ax, word ptr [bp+var_56]
		or	ax, word ptr [bp+var_56+2]
		jnz	short loc_1DCA8
		jmp	loc_1DD78
; ---------------------------------------------------------------------------

loc_1DCA8:				; CODE XREF: sub_1D879+42Aj
		mov	ax, word ptr [bp+var_38]
		or	ax, word ptr [bp+var_38+2]
		jnz	short loc_1DCB3
		jmp	loc_1DD44
; ---------------------------------------------------------------------------

loc_1DCB3:				; CODE XREF: sub_1D879+435j
		cmp	[bp+var_40], 0
		jnz	short loc_1DCBC
		jmp	loc_1DD44
; ---------------------------------------------------------------------------

loc_1DCBC:				; CODE XREF: sub_1D879+43Ej
		mov	[bp+var_E], 0
		jmp	short loc_1DCD7
; ---------------------------------------------------------------------------

loc_1DCC3:				; CODE XREF: sub_1D879+454j
					; sub_1D879+459j ...
		nop
		push	cs
		call	near ptr sub_1FBD0
		cmp	dx, [bp+var_58]
		ja	short loc_1DCD4
		jb	short loc_1DCC3
		cmp	ax, [bp+var_5A]
		jb	short loc_1DCC3

loc_1DCD4:				; CODE XREF: sub_1D879+452j
		inc	[bp+var_E]

loc_1DCD7:				; CODE XREF: sub_1D879+448j
		mov	ax, word_4229A
		cmp	[bp+var_E], ax
		jnb	short loc_1DCFC
		lea	ax, [bp+var_4E]
		push	ss
		push	ax
		call	sub_205C8
		nop
		push	cs
		call	near ptr sub_1FBD0
		add	ax, 3
		adc	dx, 0
		mov	[bp+var_5A], ax
		mov	[bp+var_58], dx
		jmp	short loc_1DCC3
; ---------------------------------------------------------------------------

loc_1DCFC:				; CODE XREF: sub_1D879+464j
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B047
		push	word ptr [bp+var_38+2]
		push	word ptr [bp+var_38]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_56]
		les	bx, es:[bx]
		mov	dx, es:[bx]
		les	bx, [bp+var_38]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		les	bx, [bp+arg_4]
		mov	es:[bx+10h], ax
		mov	es:[bx+12h], dx
		les	bx, [bp+var_2A]
		or	byte ptr es:[bx+6], 40h
		push	word ptr [bp+var_38+2]
		push	word ptr [bp+var_38]
		nop
		push	cs
		call	near ptr sub_1B063
		jmp	short loc_1DD61
; ---------------------------------------------------------------------------

loc_1DD44:				; CODE XREF: sub_1D879+437j
					; sub_1D879+440j
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_205C8
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_2A]
		and	byte ptr es:[bx+6], 0BFh

loc_1DD61:				; CODE XREF: sub_1D879+4C9j
		push	word ptr [bp+var_56+2]
		push	word ptr [bp+var_56]
		nop
		push	cs
		call	near ptr sub_1B063
		inc	[bp+var_22]
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		call	dword_47342

loc_1DD78:				; CODE XREF: sub_1D879+42Cj
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	8
sub_1D879	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1DD8F	proc far		; CODE XREF: sub_1632A+5Ap
					; sub_1632A+75p ...

var_32		= byte ptr -32h
var_20		= dword	ptr -20h
var_1C		= byte ptr -1Ch
var_1A		= byte ptr -1Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 32h	; '2'
		call	__chkstk
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1DDB5
		jmp	loc_1DEB5
; ---------------------------------------------------------------------------

loc_1DDB5:				; CODE XREF: sub_1DD8F+21j
		sub	ax, ax
		mov	word ptr [bp+var_20+2],	ax
		mov	word ptr [bp+var_20], ax
		mov	ax, 15h
		push	ax
		push	word_47346
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_20], ax
		mov	word ptr [bp+var_20+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_20]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+2], 0
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+4], 0
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		call	sub_1E558
		mov	word ptr [bp+arg_0], ax
		mov	word ptr [bp+arg_0+2], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		mov	[bp+var_1C], al
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+0Fh], ax
		mov	es:[bx+0Dh], ax
		lea	ax, [bp+var_32]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1DEA5
		jmp	short loc_1DE95
; ---------------------------------------------------------------------------

loc_1DE41:				; CODE XREF: sub_1DD8F+10Fj
		mov	ax, 10h
		push	ax
		push	word_47346
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		les	bx, [bp+var_8]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1E63F
		mov	word ptr [bp+arg_0], ax
		mov	word ptr [bp+arg_0+2], dx
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		mov	ax, 0FFFFh
		push	ax
		call	sub_1E24D
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1DE95:				; CODE XREF: sub_1DD8F+B0j
		les	bx, [bp+arg_0]
		mov	al, [bp+var_1C]
		cmp	es:[bx], al
		jz	short loc_1DE41
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_1DEA5:				; CODE XREF: sub_1DD8F+AEj
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B063
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_1DEB5:				; CODE XREF: sub_1DD8F+23j
		mov	word_490A0, 0
		mov	ax, word ptr [bp+var_20]
		mov	dx, word ptr [bp+var_20+2]
		mov	sp, bp
		pop	bp
		retf	4
sub_1DD8F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1DEC7	proc far		; CODE XREF: sub_1632A+42p
					; sub_1CEB6+3Cp

var_1A		= dword	ptr -1Ah
var_16		= byte ptr -16h
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1Ah
		call	__chkstk
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1DEED
		jmp	loc_1DFA0
; ---------------------------------------------------------------------------

loc_1DEED:				; CODE XREF: sub_1DEC7+21j
		sub	ax, ax
		mov	word ptr [bp+var_1A+2],	ax
		mov	word ptr [bp+var_1A], ax
		mov	ax, 15h
		push	ax
		push	word_47346
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+var_1A], ax
		mov	word ptr [bp+var_1A+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_1A]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		les	bx, [bp+var_4]
		mov	es:[bx+4], ax
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		les	bx, [bp+var_4]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		les	bx, [bp+var_4]
		mov	es:[bx+6], ax
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx+8], 6
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+9], 0FF0h
		mov	word ptr es:[bx+0Bh], 0
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+0Fh], ax
		mov	es:[bx+0Dh], ax
		les	bx, [bp+var_4]
		mov	ax, word_4733A
		mov	dx, word_4733C
		mov	es:[bx+11h], ax
		mov	es:[bx+13h], dx
		mov	ax, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		mov	word_4733A, ax
		mov	word_4733C, dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B063
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_1DFA0:				; CODE XREF: sub_1DEC7+23j
		mov	word_490A0, 0
		mov	ax, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		mov	sp, bp
		pop	bp
		retf	4
sub_1DEC7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1DFB2	proc far		; CODE XREF: sub_1632A+50p
					; sub_1632A+13Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_1DFCD
		mov	ax, word_47348
		mov	dx, word_4734A
		jmp	short loc_1DFD3
; ---------------------------------------------------------------------------

loc_1DFCD:				; CODE XREF: sub_1DFB2+10j
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_1DFD3:				; CODE XREF: sub_1DFB2+19j
		mov	word ptr dword_4733E, ax
		mov	word ptr dword_4733E+2,	dx
		mov	word_490A0, 0
		pop	bp
		retf	4
sub_1DFB2	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	word ptr [bp+6]
		call	sub_1E34B
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		or	dx, ax
		jz	short loc_1E036
		push	word ptr [bp-2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		test	word ptr [bp+8], 8000h
		jz	short loc_1E01E
		les	bx, [bp-4]
		les	bx, es:[bx]
		mov	al, [bp+8]
		and	es:[bx+6], al
		jmp	short loc_1E02B
; ---------------------------------------------------------------------------

loc_1E01E:				; CODE XREF: seg000:E00Dj
		les	bx, [bp-4]
		les	bx, es:[bx]
		mov	al, [bp+8]
		or	es:[bx+6], al

loc_1E02B:				; CODE XREF: seg000:E01Cj
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1E036:				; CODE XREF: seg000:DFFDj
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E042	proc far		; CODE XREF: sub_1D11E+12p
					; sub_1D291+12p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_0]
		call	sub_1E423
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_1E094
		push	word ptr [bp+var_4+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		test	[bp+arg_2], 8000h
		jz	short loc_1E07C
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		mov	al, byte ptr [bp+arg_2]

loc_1E076:				; DATA XREF: sub_2D7F7+6C2r
		and	es:[bx+4], al
		jmp	short loc_1E089
; ---------------------------------------------------------------------------

loc_1E07C:				; CODE XREF: sub_1E042+29j
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		mov	al, byte ptr [bp+arg_2]
		or	es:[bx+4], al

loc_1E089:				; CODE XREF: sub_1E042+38j
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1E094:				; CODE XREF: sub_1E042+19j
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4
sub_1E042	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E0A0	proc far		; CODE XREF: sub_1C9A8+49p
					; sub_1C9A8+7Bp ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_0]
		call	sub_1E423
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_1E0DC
		push	word ptr [bp+var_4+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		mov	al, [bp+arg_2]
		mov	es:[bx+7], al
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1E0DC:				; CODE XREF: sub_1E0A0+19j
		mov	word_490A0, 0
		mov	sp, bp
		pop	bp
		retf	4
sub_1E0A0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E0E8	proc far		; CODE XREF: sub_1CDD7+1Ep

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	di
		push	[bp+arg_0]
		call	sub_1E423
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jz	short loc_1E142
		push	word ptr [bp+var_4+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+arg_2]
		lea	di, [bx+1]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		les	bx, [bp+arg_2]
		mov	es:[bx], cl
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		mov	ax, word ptr [bp+arg_2]
		mov	dx, word ptr [bp+arg_2+2]
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1E142:				; CODE XREF: sub_1E0E8+1Aj
		mov	word_490A0, 0
		pop	di
		mov	sp, bp
		pop	bp
		retf	6
sub_1E0E8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E14F	proc near		; CODE XREF: sub_1D5C5+33p

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		les	bx, [bp+arg_6]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		cmp	[bp+arg_0], 0
		jz	short loc_1E18D
		les	bx, [bp+var_10]
		mov	ax, es:[bx+0Dh]
		or	ax, es:[bx+0Fh]
		jnz	short loc_1E1B7

loc_1E18D:				; CODE XREF: sub_1E14F+2Fj
		les	bx, [bp+var_10]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		les	bx, [bp+var_C]
		mov	es:[bx+11h], ax
		mov	es:[bx+13h], dx	; DATA XREF: sub_2D7F7+92Er
		les	bx, [bp+var_10]
		mov	ax, word ptr [bp+arg_6]
		mov	dx, word ptr [bp+arg_6+2]
		mov	es:[bx+0Dh], ax
		mov	es:[bx+0Fh], dx
		jmp	loc_1E247
; ---------------------------------------------------------------------------

loc_1E1B7:				; CODE XREF: sub_1E14F+3Cj
		les	bx, [bp+var_10]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1E23A
; ---------------------------------------------------------------------------

loc_1E1C4:				; CODE XREF: sub_1E14F+F5j
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		les	bx, [bp+var_14]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, [bp+arg_0]
		cmp	es:[bx], ax
		jz	short loc_1E1FF
		mov	ax, [bp+var_4]
		or	ax, dx
		jnz	short loc_1E229

loc_1E1FF:				; CODE XREF: sub_1E14F+A7j
		les	bx, [bp+var_C]
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	es:[bx+11h], ax
		mov	es:[bx+13h], dx
		les	bx, [bp+var_14]
		mov	ax, word ptr [bp+arg_6]
		mov	dx, word ptr [bp+arg_6+2]
		mov	es:[bx+11h], ax
		mov	es:[bx+13h], dx
		sub	ax, ax
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax

loc_1E229:				; CODE XREF: sub_1E14F+AEj
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_1E23A:				; CODE XREF: sub_1E14F+73j
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jz	short loc_1E247
		jmp	loc_1E1C4
; ---------------------------------------------------------------------------

loc_1E247:				; CODE XREF: sub_1E14F+65j
					; sub_1E14F+F3j
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_1E14F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E24D	proc near		; CODE XREF: sub_1D61D+89p
					; sub_1DD8F+F8p

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		les	bx, [bp+arg_6]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		cmp	[bp+arg_0], 0
		jz	short loc_1E28B
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Dh]
		or	ax, es:[bx+0Fh]
		jnz	short loc_1E2B5

loc_1E28B:				; CODE XREF: sub_1E24D+2Fj
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		les	bx, [bp+var_14]
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx
		les	bx, [bp+var_C]
		mov	ax, word ptr [bp+arg_6]
		mov	dx, word ptr [bp+arg_6+2]
		mov	es:[bx+0Dh], ax
		mov	es:[bx+0Fh], dx
		jmp	loc_1E345
; ---------------------------------------------------------------------------

loc_1E2B5:				; CODE XREF: sub_1E24D+3Cj
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1E338
; ---------------------------------------------------------------------------

loc_1E2C2:				; CODE XREF: sub_1E24D+F5j
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		les	bx, [bp+var_10]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, [bp+arg_0]
		cmp	es:[bx], ax
		jz	short loc_1E2FD
		mov	ax, [bp+var_4]
		or	ax, dx
		jnz	short loc_1E327

loc_1E2FD:				; CODE XREF: sub_1E24D+A7j
		les	bx, [bp+var_14]
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx
		les	bx, [bp+var_10]
		mov	ax, word ptr [bp+arg_6]
		mov	dx, word ptr [bp+arg_6+2]
		mov	es:[bx+0Ch], ax
		mov	es:[bx+0Eh], dx
		sub	ax, ax
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax

loc_1E327:				; CODE XREF: sub_1E24D+AEj
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_1E338:				; CODE XREF: sub_1E24D+73j
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jz	short loc_1E345
		jmp	loc_1E2C2
; ---------------------------------------------------------------------------

loc_1E345:				; CODE XREF: sub_1E24D+65j
					; sub_1E24D+F3j
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_1E24D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E34B	proc near		; CODE XREF: sub_1CF25+Ep sub_1D414+Ep ...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		mov	ax, word_4733A
		mov	dx, word_4733C
		jmp	short loc_1E3DB
; ---------------------------------------------------------------------------

loc_1E35F:				; CODE XREF: sub_1E34B+5Fj
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_1E370:				; CODE XREF: sub_1E34B+CCj
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		or	ax, dx
		jz	short loc_1E3CA
		push	dx
		push	word ptr [bp+var_14]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_14]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+arg_0]
		cmp	es:[bx], ax
		jnz	short loc_1E35F
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_18+2]
		push	word ptr [bp+var_18]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		jmp	short loc_1E41D
; ---------------------------------------------------------------------------

loc_1E3CA:				; CODE XREF: sub_1E34B+2Dj
		push	word ptr [bp+var_18+2]
		push	word ptr [bp+var_18]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_E]

loc_1E3DB:				; CODE XREF: sub_1E34B+12j
		mov	word ptr [bp+var_18], ax
		mov	word ptr [bp+var_18+2],	dx
		or	ax, dx
		jz	short loc_1E41A
		push	dx
		push	word ptr [bp+var_18]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_18]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1E370
; ---------------------------------------------------------------------------

loc_1E41A:				; CODE XREF: sub_1E34B+98j
		sub	ax, ax
		cwd

loc_1E41D:				; CODE XREF: sub_1E34B+7Dj
		mov	sp, bp
		pop	bp
		retn	2
sub_1E34B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E423	proc near		; CODE XREF: seg000:D3B4p sub_1E042+Ep ...

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 24h	; '$'
		call	__chkstk
		mov	ax, word_4733A
		mov	dx, word_4733C
		jmp	loc_1E510
; ---------------------------------------------------------------------------

loc_1E438:				; CODE XREF: sub_1E423+60j
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_A]

loc_1E449:				; CODE XREF: sub_1E423+D9j
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		or	ax, dx
		jz	short loc_1E4AF
		push	dx
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_10]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	dx
		les	bx, [bp+var_24]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+arg_0]
		cmp	es:[bx], ax
		jnz	short loc_1E438
		push	word ptr [bp+var_10+2]
		push	word ptr [bp+var_10]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		jmp	loc_1E552
; ---------------------------------------------------------------------------

loc_1E4AF:				; CODE XREF: sub_1E423+2Ej
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_14]
		mov	dx, [bp+var_12]

loc_1E4C0:				; CODE XREF: sub_1E423+129j
		mov	word ptr [bp+var_1C], ax
		mov	word ptr [bp+var_1C+2],	dx
		or	ax, dx
		jz	short loc_1E4FF
		push	dx
		push	word ptr [bp+var_1C]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_1C]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1E449
; ---------------------------------------------------------------------------

loc_1E4FF:				; CODE XREF: sub_1E423+A5j
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]

loc_1E510:				; CODE XREF: sub_1E423+12j
		mov	word ptr [bp+var_20], ax
		mov	word ptr [bp+var_20+2],	dx
		or	ax, dx
		jz	short loc_1E54F
		push	dx
		push	word ptr [bp+var_20]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_20]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		les	bx, [bp+var_8]
		mov	ax, es:[bx+11h]
		mov	dx, es:[bx+13h]
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1E4C0
; ---------------------------------------------------------------------------

loc_1E54F:				; CODE XREF: sub_1E423+F5j
		sub	ax, ax
		cwd

loc_1E552:				; CODE XREF: sub_1E423+89j
		mov	sp, bp
		pop	bp
		retn	2
sub_1E423	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E558	proc near		; CODE XREF: sub_1DD8F+79p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		inc	ax
		mov	es:[bx+9], ax
		mov	es:[bx+0Bh], dx
		mov	ax, 5Ch	; '\'
		push	ax		; int
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		add	ax, 2
		push	dx
		push	ax		; char *
		call	_strchr
		add	sp, 6
		sub	ax, word ptr [bp+arg_4]
		sub	al, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]
		mov	al, es:[bx]
		cbw
		add	ax, 3
		add	word ptr [bp+arg_4], ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+9]
		mov	al, es:[bx]
		cbw
		mov	cl, 3
		shl	ax, cl
		inc	ax
		inc	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+7], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+6], 20h	; ' '
		jmp	short loc_1E5FC
; ---------------------------------------------------------------------------

loc_1E5D5:				; CODE XREF: sub_1E558+BFj
		inc	word ptr [bp+arg_4]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	far ptr	j___catox
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_1EB0E
		dec	ax
		add	word ptr [bp+arg_4], ax

loc_1E5F9:				; CODE XREF: sub_1E558+C6j
					; sub_1E558+D0j ...
		inc	word ptr [bp+arg_4]

loc_1E5FC:				; CODE XREF: sub_1E558+7Bj
		les	bx, [bp+arg_4]
		cmp	byte ptr es:[bx], 0
		jz	short loc_1E634
		cmp	byte ptr es:[bx], 0Dh
		jz	short loc_1E634
		mov	al, es:[bx]
		cbw
		cmp	ax, 44h	; 'D'
		jz	short loc_1E620
		cmp	ax, 4Eh	; 'N'
		jz	short loc_1E5D5
		cmp	ax, 58h	; 'X'
		jz	short loc_1E62A
		jmp	short loc_1E5F9
; ---------------------------------------------------------------------------

loc_1E620:				; CODE XREF: sub_1E558+BAj
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+6], 80h
		jmp	short loc_1E5F9
; ---------------------------------------------------------------------------

loc_1E62A:				; CODE XREF: sub_1E558+C4j
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+6], 0DFh
		jmp	short loc_1E5F9
; ---------------------------------------------------------------------------

loc_1E634:				; CODE XREF: sub_1E558+ABj
					; sub_1E558+B1j
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		inc	ax
		pop	bp
		retn	8
sub_1E558	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E63F	proc near		; CODE XREF: sub_1D61D+77p
					; sub_1DD8F+DFp

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		inc	ax
		mov	es:[bx+8], ax
		mov	es:[bx+0Ah], dx
		mov	ax, 5Ch	; '\'
		push	ax		; int
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		add	ax, 2
		push	dx
		push	ax		; char *
		call	_strchr
		add	sp, 6
		sub	ax, word ptr [bp+arg_4]
		sub	al, 2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	al, es:[bx]
		cbw
		add	ax, 3
		add	word ptr [bp+arg_4], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+4], 20h	; ' '
		les	bx, [bp+arg_0]
		sub	al, al
		mov	es:[bx+7], al
		les	bx, [bp+arg_0]
		mov	es:[bx+6], al
		les	bx, [bp+arg_0]
		mov	es:[bx+5], al
		jmp	short loc_1E6EB
; ---------------------------------------------------------------------------

loc_1E6C4:				; CODE XREF: sub_1E63F+150j
		inc	word ptr [bp+arg_4]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	far ptr	j___catox
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_1EB0E
		dec	ax
		add	word ptr [bp+arg_4], ax

loc_1E6E8:				; CODE XREF: sub_1E63F+DBj
					; sub_1E63F+FDj ...
		inc	word ptr [bp+arg_4]

loc_1E6EB:				; CODE XREF: sub_1E63F+83j
		les	bx, [bp+arg_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1E6F7
		jmp	loc_1E79F
; ---------------------------------------------------------------------------

loc_1E6F7:				; CODE XREF: sub_1E63F+B3j
		cmp	byte ptr es:[bx], 0Dh
		jnz	short loc_1E700
		jmp	loc_1E79F
; ---------------------------------------------------------------------------

loc_1E700:				; CODE XREF: sub_1E63F+BCj
		mov	al, es:[bx]
		cbw
		cmp	ax, 44h	; 'D'
		jz	short loc_1E75A
		jg	short loc_1E785
		cmp	ax, 2Ah	; '*'
		jz	short loc_1E71C
		cmp	ax, 42h	; 'B'
		jz	short loc_1E73E
		cmp	ax, 43h	; 'C'
		jz	short loc_1E748
		jmp	short loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E71C:				; CODE XREF: sub_1E63F+CFj
		inc	word ptr [bp+arg_4]
		mov	bx, word ptr [bp+arg_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+5], al
		inc	word ptr [bp+arg_4]
		les	bx, [bp+arg_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+6], al
		jmp	short loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E73E:				; CODE XREF: sub_1E63F+D4j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+2], 1
		jmp	short loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E748:				; CODE XREF: sub_1E63F+D9j
		inc	word ptr [bp+arg_4]
		les	bx, [bp+arg_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], al
		jmp	short loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E75A:				; CODE XREF: sub_1E63F+C8j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+4], 80h
		jmp	short loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E764:				; CODE XREF: sub_1E63F+149j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+2], 2
		jmp	loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E76F:				; CODE XREF: sub_1E63F+156j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+2], 4
		jmp	loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E77A:				; CODE XREF: sub_1E63F+15Bj
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+4], 40h
		jmp	loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E785:				; CODE XREF: sub_1E63F+CAj
		cmp	ax, 49h	; 'I'
		jz	short loc_1E764
		cmp	ax, 4Eh	; 'N'
		jnz	short loc_1E792
		jmp	loc_1E6C4
; ---------------------------------------------------------------------------

loc_1E792:				; CODE XREF: sub_1E63F+14Ej
		cmp	ax, 55h	; 'U'
		jz	short loc_1E76F
		cmp	ax, 56h	; 'V'
		jz	short loc_1E77A
		jmp	loc_1E6E8
; ---------------------------------------------------------------------------

loc_1E79F:				; CODE XREF: sub_1E63F+B5j
					; sub_1E63F+BEj
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		inc	ax
		pop	bp
		retn	8
sub_1E63F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E7AA	proc near		; CODE XREF: sub_1CF25+34p
					; sub_1D2AA+90p

var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_20483
		cmp	[bp+arg_6], 0
		jz	short loc_1E7DB
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_1E7CE
		jmp	loc_1E877
; ---------------------------------------------------------------------------

loc_1E7CE:				; CODE XREF: sub_1E7AA+1Fj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_1E7DB
		jmp	loc_1E877
; ---------------------------------------------------------------------------

loc_1E7DB:				; CODE XREF: sub_1E7AA+19j
					; sub_1E7AA+2Cj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		mov	[bp+var_12], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1E85E
; ---------------------------------------------------------------------------

loc_1E7F6:				; CODE XREF: sub_1E7AA+BCj
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		les	bx, [bp+var_16]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		les	bx, es:[bx+8]
		mov	al, es:[bx]
		cbw
		mov	cl, 3
		shl	ax, cl
		mov	[bp+var_18], ax
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], ax
		jnb	short loc_1E83E
		mov	es:[bx+2], ax

loc_1E83E:				; CODE XREF: sub_1E7AA+8Ej
		les	bx, [bp+var_16]
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_1E84D
		mov	[bp+var_12], 1

loc_1E84D:				; CODE XREF: sub_1E7AA+9Cj
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_1E85E:				; CODE XREF: sub_1E7AA+4Aj
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jnz	short loc_1E7F6
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_C]
		add	ax, 0Ch
		add	es:[bx+2], ax
		jmp	short loc_1E88D
; ---------------------------------------------------------------------------

loc_1E877:				; CODE XREF: sub_1E7AA+21j
					; sub_1E7AA+2Ej
		cmp	[bp+arg_6], 0
		jz	short loc_1E88D
		cmp	[bp+arg_6], 0FFFFh
		jz	short loc_1E88D
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	es:[bx+2], ax

loc_1E88D:				; CODE XREF: sub_1E7AA+CBj
					; sub_1E7AA+D1j ...
		cmp	[bp+arg_4], 0
		jz	short loc_1E8A3
		cmp	[bp+arg_4], 0FFFFh
		jnz	short loc_1E8C1
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4], 0
		jnz	short loc_1E8C1

loc_1E8A3:				; CODE XREF: sub_1E7AA+E7j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1E8DD
		mov	cx, ax
		mov	ax, [bp+var_10]
		add	ax, [bp+var_E]
		add	ax, [bp+var_A]
		inc	ax
		mul	cx
		inc	ax
		inc	ax
		les	bx, [bp+arg_0]
		jmp	short loc_1E8D3
; ---------------------------------------------------------------------------

loc_1E8C1:				; CODE XREF: sub_1E7AA+EDj
					; sub_1E7AA+F7j
		cmp	[bp+arg_4], 0
		jz	short loc_1E8D7
		cmp	[bp+arg_4], 0FFFFh
		jz	short loc_1E8D7
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]

loc_1E8D3:				; CODE XREF: sub_1E7AA+115j
		mov	es:[bx+4], ax

loc_1E8D7:				; CODE XREF: sub_1E7AA+11Bj
					; sub_1E7AA+121j
		mov	sp, bp
		pop	bp
		retn	8
sub_1E7AA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E8DD	proc near		; CODE XREF: sub_1E7AA+FFp

var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		mov	[bp+var_A], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	short loc_1E93A
; ---------------------------------------------------------------------------

loc_1E8FA:				; CODE XREF: sub_1E8DD+65j
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_E], ax
		mov	word ptr [bp+var_E+2], dx
		les	bx, [bp+var_E]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		inc	[bp+var_A]
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_1E93A:				; CODE XREF: sub_1E8DD+1Bj
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jnz	short loc_1E8FA
		mov	ax, [bp+var_A]
		mov	sp, bp
		pop	bp
		retn	4
sub_1E8DD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1E94D	proc near		; CODE XREF: sub_1D879+2BBp

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 20h	; ' '
		call	__chkstk
		call	sub_271BD
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1EB4F
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		call	sub_20483
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		add	ax, [bp+var_10]
		inc	ax
		mov	[bp+var_18], ax
		mov	ax, [bp+var_10]
		add	ax, [bp+var_E]
		add	ax, [bp+var_A]
		inc	ax
		mov	[bp+var_12], ax
		mov	ax, es:[bx]
		inc	ax
		mov	[bp+var_20], ax
		add	ax, [bp+var_12]
		mov	[bp+var_1C], ax
		mov	ax, es:[bx+2]
		inc	ax
		inc	ax
		mov	[bp+var_1E], ax
		mov	ax, es:[bx+6]
		dec	ax
		dec	ax
		mov	[bp+var_1A], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Dh]
		mov	dx, es:[bx+0Fh]
		jmp	loc_1EAA0
; ---------------------------------------------------------------------------

loc_1E9BD:				; CODE XREF: sub_1E94D+191j
					; sub_1E94D+1A2j
		les	bx, [bp+var_16]
		cmp	byte ptr es:[bx+7], 0
		jz	short loc_1E9E9
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 4
		push	ax
		push	[bp+var_18]
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		add	ax, 7
		push	dx
		push	ax
		mov	ax, 1
		push	ax
		call	sub_23537

loc_1E9E9:				; CODE XREF: sub_1E94D+78j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, [bp+var_C]
		add	ax, 4
		push	ax
		push	[bp+var_18]
		les	bx, [bp+var_16]
		mov	ax, es:[bx+8]
		mov	dx, es:[bx+0Ah]
		inc	ax
		push	dx
		push	ax
		les	bx, es:[bx+8]
		mov	al, es:[bx]
		cbw
		push	ax
		call	sub_23537
		les	bx, [bp+var_16]
		cmp	byte ptr es:[bx+5], 0
		jz	short loc_1EA44
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		sub	ax, [bp+var_C]
		dec	ax
		dec	ax
		push	ax
		push	[bp+var_18]
		mov	ax, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		add	ax, 5
		push	dx
		push	ax
		mov	ax, 1
		push	ax
		call	sub_23537

loc_1EA44:				; CODE XREF: sub_1E94D+D1j
		les	bx, [bp+var_16]
		test	byte ptr es:[bx+4], 40h
		jz	short loc_1EA5F
		push	[bp+arg_A]
		push	[bp+arg_8]
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		push	[bp+var_1C]

loc_1EA5C:				; CODE XREF: sub_1E94D+1B3j
		call	sub_1EBF1

loc_1EA5F:				; CODE XREF: sub_1E94D+FFj
		les	bx, [bp+var_16]
		test	byte ptr es:[bx+4], 80h
		jnz	short loc_1EA73
		les	bx, [bp+arg_4]
		test	byte ptr es:[bx+6], 80h
		jz	short loc_1EA7D

loc_1EA73:				; CODE XREF: sub_1E94D+11Aj
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		call	sub_23427

loc_1EA7D:				; CODE XREF: sub_1E94D+124j
		mov	ax, [bp+var_12]
		add	[bp+var_18], ax
		mov	ax, [bp+var_1C]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_12]
		add	[bp+var_1C], ax
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]

loc_1EAA0:				; CODE XREF: sub_1E94D+6Dj
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	ax, dx
		jz	short loc_1EB03
		push	dx
		push	word ptr [bp+var_8]
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		les	bx, [bp+var_16]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Eh]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx], 1
		jz	short loc_1EAE1
		jmp	loc_1E9BD
; ---------------------------------------------------------------------------

loc_1EAE1:				; CODE XREF: sub_1E94D+18Fj
		les	bx, [bp+var_16]
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx+1], 2Dh	; '-'
		jz	short loc_1EAF2
		jmp	loc_1E9BD
; ---------------------------------------------------------------------------

loc_1EAF2:				; CODE XREF: sub_1E94D+1A0j
		push	[bp+arg_A]
		push	[bp+arg_8]
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		push	[bp+var_18]
		jmp	loc_1EA5C
; ---------------------------------------------------------------------------

loc_1EB03:				; CODE XREF: sub_1E94D+15Bj
		call	sub_2711B
		mov	sp, bp
		pop	bp
		retn	0Ch
sub_1E94D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EB0E	proc near		; CODE XREF: sub_1E558+9Ap
					; sub_1E63F+A2p

var_2		= word ptr -2
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	di
		sub	cx, cx
		les	di, [bp+arg_0]
		jmp	short loc_1EB29
; ---------------------------------------------------------------------------

loc_1EB21:				; CODE XREF: sub_1EB0E+1Fj
		cmp	byte ptr es:[di], 39h ;	'9'
		jg	short loc_1EB2F
		inc	di
		inc	cx

loc_1EB29:				; CODE XREF: sub_1EB0E+11j
		cmp	byte ptr es:[di], 30h ;	'0'
		jge	short loc_1EB21

loc_1EB2F:				; CODE XREF: sub_1EB0E+17j
		mov	word ptr [bp+arg_0], di
		mov	word ptr [bp+arg_0+2], es
		mov	[bp+var_2], cx
		mov	ax, cx
		pop	di
		mov	sp, bp
		pop	bp
		retn	4
sub_1EB0E	endp

; ---------------------------------------------------------------------------

loc_1EB41:				; DATA XREF: sub_1CEB6+22o
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EB4F	proc near		; CODE XREF: sub_1D137+2Dp
					; sub_1E94D+1Cp

var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		call	sub_204CF
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1EBB5
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+0Bh]
		mov	cl, 14h
		call	__aFulshr
		and	ax, 0Fh
		push	ax
		call	sub_20B78
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_201CE
		mov	al, [bp+var_2]
		mov	byte_490A6, al
		mov	al, [bp+var_4]
		mov	byte_490B0, al
		mov	sp, bp
		pop	bp
		retn	8
sub_1EB4F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EBB5	proc near		; CODE XREF: sub_1D414+12Bp
					; sub_1EB4F+2Bp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		call	sub_20ADE
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+0Bh]
		mov	cl, 4
		call	__aFulshr
		and	ax, 0Fh
		push	ax
		call	sub_20B78
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_208DF
		pop	bp
		retn	8
sub_1EBB5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EBF1	proc near		; CODE XREF: sub_1E94D:loc_1EA5Cp

var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		lea	ax, [bp+var_4]
		push	ss
		push	ax
		call	sub_204CF
		sub	ax, ax
		push	ax
		call	sub_20ADE
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+0Bh]
		mov	cl, 14h
		call	__aFulshr
		and	ax, 0Fh
		push	ax
		call	sub_20B78
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx+6]
		mov	ax, [bp+arg_0]
		dec	ax
		push	ax
		call	sub_234FB
		mov	al, [bp+var_2]
		mov	byte_490A6, al
		mov	al, [bp+var_4]
		mov	byte_490B0, al
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_1EBF1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EC5A	proc near		; CODE XREF: sub_1ECB5+96p
					; sub_1ECB5+197p ...

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	di
		push	si

loc_1EC67:				; CODE XREF: sub_1EC5A+4Ej
		mov	ax, [bp+arg_0]
		dec	ax
		and	ax, 3Fh
		mov	[bp+var_2], ax
		les	bx, [bp+arg_6]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx], al
		inc	word ptr [bp+arg_6]
		inc	[bp+var_2]
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cx, [bp+var_2]
		mov	si, ax
		push	ds
		mov	ds, dx
		les	di, [bp+arg_6]
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, [bp+var_2]
		add	word ptr [bp+arg_6], ax
		add	[bp+arg_2], ax
		sub	[bp+arg_0], ax
		jnz	short loc_1EC67
		mov	ax, word ptr [bp+arg_6]
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_1EC5A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1ECB5	proc far		; CODE XREF: sub_286DF+33P

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, 1Eh
		call	__chkstk
		push	di
		push	si
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, [bp+arg_0]
		add	ax, word ptr [bp+var_4]
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		les	bx, [bp+arg_A]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		les	bx, [bp+arg_6]
		mov	ax, es:[bx]
		add	ax, word ptr [bp+var_10]
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		mov	ax, word ptr [bp+var_10]

loc_1ECFC:				; CODE XREF: sub_1ECB5+122j
		mov	[bp+var_14], ax
		mov	[bp+var_12], dx
		jmp	loc_1EEA8
; ---------------------------------------------------------------------------

loc_1ED05:				; CODE XREF: sub_1ECB5+60j
		les	bx, [bp+var_10]
		mov	al, [si]
		cmp	es:[bx], al
		jnz	short loc_1ED17
		inc	si

loc_1ED10:				; CODE XREF: sub_1ECB5+21Cj
		mov	ax, ds
		cmp	[bp+var_18], si
		ja	short loc_1ED05

loc_1ED17:				; CODE XREF: sub_1ECB5+58j
		mov	word ptr [bp+var_A], si
		mov	word ptr [bp+var_A+2], ds
		mov	ds, [bp+var_1E]
		mov	ax, si
		sub	ax, word ptr [bp+var_10]
		mov	[bp+var_6], ax
		cmp	ax, 2
		jg	short loc_1ED30
		jmp	loc_1EDDA
; ---------------------------------------------------------------------------

loc_1ED30:				; CODE XREF: sub_1ECB5+76j
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		cmp	[bp+var_14], ax
		jnb	short loc_1ED54
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	[bp+var_12]
		push	[bp+var_14]
		sub	ax, [bp+var_14]
		push	ax
		call	sub_1EC5A
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_1ED54:				; CODE XREF: sub_1ECB5+84j
		cmp	[bp+var_6], 4
		jz	short loc_1ED60
		cmp	[bp+var_6], 7
		jle	short loc_1EDAC

loc_1ED60:				; CODE XREF: sub_1ECB5+A3j
					; sub_1ECB5+EDj ...
		mov	ax, [bp+var_6]
		sar	ax, 1
		sar	ax, 1
		dec	ax
		and	ax, 3Fh
		mov	[bp+var_C], ax
		les	bx, [bp+var_4]
		mov	al, byte ptr [bp+var_C]
		or	al, 0C0h
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		les	bx, [bp+var_10]
		mov	al, es:[bx]
		les	bx, [bp+var_4]
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		mov	ax, [bp+var_C]
		shl	ax, 1
		shl	ax, 1
		add	ax, 4
		mov	[bp+var_C], ax
		add	word ptr [bp+var_10], ax
		sub	[bp+var_6], ax
		cmp	[bp+var_6], 4
		jz	short loc_1ED60
		cmp	[bp+var_6], 7
		jg	short loc_1ED60
		jmp	short loc_1EDD1
; ---------------------------------------------------------------------------

loc_1EDAC:				; CODE XREF: sub_1ECB5+A9j
		les	bx, [bp+var_4]
		mov	al, byte ptr [bp+var_6]
		dec	al
		or	al, 40h
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		les	bx, [bp+var_10]
		mov	al, es:[bx]
		les	bx, [bp+var_4]
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		mov	ax, [bp+var_6]
		add	word ptr [bp+var_10], ax

loc_1EDD1:				; CODE XREF: sub_1ECB5+F5j
					; sub_1ECB5+1EDj
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		jmp	loc_1ECFC
; ---------------------------------------------------------------------------

loc_1EDDA:				; CODE XREF: sub_1ECB5+78j
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		add	ax, 4
		mov	word ptr [bp+var_A], ax
		mov	word ptr [bp+var_A+2], dx
		jmp	short loc_1EE11
; ---------------------------------------------------------------------------

loc_1EDEB:				; CODE XREF: sub_1ECB5+168j
		mov	ax, word ptr [bp+var_A]
		mov	dx, word ptr [bp+var_A+2]
		mov	cx, 4
		mov	di, ax
		mov	es, dx
		push	ds
		lds	si, [bp+var_10]
		shr	cx, 1
		sbb	ax, ax
		cmp	cx, cx
		repe cmpsw
		jnz	short loc_1EE0A
		sub	cx, ax
		repe cmpsb

loc_1EE0A:				; CODE XREF: sub_1ECB5+14Fj
		pop	ds
		jnz	short loc_1EE1F
		add	word ptr [bp+var_A], 4

loc_1EE11:				; CODE XREF: sub_1ECB5+134j
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sub	ax, 3
		cmp	ax, word ptr [bp+var_A]
		ja	short loc_1EDEB

loc_1EE1F:				; CODE XREF: sub_1ECB5+156j
		mov	ax, word ptr [bp+var_A]
		sub	ax, word ptr [bp+var_10]
		sar	ax, 1
		sar	ax, 1
		dec	ax
		mov	[bp+var_6], ax
		or	ax, ax
		jz	short loc_1EEA5
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		cmp	[bp+var_14], ax
		jnb	short loc_1EE55
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	[bp+var_12]
		push	[bp+var_14]
		sub	ax, [bp+var_14]
		push	ax
		call	sub_1EC5A
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_1EE55:				; CODE XREF: sub_1ECB5+185j
		mov	ax, [bp+var_6]
		shl	ax, 1
		shl	ax, 1
		add	word ptr [bp+var_10], ax

loc_1EE5F:				; CODE XREF: sub_1ECB5+1E7j
		mov	ax, [bp+var_6]
		and	ax, 3Fh
		mov	[bp+var_C], ax
		les	bx, [bp+var_4]
		mov	al, byte ptr [bp+var_C]
		or	al, 80h
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	cx, 4
		mov	si, ax
		push	ds
		mov	ds, dx
		les	di, [bp+var_4]
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		add	word ptr [bp+var_4], 4
		mov	ax, [bp+var_C]
		sub	[bp+var_6], ax
		jnz	short loc_1EE5F
		add	word ptr [bp+var_10], 4
		jmp	loc_1EDD1
; ---------------------------------------------------------------------------

loc_1EEA5:				; CODE XREF: sub_1ECB5+17Aj
		inc	word ptr [bp+var_10]

loc_1EEA8:				; CODE XREF: sub_1ECB5+4Dj
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		cmp	word ptr [bp+var_10], ax
		jnb	short loc_1EED4
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]
		cmp	word ptr [bp+var_4], ax
		jnb	short loc_1EED4
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		inc	ax
		mov	word ptr [bp+var_A], ax
		mov	word ptr [bp+var_A+2], dx
		mov	[bp+var_1E], ds
		lds	si, [bp+var_A]
		jmp	loc_1ED10
; ---------------------------------------------------------------------------

loc_1EED4:				; CODE XREF: sub_1ECB5+1FCj
					; sub_1ECB5+207j
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		cmp	[bp+var_14], ax
		jnb	short loc_1EEF8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	[bp+var_12]
		push	[bp+var_14]
		sub	ax, [bp+var_14]
		push	ax
		call	sub_1EC5A
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_1EEF8:				; CODE XREF: sub_1ECB5+228j
		mov	ax, word ptr [bp+var_10]
		les	bx, [bp+arg_A]
		sub	ax, es:[bx]
		les	bx, [bp+arg_6]
		sub	es:[bx], ax
		les	bx, [bp+arg_A]
		mov	ax, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		mov	ax, word ptr [bp+var_4]
		sub	ax, [bp+arg_2]
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	0Eh
sub_1ECB5	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EF26	proc far		; CODE XREF: sub_1A6F0+28p
					; sub_2355E+26P ...

var_A		= word ptr -0Ah
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	ds
		push	es
		push	di
		push	si
		les	bx, [bp+arg_4]
		mov	di, es:[bx]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		add	ax, di
		mov	[bp+var_A], ax
		mov	es, dx
		lds	si, [bp+arg_A]

loc_1EF4A:				; CODE XREF: sub_1EF26+41j
					; sub_1EF26+46j ...
		cmp	di, [bp+var_A]
		jb	short loc_1EF52
		jmp	short loc_1EF83
; ---------------------------------------------------------------------------
		align 2

loc_1EF52:				; CODE XREF: sub_1EF26+27j
		lodsb
		mov	cl, al
		and	cx, 3Fh
		inc	cx
		and	al, 0C0h
		jz	short loc_1EF65
		shl	al, 1
		jnb	short loc_1EF69
		jns	short loc_1EF6E
		jmp	short loc_1EF7A
; ---------------------------------------------------------------------------

loc_1EF65:				; CODE XREF: sub_1EF26+35j
		rep movsb
		jmp	short loc_1EF4A
; ---------------------------------------------------------------------------

loc_1EF69:				; CODE XREF: sub_1EF26+39j
		lodsb
		rep stosb
		jmp	short loc_1EF4A
; ---------------------------------------------------------------------------

loc_1EF6E:				; CODE XREF: sub_1EF26+3Bj
					; sub_1EF26+4Dj
		movsw
		movsw
		sub	si, 4
		loop	loc_1EF6E
		add	si, 4
		jmp	short loc_1EF4A
; ---------------------------------------------------------------------------

loc_1EF7A:				; CODE XREF: sub_1EF26+3Dj
		shl	cx, 1
		lodsb
		mov	ah, al
		rep stosw
		jmp	short loc_1EF4A
; ---------------------------------------------------------------------------

loc_1EF83:				; CODE XREF: sub_1EF26+29j
		les	bx, [bp+arg_0]
		sub	di, [bp+var_A]
		mov	es:[bx], di
		sub	ax, ax
		pop	si
		pop	di
		pop	es
		pop	ds
		mov	sp, bp
		pop	bp
		retf	0Eh
sub_1EF26	endp

; ---------------------------------------------------------------------------
		db 90h
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1EF9A	proc far		; CODE XREF: sub_1C5B3+294p

var_AC		= dword	ptr -0ACh
var_94		= byte ptr -94h

		push	bp
		mov	bp, sp
		mov	ax, 0ACh ; '�'
		call	__chkstk
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_196F2
		call	sub_1F070
		mov	word ptr [bp+var_AC+2],	ax
		or	ax, ax
		jnz	short loc_1EFC7
		mov	ax, 12C4h
		push	ds
		push	ax
		call	sub_250FA

loc_1EFC1:				; CODE XREF: sub_1EF9A+4Cj
		mov	ax, 0FFFFh
		jmp	loc_1F06A
; ---------------------------------------------------------------------------

loc_1EFC7:				; CODE XREF: sub_1EF9A+1Bj
		mov	ax, 6
		push	ax
		mov	ax, 1B36h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 12CAh
		push	ds
		push	ax
		lea	ax, [bp-0A8h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_17C4E
		or	ax, ax
		jz	short loc_1EFC1
		lea	di, [bp+var_94]
		mov	ax, ss
		mov	es, ax
		mov	si, word ptr [bp+var_AC+2]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ax, 6
		push	ax
		nop
		push	cs
		call	near ptr sub_197B5
		mov	word ptr [bp+var_AC], 0C3ECh

loc_1F01E:				; CODE XREF: sub_1EF9A+BAj
		mov	bx, word ptr [bp+var_AC]
		cmp	word ptr [bx+97h], 0
		jz	short loc_1F048
		push	ds
		push	bx		; char *
		push	ds
		push	word ptr [bp+var_AC+2] ; char *
		call	sub_2315F
		or	ax, ax
		jnz	short loc_1F048
		mov	ax, word ptr [bp+var_AC]

loc_1F03D:				; CODE XREF: sub_1EF9A+CEj
		sub	ax, 0C3ECh
		cwd
		mov	cx, 0BBh ; '�'
		idiv	cx
		jmp	short loc_1F06A
; ---------------------------------------------------------------------------

loc_1F048:				; CODE XREF: sub_1EF9A+8Dj
					; sub_1EF9A+9Dj
		add	word ptr [bp+var_AC], 0BBh ; '�'
		cmp	word ptr [bp+var_AC], 0CBF5h
		jb	short loc_1F01E
		push	word ptr [bp+var_AC+2]
		push	cs
		call	near ptr sub_1F31A
		mov	word_4B39E, 1
		mov	ax, word ptr [bp+var_AC+2]
		jmp	short loc_1F03D
; ---------------------------------------------------------------------------

loc_1F06A:				; CODE XREF: sub_1EF9A+2Aj
					; sub_1EF9A+ACj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_1EF9A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F070	proc near		; CODE XREF: sub_1EF9A+12p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	cx, 0C3ECh

loc_1F07E:				; CODE XREF: sub_1F070+26j
		mov	bx, cx
		cmp	word ptr [bx+97h], 0
		jnz	short loc_1F08E
		mov	ax, cx
		mov	[bp+var_2], cx
		jmp	short loc_1F0A2
; ---------------------------------------------------------------------------

loc_1F08E:				; CODE XREF: sub_1F070+15j
		add	cx, 0BBh ; '�'
		cmp	cx, 0CBF5h
		jb	short loc_1F07E
		mov	[bp+var_2], cx
		sub	ax, ax
		push	ax
		push	cs
		call	near ptr sub_1F192

loc_1F0A2:				; CODE XREF: sub_1F070+1Cj
		mov	sp, bp
		pop	bp
		retn
sub_1F070	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F0A6	proc far		; CODE XREF: sub_18143+71p
					; sub_1F192+138p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	bx, [bp+arg_0]
		cmp	word ptr [bx+97h], 0
		jz	short loc_1F0C5
		push	ds
		push	bx
		call	sub_1F0C9
		push	[bp+arg_0]
		call	sub_1F104

loc_1F0C5:				; CODE XREF: sub_1F0A6+12j
		pop	bp
		retf	2
sub_1F0A6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F0C9	proc near		; CODE XREF: sub_1F0A6+16p
					; sub_1F764+3Ep

arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		assume es:nothing
		mov	ax, es:[bx+93h]
		or	ax, es:[bx+95h]
		jz	short loc_1F100
		push	word ptr es:[bx+95h]
		push	word ptr es:[bx+93h]
		nop
		push	cs
		call	near ptr sub_1AEAD
		les	bx, [bp+arg_0]
		sub	ax, ax
		mov	es:[bx+95h], ax
		mov	es:[bx+93h], ax

loc_1F100:				; CODE XREF: sub_1F0C9+17j
		pop	bp
		retn	4
sub_1F0C9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F104	proc near		; CODE XREF: sub_1F0A6+1Cp
					; sub_1F616+95p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		mov	bx, [bp+arg_0]
		mov	ax, bx
		cmp	[bx+99h], ax
		jnz	short loc_1F122
		mov	word_4B486, 0
		jmp	short loc_1F155
; ---------------------------------------------------------------------------

loc_1F122:				; CODE XREF: sub_1F104+14j
		mov	bx, [bx+99h]
		mov	si, [bp+arg_0]
		mov	ax, [si+9Bh]
		mov	[bx+9Bh], ax
		mov	bx, [bp+arg_0]
		mov	bx, [bx+9Bh]
		mov	si, [bp+arg_0]
		mov	ax, [si+99h]
		mov	[bx+99h], ax
		mov	ax, word_4B486
		cmp	[bp+arg_0], ax
		jnz	short loc_1F155
		mov	bx, [bp+arg_0]
		mov	ax, [bx+99h]
		mov	word_4B486, ax

loc_1F155:				; CODE XREF: sub_1F104+1Cj
					; sub_1F104+45j
		mov	ax, [bp+arg_0]
		sub	ax, 0C3ECh
		cwd
		mov	cx, 0BBh ; '�'
		idiv	cx
		add	ah, 6
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF96
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 6
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+97h], 0
		mov	bx, [bp+arg_0]
		sub	ax, ax
		mov	[bx+95h], ax
		mov	[bx+93h], ax
		pop	si
		pop	bp
		retn	2
sub_1F104	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F192	proc far		; CODE XREF: sub_1800D+4Bp
					; sub_1F070+2Fp

var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= byte ptr -0Ch
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1Ch
		call	__chkstk
		push	di
		push	si
		mov	[bp+var_1C], 0
		lea	ax, [bp+var_C]
		mov	cx, 0Bh
		mov	di, ax
		push	ss
		pop	es
		sub	ax, ax
		repne stosb
		mov	dx, es
		mov	[bp+var_14], ax
		jmp	short loc_1F21C
; ---------------------------------------------------------------------------

loc_1F1B9:				; CODE XREF: sub_1F192+90j
		cmp	[bp+var_1C], 0Bh
		jge	short loc_1F224
		mov	bx, [bp+var_14]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_1A], ax
		mov	word ptr [bp+var_1A+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_1A]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		dec	ax
		mov	[bp+var_12], ax
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_12], 0
		jl	short loc_1F219
		mov	si, [bp+var_12]
		cmp	[bp+si+var_C], 0
		jnz	short loc_1F219
		mov	[bp+si+var_C], 1
		inc	[bp+var_1C]

loc_1F219:				; CODE XREF: sub_1F192+75j
					; sub_1F192+7Ej
		inc	[bp+var_14]

loc_1F21C:				; CODE XREF: sub_1F192+25j
		mov	ax, word_490B8
		cmp	[bp+var_14], ax
		jle	short loc_1F1B9

loc_1F224:				; CODE XREF: sub_1F192+2Bj
		mov	[bp+var_14], 0
		jmp	short loc_1F291
; ---------------------------------------------------------------------------

loc_1F22B:				; CODE XREF: sub_1F192+105j
		cmp	[bp+var_1C], 0Bh
		jge	short loc_1F299
		mov	bx, [bp+var_14]
		shl	bx, 1
		shl	bx, 1
		les	si, dword_4E93A
		mov	ax, es:[bx+si]
		mov	dx, es:[bx+si+2]
		mov	word ptr [bp+var_1A], ax
		mov	word ptr [bp+var_1A+2],	dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_1A]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		dec	ax
		mov	[bp+var_12], ax
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		nop
		push	cs
		call	near ptr sub_1B063
		cmp	[bp+var_12], 0
		jl	short loc_1F28E
		mov	si, [bp+var_12]
		cmp	[bp+si+var_C], 0
		jnz	short loc_1F28E
		mov	[bp+si+var_C], 1
		inc	[bp+var_1C]

loc_1F28E:				; CODE XREF: sub_1F192+EAj
					; sub_1F192+F3j
		inc	[bp+var_14]

loc_1F291:				; CODE XREF: sub_1F192+97j
		mov	ax, word_4B396
		cmp	[bp+var_14], ax
		jle	short loc_1F22B

loc_1F299:				; CODE XREF: sub_1F192+9Dj
		cmp	[bp+var_1C], 0Bh
		jge	short loc_1F310
		mov	ax, word_4B486
		mov	[bp+var_16], ax
		or	ax, ax
		jz	short loc_1F310
		cmp	[bp+arg_0], 0
		jz	short loc_1F2DE
		mov	[bp+var_16], 0C3ECh
		lea	ax, [bp+var_C]
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	ss

loc_1F2BD:				; CODE XREF: sub_1F192+14Aj
		les	bx, [bp+var_10]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1F2CD
		push	[bp+var_16]
		push	cs
		call	near ptr sub_1F0A6

loc_1F2CD:				; CODE XREF: sub_1F192+132j
		add	[bp+var_16], 0BBh ; '�'
		inc	word ptr [bp+var_10]
		cmp	[bp+var_16], 0CBF5h
		jnb	short loc_1F310
		jmp	short loc_1F2BD
; ---------------------------------------------------------------------------

loc_1F2DE:				; CODE XREF: sub_1F192+11Bj
					; sub_1F192+17Cj
		mov	ax, [bp+var_16]
		sub	ax, 0C3ECh
		cwd
		mov	cx, 0BBh ; '�'
		idiv	cx
		mov	si, ax
		cmp	[bp+si+var_C], 0
		jnz	short loc_1F2FE
		push	[bp+var_16]
		push	cs
		call	near ptr sub_1F0A6
		mov	ax, [bp+var_16]
		jmp	short loc_1F312
; ---------------------------------------------------------------------------

loc_1F2FE:				; CODE XREF: sub_1F192+15Ej
		mov	bx, [bp+var_16]
		mov	ax, [bx+99h]
		mov	[bp+var_16], ax
		mov	ax, word_4B486
		cmp	[bp+var_16], ax
		jnz	short loc_1F2DE

loc_1F310:				; CODE XREF: sub_1F192+10Bj
					; sub_1F192+115j ...
		sub	ax, ax

loc_1F312:				; CODE XREF: sub_1F192+16Aj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	2
sub_1F192	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F31A	proc far		; CODE XREF: sub_18844+39Dp
					; sub_1EF9A+C1p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		push	ds
		push	word ptr [bp+arg_0] ; char *
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9Dh	; '�'
		push	ds		; int
		push	ax
		mov	ax, word ptr [bp+arg_0]
		sub	ax, 0C3ECh
		cwd
		mov	cx, 0BBh ; '�'
		idiv	cx
		add	ah, 6
		push	ax		; __int32
		sub	ax, ax
		push	ax		; int
		call	sub_2B7A7
		cmp	word_4B486, 0
		jz	short loc_1F385
		mov	bx, word ptr [bp+arg_0]
		mov	si, word_4B486
		mov	ax, [si+9Bh]
		mov	[bx+9Bh], ax
		mov	bx, word ptr [bp+arg_0]
		mov	ax, word_4B486
		mov	[bx+99h], ax
		mov	bx, word_4B486
		mov	bx, [bx+9Bh]
		mov	ax, word ptr [bp+arg_0]
		mov	[bx+99h], ax
		mov	bx, word_4B486
		mov	ax, word ptr [bp+arg_0]
		mov	[bx+9Bh], ax
		jmp	short loc_1F397
; ---------------------------------------------------------------------------

loc_1F385:				; CODE XREF: sub_1F31A+34j
		mov	ax, word ptr [bp+arg_0]
		mov	word_4B486, ax
		mov	bx, ax
		mov	si, ax
		mov	[si+9Bh], ax
		mov	[bx+99h], ax

loc_1F397:				; CODE XREF: sub_1F31A+69j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9Dh	; '�'
		push	ds
		push	ax
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 6
		push	ax
		nop
		push	cs
		call	near ptr sub_1D61D
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 6
		push	ax
		nop
		push	cs
		call	near ptr sub_1CF25
		mov	bx, word ptr [bp+arg_0]
		mov	word ptr [bx+97h], 1
		pop	si
		pop	bp
		retf	2
sub_1F31A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F3C7	proc far		; CODE XREF: sub_1C5B3+2A8p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		mov	[bp+var_2], ax
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		nop
		push	cs
		call	near ptr sub_1B063
		mov	ax, [bp+var_2]
		dec	ax
		cmp	ax, [bp+arg_0]
		jz	short loc_1F452
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		cmp	[bx-5B54h], ax
		jnz	short loc_1F443
		cmp	[bx-5B52h], dx
		jnz	short loc_1F443
		call	sub_278A3
		or	ax, ax
		jz	short loc_1F44B

loc_1F443:				; CODE XREF: sub_1F3C7+6Bj
					; sub_1F3C7+71j
		push	[bp+arg_0]
		call	sub_1F45E
		jmp	short loc_1F458
; ---------------------------------------------------------------------------

loc_1F44B:				; CODE XREF: sub_1F3C7+7Aj
		call	sub_25213
		jmp	short loc_1F458
; ---------------------------------------------------------------------------

loc_1F452:				; CODE XREF: sub_1F3C7+56j
		mov	word_4E942, 1

loc_1F458:				; CODE XREF: sub_1F3C7+82j
					; sub_1F3C7+89j
		mov	sp, bp
		pop	bp
		retf	2
sub_1F3C7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F45E	proc near		; CODE XREF: sub_1F3C7+7Fp

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1CDD7
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1CD6A
		push	word_490A4
		push	word_490A2	; void *
		call	sub_2AA92
		push	word_490A4
		push	word_490A2
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, byte ptr [bp+arg_0]
		inc	al
		mov	es:[bx+3], al
		push	word_490A4
		push	word_490A2	; void *
		call	sub_2A9F9
		cmp	[bp+arg_0], 0FFFFh
		jnz	short loc_1F4C0
		push	word_4DFA0
		push	word_4DFA0
		call	sub_2AFC2

loc_1F4C0:				; CODE XREF: sub_1F45E+53j
		mov	ax, 1
		push	ax
		nop
		push	cs
		call	near ptr sub_1CD6A
		pop	bp
		retn	2
sub_1F45E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F4CD	proc far		; CODE XREF: sub_1C5B3+2AFp

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx-5B54h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		mov	[bp+var_4], ax
		mov	ax, word_4DFA0
		inc	ax
		mov	[bp+var_2], ax
		jmp	short loc_1F509
; ---------------------------------------------------------------------------

loc_1F506:				; CODE XREF: sub_1F4CD+66j
		inc	[bp+var_2]

loc_1F509:				; CODE XREF: sub_1F4CD+37j
		mov	ax, word_490B8
		cmp	[bp+var_2], ax
		jg	short loc_1F53F
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx-5B54h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, byte ptr [bp+var_4]
		cmp	es:[bx+3], al
		jz	short loc_1F506
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr sub_14185
		jmp	short loc_1F569
; ---------------------------------------------------------------------------

loc_1F53F:				; CODE XREF: sub_1F4CD+42j
		dec	word_46CA0
		js	short loc_1F558
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_1F569
; ---------------------------------------------------------------------------

loc_1F558:				; CODE XREF: sub_1F4CD+76j
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6

loc_1F569:				; CODE XREF: sub_1F4CD+70j
					; sub_1F4CD+89j
		mov	sp, bp
		pop	bp
		retf
sub_1F4CD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F56D	proc far		; CODE XREF: sub_1C5B3+2B6p

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	ax, word_4DFA0
		dec	ax
		mov	[bp+var_2], ax
		jmp	short loc_1F5BD
; ---------------------------------------------------------------------------

loc_1F581:				; CODE XREF: sub_1F56D+56j
		mov	ax, 0FFFFh

loc_1F584:				; CODE XREF: sub_1F56D+79j
		mov	[bp+var_4], ax
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx-5B54h]
		assume es:nothing
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		mov	[bp+var_6], ax
		cmp	[bp+var_4], ax
		jz	short loc_1F5BA
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr sub_14185
		jmp	short loc_1F612
; ---------------------------------------------------------------------------

loc_1F5BA:				; CODE XREF: sub_1F56D+41j
		dec	[bp+var_2]

loc_1F5BD:				; CODE XREF: sub_1F56D+12j
		cmp	[bp+var_2], 0
		jl	short loc_1F5E8
		jz	short loc_1F581
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		les	bx, [bx-5B58h]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+3]
		sub	ah, ah
		jmp	short loc_1F584
; ---------------------------------------------------------------------------

loc_1F5E8:				; CODE XREF: sub_1F56D+54j
		dec	word_46CA0
		js	short loc_1F601
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_1F612
; ---------------------------------------------------------------------------

loc_1F601:				; CODE XREF: sub_1F56D+7Fj
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6

loc_1F612:				; CODE XREF: sub_1F56D+4Bj
					; sub_1F56D+92j
		mov	sp, bp
		pop	bp
		retf
sub_1F56D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F616	proc far		; CODE XREF: sub_185CA+1F6p

var_16		= dword	ptr -16h
var_12		= byte ptr -12h
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 16h
		call	__chkstk
		mov	bx, word ptr [bp+arg_0]
		cmp	word ptr [bx+97h], 0
		jnz	short loc_1F62E
		jmp	loc_1F6AE
; ---------------------------------------------------------------------------

loc_1F62E:				; CODE XREF: sub_1F616+13j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1F676
		mov	ax, 97h	; '�'
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	bx, word_422C4
		shl	bx, 1
		shl	bx, 1
		mov	[bx+636Eh], ax
		mov	[bx+6370h], dx
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_1F67F
; ---------------------------------------------------------------------------

loc_1F676:				; CODE XREF: sub_1F616+2Ej
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1F0A6
		jmp	short loc_1F6AE
; ---------------------------------------------------------------------------

loc_1F67F:				; CODE XREF: sub_1F616+5Ej
		inc	word_422C4
		mov	ax, 97h	; '�'
		push	ax		; size_t
		push	ds
		push	word ptr [bp+arg_0] ; void *
		les	bx, [bp+var_16]
		assume es:nothing
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		call	_memmove
		add	sp, 0Ah
		push	word ptr [bp+var_16+2]
		push	word ptr [bp+var_16]
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr [bp+arg_0]
		call	sub_1F104

loc_1F6AE:				; CODE XREF: sub_1F616+15j
					; sub_1F616+67j
		mov	sp, bp
		pop	bp
		retf	2
sub_1F616	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F6B4	proc far		; CODE XREF: sub_18844+372p
					; sub_18844+391p

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		mov	[bp+var_6], 0
		jmp	short loc_1F6D4
; ---------------------------------------------------------------------------

loc_1F6C6:				; CODE XREF: sub_1F6B4+6Aj
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		nop
		push	cs
		call	near ptr sub_1B063

loc_1F6D1:				; CODE XREF: sub_1F6B4+3Fj
		inc	[bp+var_6]

loc_1F6D4:				; CODE XREF: sub_1F6B4+10j
		mov	ax, word_422C4
		cmp	[bp+var_6], ax
		jnb	short loc_1F75B
		mov	bx, [bp+var_6]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx+636Eh]
		mov	dx, [bx+6370h]
		mov	word ptr [bp+var_A], ax
		mov	word ptr [bp+var_A+2], dx
		or	dx, ax
		jz	short loc_1F6D1
		push	word ptr [bp+var_A+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_A]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		push	ds
		push	word ptr [bp+arg_0] ; char *
		push	dx
		push	ax		; char *
		call	_stricmp
		add	sp, 8
		or	ax, ax
		jnz	short loc_1F6C6
		mov	ax, 97h	; '�'
		push	ax		; size_t
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; void *
		push	ds
		push	word ptr [bp+arg_0] ; void *
		call	_memmove
		add	sp, 0Ah
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1F31A
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		nop
		push	cs
		call	near ptr sub_1AEAD
		mov	bx, [bp+var_6]
		shl	bx, 1
		shl	bx, 1
		sub	ax, ax
		mov	[bx+6370h], ax
		mov	[bx+636Eh], ax
		jmp	short loc_1F75E
; ---------------------------------------------------------------------------

loc_1F75B:				; CODE XREF: sub_1F6B4+26j
		mov	ax, 0FFFFh

loc_1F75E:				; CODE XREF: sub_1F6B4+A5j
		mov	sp, bp
		pop	bp
		retf	2
sub_1F6B4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F764	proc far		; CODE XREF: sub_18844+3B5p
					; sub_18D10+1Dp

var_6		= dword	ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	[bp+var_2], 0
		jmp	short loc_1F7B3
; ---------------------------------------------------------------------------

loc_1F776:				; CODE XREF: sub_1F764+55j
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx+636Eh]
		mov	dx, [bx+6370h]
		mov	word ptr [bp+var_6], ax
		mov	word ptr [bp+var_6+2], dx
		or	dx, ax
		jz	short loc_1F7B0
		push	word ptr [bp+var_6+2]
		push	ax
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, [bp+var_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	sub_1F0C9
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		nop
		push	cs
		call	near ptr sub_1AEAD

loc_1F7B0:				; CODE XREF: sub_1F764+29j
		inc	[bp+var_2]

loc_1F7B3:				; CODE XREF: sub_1F764+10j
		mov	ax, word_422C4
		cmp	[bp+var_2], ax
		jb	short loc_1F776
		mov	word_422C4, 0
		mov	sp, bp
		pop	bp
		retf
sub_1F764	endp


; =============== S U B	R O U T	I N E =======================================


sub_1F7C5	proc far		; CODE XREF: sub_18DDC+16Dp
					; sub_18DDC+1DDp ...
		xor	ax, ax
		call	__chkstk
		mov	word_465C8, 2
		retf
sub_1F7C5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_1F7D3(int, int, __int32, char *)
sub_1F7D3	proc near		; CODE XREF: sub_1F99F+1Dp
					; sub_1F9CE+40p ...

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 1Eh
		call	__chkstk
		mov	word_4E948, 1

loc_1F7E4:				; CODE XREF: sub_1F7D3+4Dj
		mov	ax, 8000h
		push	ax		; int
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8] ; char *
		call	_open
		add	sp, 6
		mov	[bp+var_6], ax
		or	ax, ax
		jge	short loc_1F827
		call	sub_2346E
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8] ; char *
		sub	ax, ax
		push	ax		; int
		mov	ax, 1
		push	ax		; int
		call	sub_25317
		mov	[bp+var_8], ax
		call	sub_2348E
		cmp	[bp+var_8], 2
		jnz	short loc_1F7E4

loc_1F822:				; CODE XREF: sub_1F7D3+118j
		sub	ax, ax
		jmp	loc_1F8FC
; ---------------------------------------------------------------------------

loc_1F827:				; CODE XREF: sub_1F7D3+28j
		mov	word_4E948, 0
		push	[bp+var_6]	; int
		call	_filelength
		add	sp, 2
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1F888
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		add	ax, 2
		adc	dx, 0
		push	dx
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1F902
		les	bx, [bp+arg_4]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_1F898
; ---------------------------------------------------------------------------

loc_1F888:				; CODE XREF: sub_1F7D3+81j
		push	[bp+var_6]	; int
		call	_close
		add	sp, 2
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_1F898:				; CODE XREF: sub_1F7D3+B3j
		les	bx, [bp+arg_4]
		les	bx, es:[bx]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		add	ax, 0Fh
		and	al, 0F0h
		mov	[bp+var_1E], ax
		mov	[bp+var_1C], dx
		push	[bp+var_4]	; unsigned int
		push	dx
		push	ax		; void *
		push	[bp+var_6]	; int
		call	_read
		add	sp, 8
		cmp	[bp+var_4], ax
		jz	short loc_1F8EE
		push	[bp+var_6]	; int
		call	_close
		add	sp, 2
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_1AEAD
		les	bx, [bp+arg_4]
		sub	ax, ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		jmp	loc_1F822
; ---------------------------------------------------------------------------

loc_1F8EE:				; CODE XREF: sub_1F7D3+F0j
		push	[bp+var_6]	; int
		call	_close
		add	sp, 2
		mov	ax, [bp+var_4]

loc_1F8FC:				; CODE XREF: sub_1F7D3+51j
		mov	sp, bp
		pop	bp
		retn	0Ch
sub_1F7D3	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F902	proc near		; CODE XREF: sub_1F7D3+A1p
					; sub_1FAA3+6Cp

var_12		= byte ptr -12h
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 12h
		call	__chkstk
		mov	ax, word ptr [bp+arg_8]
		or	ax, word ptr [bp+arg_8+2]
		jz	short loc_1F921
		les	bx, [bp+arg_8]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jnz	short loc_1F993

loc_1F921:				; CODE XREF: sub_1F902+11j
		mov	ax, word ptr [bp+arg_8]
		or	ax, word ptr [bp+arg_8+2]
		jz	short loc_1F93D
		push	word ptr [bp+arg_8+2]
		push	word ptr [bp+arg_8]
		nop
		push	cs
		call	near ptr sub_1B4C0
		cmp	word_490A0, 0
		jz	short loc_1F993
		jmp	short loc_1F98E
; ---------------------------------------------------------------------------

loc_1F93D:				; CODE XREF: sub_1F902+25j
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1F97A
		mov	ax, [bp+arg_4]
		add	ax, 10h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, [bp+arg_2]
		or	al, 40h
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr [bp+arg_8], ax
		mov	word ptr [bp+arg_8+2], dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		jmp	short loc_1F993
; ---------------------------------------------------------------------------

loc_1F97A:				; CODE XREF: sub_1F902+51j
		push	cs
		call	near ptr sub_1F7C5
		nop
		push	cs
		call	near ptr sub_1FBD8
		cmp	[bp+arg_0], 0
		jz	short loc_1F98E
		call	sub_25262

loc_1F98E:				; CODE XREF: sub_1F902+39j
					; sub_1F902+85j
		nop
		push	cs
		call	near ptr sub_1B0EC

loc_1F993:				; CODE XREF: sub_1F902+1Dj
					; sub_1F902+37j ...
		mov	ax, word ptr [bp+arg_8]
		mov	dx, word ptr [bp+arg_8+2]
		mov	sp, bp
		pop	bp
		retn	0Ch
sub_1F902	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F99F	proc far		; CODE XREF: sub_27CAB+56P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	ds
		push	word ptr [bp+arg_0] ; char *
		mov	ax, word ptr [bp+arg_0]
		add	ax, 93h	; '�'
		push	ds
		push	ax		; __int32
		sub	ax, ax
		push	ax		; int
		mov	ax, 1
		push	ax		; int
		call	sub_1F7D3
		or	ax, ax
		jz	short loc_1F9C7
		sub	ax, ax
		jmp	short loc_1F9CA
; ---------------------------------------------------------------------------

loc_1F9C7:				; CODE XREF: sub_1F99F+22j
		mov	ax, 0FFFFh

loc_1F9CA:				; CODE XREF: sub_1F99F+26j
		pop	bp
		retf	2
sub_1F99F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1F9CE	proc far		; CODE XREF: sub_2925A+9AEP

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= byte ptr -12h
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 16h
		call	__chkstk
		mov	bx, word ptr [bp+arg_0]
		mov	ax, [bx+93h]
		or	ax, [bx+95h]
		jnz	short loc_1FA2A
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_1FA1A
		push	ds
		push	word ptr [bp+arg_0] ; char *
		mov	ax, word ptr [bp+arg_0]
		add	ax, 93h	; '�'
		push	ds
		push	ax		; __int32
		sub	ax, ax
		push	ax		; int
		push	ax		; int
		call	sub_1F7D3
		or	ax, ax
		jnz	short loc_1FA25
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_1FA1A:				; CODE XREF: sub_1F9CE+2Ej
		mov	word_465C6, 0
		mov	ax, 1
		jmp	short loc_1FA53
; ---------------------------------------------------------------------------

loc_1FA25:				; CODE XREF: sub_1F9CE+45j
		nop
		push	cs
		call	near ptr sub_1B0CF

loc_1FA2A:				; CODE XREF: sub_1F9CE+16j
		mov	bx, word ptr [bp+arg_0]
		les	bx, [bx+93h]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		add	ax, 0Fh
		and	al, 0F0h
		mov	[bp+var_16], ax
		mov	[bp+var_14], dx
		mov	ax, dx
		mov	dx, [bp+var_16]
		mov	cl, 4
		shr	dx, cl
		add	ax, dx
		mov	word_465C6, ax
		sub	ax, ax

loc_1FA53:				; CODE XREF: sub_1F9CE+55j
		mov	sp, bp
		pop	bp
		retf	2
sub_1F9CE	endp


; =============== S U B	R O U T	I N E =======================================


sub_1FA59	proc far		; CODE XREF: sub_2925A+A0P
		xor	ax, ax
		call	__chkstk
		mov	word_4734C, 1
		retf
sub_1FA59	endp


; =============== S U B	R O U T	I N E =======================================


sub_1FA67	proc far		; CODE XREF: sub_1FA7C+16p
					; sub_2925A+101P
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF7E, 0
		jnz	short locret_1FA7B
		mov	word_4734C, 0

locret_1FA7B:				; CODE XREF: sub_1FA67+Cj
		retf
sub_1FA67	endp


; =============== S U B	R O U T	I N E =======================================


sub_1FA7C	proc far		; CODE XREF: seg000:9061p seg000:9085p ...
		xor	ax, ax
		call	__chkstk
		cmp	word_4DF7E, 0
		jnz	short locret_1FAA2
		cmp	word_4734C, 0
		jz	short loc_1FA95
		push	cs
		call	near ptr sub_1FA67

loc_1FA95:				; CODE XREF: sub_1FA7C+13j
		cmp	word_465C6, 0
		jz	short locret_1FAA2
		mov	word_465C8, 1

locret_1FAA2:				; CODE XREF: sub_1FA7C+Cj
					; sub_1FA7C+1Ej
		retf
sub_1FA7C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1FAA3	proc far		; CODE XREF: sub_23F23+11AP

var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= _find_t ptr -2Ch

		push	bp
		mov	bp, sp
		mov	ax, 38h	; '8'
		call	__chkstk
		push	di
		push	si
		lea	ax, [bp+var_2C]
		push	ss
		push	ax		; struct _find_t *
		sub	ax, ax
		push	ax		; unsigned int
		mov	ax, 12E6h
		push	ds
		push	ax		; char *
		call	__dos_findfirst
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_1FACC
		jmp	loc_1FB51
; ---------------------------------------------------------------------------

loc_1FACC:				; CODE XREF: sub_1FAA3+24j
		cmp	word_4E92E, 0
		jz	short loc_1FAE4
		mov	[bp+var_32], 679h
		mov	[bp+var_30], offset aB@iXmogilbkia ; "*(�B@���X��G��B��A"
		mov	[bp+var_2E], seg seg005
		jmp	short loc_1FAF3
; ---------------------------------------------------------------------------

loc_1FAE4:				; CODE XREF: sub_1FAA3+2Ej
		mov	[bp+var_32], 42Ah
		mov	[bp+var_30], offset unk_3C060
		mov	[bp+var_2E], seg seg005

loc_1FAF3:				; CODE XREF: sub_1FAA3+3Fj
		push	word ptr dword_4737A+2
		push	word ptr dword_4737A
		mov	ax, [bp+var_32]
		cwd
		add	ax, 2
		adc	dx, 0
		push	dx
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		mov	ax, 1
		push	ax
		call	sub_1F902
		mov	word ptr dword_4737A, ax
		mov	word ptr dword_4737A+2,	dx
		or	ax, dx
		jz	short loc_1FB85
		les	bx, dword_4737A
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		add	ax, 0Fh
		and	al, 0F0h
		mov	word ptr [bp+var_38], ax
		mov	word ptr [bp+var_38+2],	dx
		mov	ax, [bp+var_30]
		mov	dx, [bp+var_2E]
		mov	cx, [bp+var_32]
		mov	si, ax
		push	ds
		mov	ds, dx
		les	di, [bp+var_38]
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		jmp	short loc_1FB8D
; ---------------------------------------------------------------------------

loc_1FB51:				; CODE XREF: sub_1FAA3+26j
		lea	ax, [bp+var_2C.name]
		push	ss
		push	ax		; char *
		mov	ax, 639Ah
		push	ds
		push	ax		; __int32
		mov	ax, 0C0h ; '�'
		push	ax		; int
		mov	ax, 1
		push	ax		; int
		call	sub_1F7D3
		mov	[bp+var_32], ax
		or	ax, ax
		jz	short loc_1FB85
		les	bx, dword_4737A
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		add	ax, 0Fh
		and	al, 0F0h
		mov	word ptr [bp+var_38], ax
		mov	word ptr [bp+var_38+2],	dx
		jmp	short loc_1FB8D
; ---------------------------------------------------------------------------

loc_1FB85:				; CODE XREF: sub_1FAA3+78j
					; sub_1FAA3+C8j
		sub	ax, ax
		mov	word ptr [bp+var_38+2],	ax
		mov	word ptr [bp+var_38], ax

loc_1FB8D:				; CODE XREF: sub_1FAA3+ACj
					; sub_1FAA3+E0j
		mov	ax, word ptr [bp+var_38+2]
		mov	dx, word ptr [bp+var_38]
		mov	cl, 4
		shr	dx, cl
		add	ax, dx
		mov	[bp+var_34], ax
		mov	ax, word ptr [bp+var_38]
		or	ax, word ptr [bp+var_38+2]
		jz	short loc_1FBB0
		push	[bp+var_32]
		push	[bp+var_34]
		call	sub_1FCA5
		add	sp, 4

loc_1FBB0:				; CODE XREF: sub_1FAA3+FFj
		mov	ax, [bp+var_34]
		mov	word_465C4, ax
		mov	ax, 0
		mov	dx, seg	seg005
		push	dx
		push	ax
		mov	ax, 0AA3h
		cwd
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1A9B3
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_1FAA3	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================


sub_1FBD0	proc far		; CODE XREF: sub_137E6+52Bp
					; sub_137E6+568p ...
		mov	ax, word_465CE
		mov	dx, word_465D0
		retf
sub_1FBD0	endp


; =============== S U B	R O U T	I N E =======================================


sub_1FBD8	proc far		; CODE XREF: sub_1F902+7Ep
					; sub_24333+118P ...
		mov	ax, word_465CE

loc_1FBDB:				; CODE XREF: sub_1FBD8+7j
		cmp	ax, word_465CE
		jz	short loc_1FBDB
		retf
sub_1FBD8	endp


; =============== S U B	R O U T	I N E =======================================


sub_1FBE2	proc far		; CODE XREF: sub_23F23+CP
		push	ds
		mov	word_465C8, 0
		mov	ax, 3508h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr dword_465D4, bx
		mov	word ptr dword_465D4+2,	es
		cli
		push	cs
		pop	ds
		assume ds:seg000
		mov	dx, 0FC41h
		mov	ax, 2508h
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		sti
		mov	al, 36h	; '6'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, 4DA7h
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		xchg	al, ah
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		pop	ds
		assume ds:dseg
		retf
sub_1FBE2	endp

; ---------------------------------------------------------------------------
aGFu		db '�>�U',0
		db 74h,	0Eh, 0B4h, 2, 8Bh, 0Eh,	0E6h, 55h, 6, 1Eh, 0FFh
		db 1Eh,	0E2h, 55h, 1Fh,	7, 1Eh,	0C5h, 16h, 0F4h, 55h, 0B8h
		db 8, 25h, 0FBh, 0CDh, 21h, 0B0h, 36h, 0E6h, 43h, 0B8h
		db 2 dup(0), 0E6h, 40h,	86h, 0C4h, 0E6h, 40h, 0FAh, 1Fh
		db 0CBh, 52h, 51h, 53h,	50h, 6,	1Eh, 55h, 56h, 57h, 8Bh
		db 0ECh, 0B8h
		dw seg dseg
; ---------------------------------------------------------------------------
		mov	ds, ax
		cmp	word_465C4, 0
		jz	short loc_1FC69
		mov	ax, word_465C8
		mov	ah, al
		mov	cx, word_465C6
		push	es
		push	ds
		call	dword ptr unk_465C2
		pop	ds
		pop	es

loc_1FC69:				; CODE XREF: seg000:FC56j
		mov	word_465C8, 0
		inc	word_465CE
		jnz	short loc_1FC79
		inc	word_465D0

loc_1FC79:				; CODE XREF: seg000:FC73j
		add	word_465D2, 4DA7h
		jb	short loc_1FC8F
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	di
		pop	si
		pop	bp
		pop	ds
		pop	es
		pop	ax
		pop	bx
		pop	cx
		pop	dx
		iret
; ---------------------------------------------------------------------------

loc_1FC8F:				; CODE XREF: seg000:FC7Fj
		mov	dx, word ptr dword_465D4+2
		mov	cx, word ptr dword_465D4
		xchg	cx, [bp+0Eh]
		xchg	dx, [bp+10h]
		pop	di
		pop	si
		pop	bp
		pop	ds
		pop	es
		pop	ax
		pop	bx
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1FCA5	proc near		; CODE XREF: sub_1FAA3+107p

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	ds
		mov	ax, [bp+arg_0]
		mov	ds, ax
		mov	cx, [bp+arg_2]
		xor	si, si
		sub	cx, 3

loc_1FCB7:				; CODE XREF: sub_1FCA5+29j
		mov	al, [si]
		mov	bl, [si+1]
		mov	ah, [si+2]
		xor	al, bl
		xor	ah, bl
		mov	[si], ah
		mov	[si+2],	al
		add	si, 3
		sub	cx, 3
		jns	short loc_1FCB7
		pop	ds
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_1FCA5	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1FCD6	proc far		; CODE XREF: sub_23F23+101P

var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= _find_t ptr -2Ch

		push	bp
		mov	bp, sp
		mov	ax, 30h	; '0'
		call	__chkstk
		mov	word_47386, 0
		lea	ax, [bp+var_2C]
		push	ss
		push	ax		; struct _find_t *
		sub	ax, ax
		push	ax		; unsigned int
		mov	ax, 12ECh
		push	ds
		push	ax		; char *
		call	__dos_findfirst
		add	sp, 0Ah

loc_1FCFC:				; CODE XREF: sub_1FCD6+44j
		or	ax, ax
		jnz	short loc_1FD72
		cmp	word ptr [bp+var_2C.size], 0A2h	; '�'
		jnz	short loc_1FD0D
		cmp	word ptr [bp+var_2C.size+2], 0
		jz	short loc_1FD1C

loc_1FD0D:				; CODE XREF: sub_1FCD6+2Fj
					; sub_1FCD6+5Bj ...
		lea	ax, [bp+var_2C]
		push	ss
		push	ax		; struct _find_t *
		call	far ptr	__dos_findnext
		add	sp, 4
		jmp	short loc_1FCFC
; ---------------------------------------------------------------------------

loc_1FD1C:				; CODE XREF: sub_1FCD6+35j
		sub	ax, ax
		push	ax		; int
		lea	ax, [bp+var_2C.name]
		push	ss
		push	ax		; char *
		call	_open
		add	sp, 6
		mov	[bp+var_2E], ax
		or	ax, ax
		jl	short loc_1FD0D
		mov	ax, 0A2h ; '�'
		push	ax		; unsigned int
		mov	ax, 63A8h
		push	ds
		push	ax		; void *
		push	[bp+var_2E]	; int
		call	_read
		add	sp, 8
		mov	[bp+var_30], ax
		push	[bp+var_2E]	; int
		call	_close
		add	sp, 2
		cmp	[bp+var_30], 0A2h ; '�'
		jnz	short loc_1FD0D
		cmp	word_47388, 4321h
		jnz	short loc_1FD0D
		cmp	word_4738A, 1234h
		jnz	short loc_1FD0D
		mov	word_47386, 1

loc_1FD72:				; CODE XREF: sub_1FCD6+28j
		mov	ax, 0FCD6h
		mov	dx, seg	seg000
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_1C51D
		mov	sp, bp
		pop	bp
		retf
sub_1FCD6	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1FD8B	proc far		; CODE XREF: sub_1C5B3+A0p

var_46		= word ptr -46h
var_40		= word ptr -40h
var_3E		= byte ptr -3Eh
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= byte ptr -20h

		push	bp
		mov	bp, sp
		mov	ax, 46h	; 'F'
		call	__chkstk
		push	di
		push	si
		cmp	word_47386, 0
		jnz	short loc_1FDA7
		call	sub_25C98
		jmp	loc_1FF4D
; ---------------------------------------------------------------------------

loc_1FDA7:				; CODE XREF: sub_1FD8B+12j
		lea	ax, [bp+var_3E]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_1FDC2
		jmp	loc_1FE4C
; ---------------------------------------------------------------------------

loc_1FDC2:				; CODE XREF: sub_1FD8B+32j
		mov	ax, 49h	; 'I'
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1B209
		mov	word ptr dword_4737E, ax
		mov	word ptr dword_4737E+2,	dx
		nop
		push	cs
		call	near ptr sub_1B0CF
		push	word ptr dword_4737E+2
		push	word ptr dword_4737E
		nop
		push	cs
		call	near ptr sub_1B047
		les	bx, dword_4737E
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr dword_47382, ax
		mov	word ptr dword_47382+2,	dx
		les	bx, dword_47382
		mov	di, bx
		mov	si, 12F2h
		mov	cx, 24h	; '$'
		repne movsw
		movsb
		cmp	word_473B6, 6
		jnz	short loc_1FE2E
		sub	word ptr es:[bx+25h], 8000h
		sbb	word ptr es:[bx+27h], 0
		les	bx, dword_47382
		sub	word ptr es:[bx+29h], 0
		sbb	word ptr es:[bx+2Bh], 1

loc_1FE2E:				; CODE XREF: sub_1FD8B+88j
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		call	sub_20460
		lea	ax, [bp+var_20]
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_24+2],	ss
		mov	ax, 644Eh
		mov	word ptr [bp+var_2A], ax
		mov	word ptr [bp+var_2A+2],	ds
		jmp	short loc_1FE96
; ---------------------------------------------------------------------------

loc_1FE4C:				; CODE XREF: sub_1FD8B+34j
		call	sub_2524E
		jmp	loc_1FF4D
; ---------------------------------------------------------------------------

loc_1FE54:				; CODE XREF: sub_1FD8B+110j
		les	bx, [bp+var_24]
		mov	ax, es:[bx]
		mov	[bp+var_46], ax
		sub	dx, dx
		mov	cl, 0Ch
		call	__aFlshl
		and	dx, 0F0h
		mov	ch, byte ptr [bp+var_46]
		sub	cl, cl
		and	cx, 0F000h
		mov	ax, cx
		mov	bx, [bp+var_46]
		mov	cl, 4
		shl	bx, cl
		sub	cx, cx
		and	bx, 0F0h
		or	ax, bx
		les	bx, [bp+var_2A]
		mov	es:[bx], ax
		mov	es:[bx+2], dx
		add	word ptr [bp+var_2A], 4
		add	word ptr [bp+var_24], 2

loc_1FE96:				; CODE XREF: sub_1FD8B+BFj
		cmp	word ptr [bp+var_2A], 648Eh
		jb	short loc_1FE54
		mov	ax, 1
		push	ax
		push	word ptr dword_47382+2
		push	word ptr dword_47382
		mov	ax, 133Ch
		push	ds
		push	ax
		mov	ax, 63A8h
		push	ds
		push	ax
		call	sub_2E464
		lea	ax, [bp+var_40]
		push	ss
		push	ax
		lea	ax, [bp+var_26]
		push	ss
		push	ax
		call	sub_2598E
		cmp	ax, 1
		jnz	short loc_1FF33
		cmp	[bp+var_40], 0
		jz	short loc_1FED6
		mov	al, 2
		jmp	short loc_1FED8
; ---------------------------------------------------------------------------

loc_1FED6:				; CODE XREF: sub_1FD8B+145j
		mov	al, 1

loc_1FED8:				; CODE XREF: sub_1FD8B+149j
		les	bx, dword_47382
		mov	es:[bx+6], al
		les	bx, dword_47382
		mov	ax, [bp+var_26]
		dec	ax
		mov	es:[bx+4], ax
		call	sub_25AA0
		mov	ax, 4
		push	ax
		push	word ptr dword_47382+2
		push	word ptr dword_47382
		mov	ax, 133Ch
		push	ds
		push	ax
		mov	ax, 63A8h
		push	ds
		push	ax
		call	sub_2E464
		mov	[bp+var_2C], ax
		call	sub_25AB9
		mov	ax, [bp+var_2C]
		or	ax, ax
		jz	short loc_1FF33
		cmp	ax, 3
		jz	short loc_1FF27
		cmp	ax, 0FFh
		jz	short loc_1FF33
		jmp	short loc_1FF2E
; ---------------------------------------------------------------------------

loc_1FF27:				; CODE XREF: sub_1FD8B+193j
		call	sub_2524E
		jmp	short loc_1FF33
; ---------------------------------------------------------------------------

loc_1FF2E:				; CODE XREF: sub_1FD8B+19Aj
		call	sub_25C82

loc_1FF33:				; CODE XREF: sub_1FD8B+13Fj
					; sub_1FD8B+18Ej ...
		push	word ptr dword_4737E+2
		push	word ptr dword_4737E
		nop
		push	cs
		call	near ptr sub_1B063
		push	word ptr dword_4737E+2
		push	word ptr dword_4737E
		nop
		push	cs
		call	near ptr sub_1AEAD

loc_1FF4D:				; CODE XREF: sub_1FD8B+19j
					; sub_1FD8B+C6j
		pop	si
		pop	di
		mov	sp, bp		; DATA XREF: sub_2C7FE+21o
					; sub_2D005+459o ...
		pop	bp
		retf
sub_1FD8B	endp

seg000		ends

; ===========================================================================

; Segment type:	Pure code
seg001		segment	byte public 'CODE' use16
		assume cs:seg001
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_1FF54	proc far		; CODE XREF: sub_14DB0+46DP

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 1Ch
		call	__chkstk
		mov	al, byte_4DF8C
		mov	cl, 4
		shl	al, cl
		mov	[bp+var_2], al
		mov	al, byte_48766
		shl	al, cl
		mov	[bp+var_E], al
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+4]
		mov	[bp+var_1C], ax
		mov	ax, [bp+arg_4]
		mul	[bp+var_1C]
		mov	cx, [bp+arg_6]
		shr	cx, 1
		add	ax, cx
		add	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		jmp	loc_2001B
; ---------------------------------------------------------------------------

loc_1FF98:				; CODE XREF: sub_1FF54+94j
		les	bx, [bp+var_16]
		mov	al, es:[bx]
		sub	ah, ah
		mov	cl, [bp+var_8]
		sub	ch, ch
		test	ax, cx
		jz	short loc_1FFB7
		les	bx, [bp+var_C]
		mov	al, es:[bx]
		and	al, 0Fh
		or	al, [bp+var_2]
		mov	es:[bx], al

loc_1FFB7:				; CODE XREF: sub_1FF54+53j
		shr	[bp+var_8], 1
		les	bx, [bp+var_16]
		mov	al, es:[bx]
		sub	ah, ah
		mov	cl, [bp+var_8]
		sub	ch, ch
		test	ax, cx
		jz	short loc_1FFDA
		les	bx, [bp+var_C]
		mov	al, es:[bx]
		and	al, 0F0h
		or	al, byte_4DF8C
		mov	es:[bx], al

loc_1FFDA:				; CODE XREF: sub_1FF54+75j
		shr	[bp+var_8], 1
		inc	word ptr [bp+var_C]

loc_1FFE0:				; CODE XREF: sub_1FF54+BEj
		mov	ax, [bp+var_18]
		dec	[bp+var_18]
		or	ax, ax
		jnz	short loc_1FF98
		inc	word ptr [bp+var_16]
		mov	ax, [bp+var_1C]
		add	[bp+var_12], ax

loc_1FFF3:				; CODE XREF: sub_1FF54+F7j
		mov	ax, [bp+var_1A]
		dec	[bp+var_1A]
		or	ax, ax
		jz	short loc_20014
		mov	[bp+var_8], 80h	; '�'
		mov	ax, [bp+var_12]
		mov	dx, [bp+var_10]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		mov	[bp+var_18], 4
		jmp	short loc_1FFE0
; ---------------------------------------------------------------------------

loc_20014:				; CODE XREF: sub_1FF54+A7j
		inc	word ptr [bp+arg_0]
		add	[bp+var_6], 4

loc_2001B:				; CODE XREF: sub_1FF54+41j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jz	short loc_2004D
		mov	al, es:[bx]
		cbw
		mov	cl, 3
		shl	ax, cl
		add	ax, word ptr dword_4DFA4
		mov	dx, word ptr dword_4DFA4+2
		mov	word ptr [bp+var_16], ax
		mov	word ptr [bp+var_16+2],	dx
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_4]
		mov	[bp+var_12], ax
		mov	[bp+var_10], dx
		mov	[bp+var_1A], 8
		jmp	short loc_1FFF3
; ---------------------------------------------------------------------------

loc_2004D:				; CODE XREF: sub_1FF54+CEj
		mov	sp, bp
		pop	bp
		retf	0Ch
sub_1FF54	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_271BD
		push	word ptr [bp+6]
		call	dword_4878E
		nop
		push	cs
		call	near ptr sub_2711B
		pop	bp
		retf	2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20072	proc far		; CODE XREF: sub_2017A+3Ap
					; sub_201CE+6Ap ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_26E07
		mov	ax, [bp+var_A]
		dec	ax
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 10h
		mov	[bp+var_2], ax
		mov	ax, [bp+var_C]
		dec	ax
		mov	[bp+var_8], ax
		mov	ax, es:[bx]
		add	ax, 10h
		mov	[bp+var_4], ax
		nop
		push	cs
		call	near ptr sub_271BD
		inc	word_4748E
		mov	sp, bp
		pop	bp
		retf	4
sub_20072	endp


; =============== S U B	R O U T	I N E =======================================


sub_200BA	proc far		; CODE XREF: sub_2017A+4Bp
					; sub_201CE+E6p ...
		xor	ax, ax
		call	__chkstk
		cmp	word_4748E, 0
		jz	short locret_200D1
		nop
		push	cs
		call	near ptr sub_2711B
		dec	word_4748E

locret_200D1:				; CODE XREF: sub_200BA+Cj
		retf
sub_200BA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_200D2	proc far		; CODE XREF: sub_23A5F+6Dp

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		les	bx, [bp+arg_0]
		sub	ax, ax
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	di, [bp+arg_4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	ax, cx
		mov	cl, 3
		shl	ax, cl
		les	bx, [bp+arg_0]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+4], 9
		pop	di
		pop	bp
		retf	8
sub_200D2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20114	proc far		; CODE XREF: sub_140EB+35P
					; sub_22FD4+55p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		les	di, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	ax, cx
		mov	cl, 3
		shl	ax, cl
		pop	di
		pop	bp
		retf	4
sub_20114	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20137	proc far		; CODE XREF: sub_17638+7BP

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		lea	ax, [bp+arg_0]
		push	ss
		push	ax
		mov	ax, 1
		push	ax
		push	cs
		call	near ptr sub_2017A
		pop	bp
		retf	2
sub_20137	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20152	proc far		; CODE XREF: sub_140EB+4EP
					; sub_23A5F+AEp ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		les	di, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		push	cs
		call	near ptr sub_2017A
		pop	di
		pop	bp
		retf	4
sub_20152	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2017A	proc far		; CODE XREF: sub_20137+14p
					; sub_20152+20p ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_201C8
		mov	ax, word_4B398
		mov	[bp+var_6], ax
		mov	ax, word_4B39A
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_0]
		mov	cl, 3
		shl	ax, cl
		add	ax, word_4B398
		mov	[bp+var_2], ax
		mov	ax, word_4B39A
		add	ax, 9
		mov	[bp+var_4], ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_20072
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	dword_490B2
		push	cs
		call	near ptr sub_200BA

loc_201C8:				; CODE XREF: sub_2017A+Fj
		mov	sp, bp
		pop	bp
		retf	6
sub_2017A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_201CE	proc far		; CODE XREF: sub_11334+18CP
					; sub_116EF+9CP ...

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		mov	[bp+var_12], ax
		or	ax, ax
		jg	short loc_201EE
		jmp	loc_202B7
; ---------------------------------------------------------------------------

loc_201EE:				; CODE XREF: sub_201CE+1Bj
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		mov	[bp+var_10], ax
		or	ax, ax
		jg	short loc_201FF
		jmp	loc_202B7
; ---------------------------------------------------------------------------

loc_201FF:				; CODE XREF: sub_201CE+2Cj
		mov	al, byte_490B0
		sub	ah, ah
		mov	[bp+var_14], ax
		shl	ax, 1
		sub	[bp+var_10], ax
		mov	ax, es:[bx+6]
		dec	ax
		mov	[bp+var_E], ax
		mov	ax, es:[bx+4]
		dec	ax
		mov	[bp+var_6], ax
		sub	ax, [bp+var_14]
		mov	[bp+var_C], ax
		mov	ax, es:[bx+2]
		mov	[bp+var_A], ax
		mov	ax, es:[bx]
		mov	[bp+var_4], ax
		add	ax, [bp+var_14]
		mov	[bp+var_8], ax
		push	es
		push	bx
		push	cs
		call	near ptr sub_20072
		mov	al, byte_490B0
		sub	ah, ah
		mov	[bp+var_2], ax
		jmp	short loc_20266
; ---------------------------------------------------------------------------

loc_20245:				; CODE XREF: sub_201CE+A0j
		push	[bp+var_A]
		push	[bp+var_4]
		push	[bp+var_12]
		call	sub_203D2
		inc	[bp+var_4]
		push	[bp+var_E]
		push	[bp+var_6]
		mov	ax, [bp+var_12]
		neg	ax
		push	ax
		call	sub_203D2
		dec	[bp+var_6]

loc_20266:				; CODE XREF: sub_201CE+75j
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jnz	short loc_20245
		mov	al, byte_490A6
		sub	ah, ah
		mov	[bp+var_2], ax
		jmp	short loc_2029B
; ---------------------------------------------------------------------------

loc_2027A:				; CODE XREF: sub_201CE+D5j
		push	[bp+var_E]
		push	[bp+var_8]
		push	[bp+var_10]
		call	sub_20327
		dec	[bp+var_E]
		push	[bp+var_A]
		push	[bp+var_C]
		mov	ax, [bp+var_10]
		neg	ax
		push	ax
		call	sub_20327
		inc	[bp+var_A]

loc_2029B:				; CODE XREF: sub_201CE+AAj
		mov	ax, [bp+var_2]
		dec	[bp+var_2]
		or	ax, ax
		jnz	short loc_2027A
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	dword_4B3A2
		push	cs
		call	near ptr sub_200BA

loc_202B7:				; CODE XREF: sub_201CE+1Dj
					; sub_201CE+2Ej
		mov	sp, bp
		pop	bp
		retf	4
sub_201CE	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_202BD	proc near		; CODE XREF: sub_203F1+31p

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		les	bx, [bp+arg_6]
		mov	ax, es:[bx]
		les	bx, [bp+arg_2]
		add	ax, es:[bx]
		mov	[bp+var_2], ax
		cmp	[bp+arg_0], 0
		jnz	short loc_202F0
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+4]
		les	bx, [bp+arg_2]
		sub	ax, es:[bx]
		sub	ax, [bp+var_2]
		mov	[bp+arg_0], ax

loc_202F0:				; CODE XREF: sub_202BD+1Ej
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_2]
		add	ax, es:[bx+2]
		push	ax
		push	[bp+var_2]
		push	[bp+arg_0]
		call	sub_20327
		les	bx, [bp+arg_6]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_2]
		sub	ax, es:[bx+2]
		dec	ax
		push	ax
		push	[bp+var_2]
		push	[bp+arg_0]
		call	sub_20327
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_202BD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20327	proc near		; CODE XREF: sub_201CE+B5p
					; sub_201CE+C7p ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	dword_4B3A2
		push	[bp+arg_0]
		call	dword_4909C
		pop	bp
		retn	6
sub_20327	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20346	proc near		; CODE XREF: sub_203F1+49p
					; seg001:0A28p

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	[bp+arg_8]
		push	[bp+arg_6]
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_321A6
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	cs
		call	near ptr sub_20513
		mov	ax, [bp+var_4]
		cmp	[bp+var_8], ax
		jge	short loc_203CC
		mov	ax, [bp+var_2]
		cmp	[bp+var_6], ax
		jge	short loc_203CC
		dec	[bp+var_4]
		cmp	[bp+arg_0], 0
		jz	short loc_203AB
		mov	ax, [bp+arg_0]
		sub	[bp+var_2], ax
		push	[bp+var_2]
		push	[bp+var_8]
		push	ax
		call	sub_203D2
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+arg_0]
		call	sub_203D2
		jmp	short loc_203B4
; ---------------------------------------------------------------------------

loc_203AB:				; CODE XREF: sub_20346+45j
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_6]
		mov	[bp+arg_0], ax

loc_203B4:				; CODE XREF: sub_20346+63j
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+arg_0]
		call	sub_203D2
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+arg_0]
		call	sub_203D2

loc_203CC:				; CODE XREF: sub_20346+34j
					; sub_20346+3Cj
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_20346	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_203D2	proc near		; CODE XREF: sub_201CE+80p
					; sub_201CE+92p ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	dword_4B3A2
		push	[bp+arg_0]
		call	dword_48788
		pop	bp
		retn	6
sub_203D2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_203F1	proc far		; CODE XREF: sub_116EF+A8P
					; sub_116EF+143P

var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_20072
		mov	[bp+var_2], 1364h

loc_2040B:				; CODE XREF: sub_203F1+55j
		mov	bx, [bp+var_2]
		cmp	word ptr [bx], 0
		jz	short loc_20427
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		mov	ax, bx
		inc	ax
		inc	ax
		push	ds
		push	ax
		push	word ptr [bx+6]
		call	sub_202BD
		jmp	short loc_2043D
; ---------------------------------------------------------------------------

loc_20427:				; CODE XREF: sub_203F1+20j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		mov	ax, [bp+var_2]
		inc	ax
		inc	ax
		push	ds
		push	ax
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		call	sub_20346

loc_2043D:				; CODE XREF: sub_203F1+34j
		add	[bp+var_2], 8
		cmp	[bp+var_2], 1384h
		jb	short loc_2040B
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		call	dword_4B3A2
		push	cs
		call	near ptr sub_200BA
		mov	sp, bp
		pop	bp
		retf	4
sub_203F1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20460	proc far		; CODE XREF: sub_16592+1B6P
					; sub_1FD8B+A8P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		push	si
		mov	cx, 20h	; ' '
		mov	si, 648Eh
		les	di, [bp+arg_0]
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	si
		pop	di
		pop	bp
		retf	4
sub_20460	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20483	proc far		; CODE XREF: sub_116EF+61P
					; sub_12CA2+49P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_0]
		mov	di, bx
		mov	si, 1350h
		movsw
		movsw
		movsw
		movsw
		pop	si
		pop	di
		pop	bp
		retf	4
sub_20483	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_204A1	proc far		; CODE XREF: sub_173B7+3DP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, word_4B39A
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	ax, word_4B398
		mov	es:[bx+2], ax
		pop	bp
		retf	4
sub_204A1	endp


; =============== S U B	R O U T	I N E =======================================


sub_204C2	proc far		; CODE XREF: sub_14D40+BP
		xor	ax, ax
		call	__chkstk
		mov	al, byte_4DF92
		sub	ah, ah
		retf
sub_204C2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_204CF	proc far		; CODE XREF: sub_1EB4F+10P
					; sub_1EBF1+10P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	al, byte_490B0
		sub	ah, ah
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	al, byte_490A6
		mov	es:[bx+2], ax
		pop	bp
		retf	4
sub_204CF	endp


; =============== S U B	R O U T	I N E =======================================


sub_204F2	proc far		; CODE XREF: sub_1632A+BP
					; sub_16592+195P
		xor	ax, ax
		call	__chkstk
		mov	ax, word_42340
		mov	dx, seg_42342
		retf
sub_204F2	endp


; =============== S U B	R O U T	I N E =======================================


sub_20501	proc far		; CODE XREF: sub_2326C+15p
					; sub_23285+16p ...
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_2708A
		nop
		push	cs
		call	near ptr sub_2711B
		retf
sub_20501	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20513	proc far		; CODE XREF: sub_116EF+123P
					; sub_116EF+152P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		add	es:[bx+2], ax
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		sub	es:[bx+6], ax
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_0]
		add	es:[bx], ax
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_0]
		sub	es:[bx+4], ax
		pop	bp
		retf	8
sub_20513	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20548	proc far		; CODE XREF: sub_23875+177p
					; sub_23875+1B5p

var_A		= byte ptr -0Ah
var_8		= byte ptr -8
var_6		= byte ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		mov	al, byte_4E944
		mov	[bp+var_A], al
		mov	al, byte_4DF92
		mov	[bp+var_6], al
		mov	al, byte_4DBD5
		mov	[bp+var_8], al
		mov	byte_4DF92, 0FFh
		mov	byte_4E944, 2
		mov	byte_4DBD5, 0
		call	dword_4DF60
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		sar	ax, 1
		mov	[bp+var_4], ax
		mov	ax, es:[bx+2]
		add	ax, [bp+var_2]
		push	ax
		mov	ax, es:[bx]
		add	ax, [bp+var_4]
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_20C45
		mov	al, [bp+var_A]
		mov	byte_4E944, al
		mov	al, [bp+var_6]
		mov	byte_4DF92, al
		mov	al, [bp+var_8]
		mov	byte_4DBD5, al
		call	dword_4DF60
		mov	sp, bp
		pop	bp
		retf	4
sub_20548	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_205C8	proc far		; CODE XREF: sub_116EF+1ADP
					; sub_123F9+E1P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 98Fh
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_20606
		pop	bp
		retf	4
sub_205C8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_205E7	proc far		; CODE XREF: sub_116EF+1BAP
					; sub_123F9+EDP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 9D3h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_20606
		pop	bp
		retf	4
sub_205E7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20606	proc near		; CODE XREF: sub_205C8+18p
					; sub_205E7+18p

var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= dword	ptr  4
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	al, byte_4E944
		mov	[bp+var_6], al
		mov	al, byte_4DF92
		mov	[bp+var_2], al
		mov	al, byte_4DBD5
		mov	[bp+var_4], al
		mov	byte_4DF92, 0FFh
		mov	byte_4E944, 2
		mov	byte_4DBD5, 0
		call	dword_4DF60
		push	[bp+arg_6]
		push	[bp+arg_4]
		call	[bp+arg_0]
		mov	al, [bp+var_6]
		mov	byte_4E944, al
		mov	al, [bp+var_2]
		mov	byte_4DF92, al
		mov	al, [bp+var_4]
		mov	byte_4DBD5, al
		call	dword_4DF60
		mov	sp, bp
		pop	bp
		retn	8
sub_20606	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2065B	proc far		; CODE XREF: sub_10D35+35P
					; sub_14936+66P ...

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		mov	ax, [bp+arg_2]
		add	ax, word_4B398
		mov	[bp+var_E], ax
		mov	ax, [bp+arg_0]
		add	ax, word_4B39A
		mov	[bp+var_10], ax
		cmp	[bp+arg_2], 0
		jle	short loc_2068B
		mov	ax, word_4B398
		mov	[bp+var_6], ax
		mov	ax, [bp+var_E]
		jmp	short loc_20694
; ---------------------------------------------------------------------------

loc_2068B:				; CODE XREF: sub_2065B+23j
		mov	ax, [bp+var_E]
		mov	[bp+var_6], ax
		mov	ax, word_4B398

loc_20694:				; CODE XREF: sub_2065B+2Ej
		mov	[bp+var_2], ax
		cmp	[bp+arg_0], 0
		jle	short loc_206A8
		mov	ax, word_4B39A
		mov	[bp+var_8], ax
		mov	ax, [bp+var_10]
		jmp	short loc_206B1
; ---------------------------------------------------------------------------

loc_206A8:				; CODE XREF: sub_2065B+40j
		mov	ax, [bp+var_10]
		mov	[bp+var_8], ax
		mov	ax, word_4B39A

loc_206B1:				; CODE XREF: sub_2065B+4Bj
		mov	[bp+var_4], ax
		cmp	[bp+arg_2], 0
		jz	short loc_2070E
		cmp	[bp+arg_0], 0
		jz	short loc_206F9
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_20072
		cmp	[bp+arg_2], 0
		jge	short loc_206F1
		mov	ax, word_4B398
		mov	[bp+var_A], ax
		mov	ax, word_4B39A
		mov	[bp+var_C], ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword_4B3A2
		push	[bp+var_A]
		push	[bp+var_C]

loc_206EB:				; CODE XREF: sub_2065B+9Cj
		call	dword_4DF9C
		jmp	short loc_20721
; ---------------------------------------------------------------------------

loc_206F1:				; CODE XREF: sub_2065B+72j
		push	[bp+var_E]
		push	[bp+var_10]
		jmp	short loc_206EB
; ---------------------------------------------------------------------------

loc_206F9:				; CODE XREF: sub_2065B+63j
		inc	[bp+var_4]
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_20072
		push	[bp+arg_2]
		call	dword_48788
		jmp	short loc_20721
; ---------------------------------------------------------------------------

loc_2070E:				; CODE XREF: sub_2065B+5Dj
		inc	[bp+var_2]
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_20072
		push	[bp+arg_0]
		call	dword_4909C

loc_20721:				; CODE XREF: sub_2065B+94j
					; sub_2065B+B1j
		push	cs
		call	near ptr sub_200BA
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword_4B3A2
		mov	sp, bp
		pop	bp
		retf	4
sub_2065B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20735	proc far		; CODE XREF: sub_234D7+1Dp
					; seg001:4E02p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_2]
		sub	ax, word_4B398
		push	ax
		mov	ax, [bp+arg_0]
		sub	ax, word_4B39A
		push	ax
		push	cs
		call	near ptr sub_2065B
		pop	bp
		retf	4
sub_20735	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20757	proc far		; CODE XREF: sub_11126+3FP

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		cwd
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		cwd
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		cwd
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		cwd
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	[bp+var_10]
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+2]
		cwd
		push	dx
		push	ax
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		les	bx, [bp+arg_0]
		add	ax, es:[bx+2]
		mov	[bp+var_14], ax
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_8]
		les	bx, [bp+arg_8]
		mov	ax, es:[bx]
		cwd
		push	dx
		push	ax
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		les	bx, [bp+arg_0]
		add	ax, es:[bx]
		mov	[bp+var_12], ax
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	[bp+var_10]
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		cwd
		push	dx
		push	ax
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		add	ax, [bp+var_14]
		les	bx, [bp+arg_8]
		mov	es:[bx+6], ax
		push	[bp+var_2]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_8]
		les	bx, [bp+arg_8]
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		cwd
		push	dx
		push	ax
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		add	ax, [bp+var_12]
		les	bx, [bp+arg_8]
		mov	es:[bx+4], ax
		les	bx, [bp+arg_8]
		mov	ax, [bp+var_14]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_8]
		mov	ax, [bp+var_12]
		mov	es:[bx], ax
		mov	sp, bp
		pop	bp
		retf	0Ch
sub_20757	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20870	proc far		; CODE XREF: sub_23A5F+A4p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_2]
		add	ax, word_4B398
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, word_4B39A
		push	ax
		call	dword_4B3A2
		pop	bp
		retf	4
sub_20870	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20892	proc far		; CODE XREF: sub_10D35+2AP
					; sub_140EB+44P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	dword_4B3A2
		pop	bp
		retf	4
sub_20892	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_208AA	proc far		; CODE XREF: sub_1337F+4DP
					; sub_15481+57P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		add	es:[bx+2], ax
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		add	es:[bx+6], ax
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_0]
		add	es:[bx], ax
		les	bx, [bp+arg_4]
		mov	ax, [bp+arg_0]
		add	es:[bx+4], ax
		pop	bp
		retf	8
sub_208AA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_208DF	proc far		; CODE XREF: sub_134E4+2BP
					; sub_134E4+36P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 9AAh
		push	ax
		call	sub_209A2
		pop	bp
		retf	4
sub_208DF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_208FA	proc near		; CODE XREF: seg001:0A49p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		jmp	short loc_20915
; ---------------------------------------------------------------------------

loc_20906:				; CODE XREF: sub_208FA+23j
		push	[bp+arg_6]
		push	[bp+arg_4]
		inc	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_203D2

loc_20915:				; CODE XREF: sub_208FA+Aj
		mov	ax, [bp+arg_0]
		dec	[bp+arg_0]
		or	ax, ax
		jnz	short loc_20906
		pop	bp
		retn	8
sub_208FA	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, 9EEh
		push	ax
		call	sub_209A2
		pop	bp
		retf	4
; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		mov	ax, [bp+0Ah]
		add	ax, [bp+6]
		mov	[bp-2],	ax
		mov	ax, [bp+8]
		add	ax, [bp+4]
		mov	[bp-4],	ax
		mov	word ptr [bp-0Ah], 1384h

loc_2096C:				; CODE XREF: seg001:0A34j
		lea	ax, [bp-8]
		push	ss
		push	ax
		push	ds
		push	word ptr [bp-0Ah]
		sub	ax, ax
		push	ax
		call	sub_20346
		add	word ptr [bp-0Ah], 4
		cmp	word ptr [bp-0Ah], 138Ch
		jb	short loc_2096C
		push	word ptr [bp+0Ah]
		mov	ax, [bp+8]
		inc	ax
		inc	ax
		push	ax
		push	word ptr [bp+6]
		mov	ax, [bp+4]
		sub	ax, 4
		push	ax
		call	sub_208FA
		mov	sp, bp
		pop	bp
		retn	8

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_209A2	proc near		; CODE XREF: sub_208DF+14p
					; seg001:09E7p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+6]
		sub	ax, es:[bx+2]
		mov	[bp+var_4], ax
		or	ax, ax
		jle	short loc_20A15
		mov	ax, es:[bx+4]
		sub	ax, es:[bx]
		mov	[bp+var_2], ax
		or	ax, ax
		jle	short loc_20A15
		push	es
		push	bx
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_208AA
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		push	cs
		call	near ptr sub_20072
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	[bp+var_4]
		push	[bp+var_2]
		call	[bp+arg_0]
		push	cs
		call	near ptr sub_200BA
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		call	dword_4B3A2
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_208AA

loc_20A15:				; CODE XREF: sub_209A2+1Bj
					; sub_209A2+29j
		mov	sp, bp
		pop	bp
		retn	6
sub_209A2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20A1B	proc far		; CODE XREF: sub_11334+CDP
					; sub_11334+1FFP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		cmp	es:[bx+4], ax
		jle	short loc_20A3C
		mov	ax, es:[bx+6]
		cmp	es:[bx+2], ax
		jl	short loc_20A40

loc_20A3C:				; CODE XREF: sub_20A1B+15j
					; sub_20A1B+31j ...
		sub	ax, ax
		jmp	short loc_20A74
; ---------------------------------------------------------------------------

loc_20A40:				; CODE XREF: sub_20A1B+1Fj
		les	bx, [bp+arg_4]
		mov	si, es:[bx]
		les	bx, [bp+arg_0]
		cmp	es:[bx], si
		jg	short loc_20A3C
		cmp	es:[bx+4], si
		jle	short loc_20A3C
		mov	ax, es:[bx+2]
		les	bx, [bp+arg_4]
		cmp	es:[bx+2], ax
		jl	short loc_20A3C
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		les	bx, [bp+arg_4]
		cmp	es:[bx+2], ax
		jge	short loc_20A3C
		mov	ax, 1

loc_20A74:				; CODE XREF: sub_20A1B+23j
		pop	si
		pop	bp
		retf	8
sub_20A1B	endp


; =============== S U B	R O U T	I N E =======================================


sub_20A79	proc far		; CODE XREF: sub_23E78+9p
		xor	ax, ax
		call	__chkstk
		mov	ax, 1358h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_20B07
		retf
sub_20A79	endp


; =============== S U B	R O U T	I N E =======================================


sub_20A8A	proc far		; CODE XREF: seg000:06CAP
		xor	ax, ax
		call	__chkstk
		retf
sub_20A8A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20A92	proc far		; CODE XREF: sub_10167+46P
					; sub_16592+22AP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		push	si
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, 20h	; ' '
		mov	di, 648Eh
		mov	si, ax
		push	ds
		pop	es
		assume es:dseg
		push	ds
		mov	ds, dx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		push	dx
		push	ax
		call	dword_4DF7A
		pop	si
		pop	di
		pop	bp
		retf	4
sub_20A92	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20AC6	proc far		; CODE XREF: sub_133D5+DP
					; sub_14DB0+4CCP ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	al, [bp+arg_0]
		mov	byte_4DF8C, al
		call	dword_4DF60
		pop	bp
		retf	2
sub_20AC6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20ADE	proc far		; CODE XREF: sub_116EF+80P
					; sub_13470+EP	...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	al, [bp+arg_0]
		mov	byte_4E944, al
		call	dword_4DF60
		pop	bp
		retf	2
sub_20ADE	endp


; =============== S U B	R O U T	I N E =======================================


sub_20AF6	proc far		; CODE XREF: sub_10CDE:loc_10D03P
					; sub_13470+13P ...
		xor	ax, ax
		call	__chkstk
		mov	byte_4DBD5, 1
		call	dword_4DF60
		retf
sub_20AF6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20B07	proc far		; CODE XREF: sub_1632A+12EP
					; sub_16592+20CP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_42340, ax
		mov	seg_42342, dx
		mov	byte_4DF92, 0
		mov	byte_4E944, 0
		mov	byte_4DBD5, 0
		mov	byte_4DF8C, 0
		mov	byte_48766, 0Fh
		mov	byte_4E93E, 0
		mov	byte_4DFA8, 0
		sub	ax, ax
		push	ax
		push	ax
		push	cs
		call	near ptr sub_20892
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		call	dword_4DF60
		pop	bp
		retf	4
sub_20B07	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20B5B	proc far		; CODE XREF: sub_173B7+8DP

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	al, [bp+arg_0]
		mov	byte_48766, al
		mov	byte_4E93E, 0
		call	dword_4DF60
		pop	bp
		retf	2
sub_20B5B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20B78	proc far		; CODE XREF: sub_10CDE+4BP
					; sub_11334+7BP ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	al, [bp+arg_0]
		mov	byte_4DF92, al
		mov	byte_4DBD5, 0
		call	dword_4DF60
		pop	bp
		retf	2
sub_20B78	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20B95	proc far		; CODE XREF: sub_1744E+4FP
					; sub_1744E+F5P ...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	al, [bp+arg_0]
		mov	byte_4DFA8, al
		call	dword_4DF60
		pop	bp
		retf	2
sub_20B95	endp


; =============== S U B	R O U T	I N E =======================================


sub_20BAD	proc far		; CODE XREF: sub_2329F+Fp
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_27099
		retf
sub_20BAD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20BBA	proc far		; CODE XREF: sub_12C2D+6AP
					; sub_135EB+3FP ...

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_8], ax
		les	bx, [bp+arg_4]
		assume es:nothing
		mov	ax, es:[bx+6]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, es:[bx+4]
		add	ax, [bp+arg_0]
		mov	[bp+var_4], ax
		mov	ax, 1ADCh
		push	ds
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_20E76
		or	ax, ax
		jz	short loc_20C3F
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+6]
		shr	ax, 1
		mov	[bp+var_A], ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	cs
		call	near ptr sub_20072
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_6]
		push	ax
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		push	ax
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		add	ax, 8
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		call	dword_4DF50
		push	cs
		call	near ptr sub_200BA

loc_20C3F:				; CODE XREF: sub_20BBA+44j
		mov	sp, bp
		pop	bp
		retf	8
sub_20BBA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20C45	proc near		; CODE XREF: sub_20548+61p

var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		push	di
		push	si
		mov	[bp+var_1E], 0
		mov	ax, [bp+arg_0]
		mov	[bp+var_20], ax
		mov	ax, [bp+arg_2]
		cwd
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx
		mov	ax, [bp+arg_0]
		cwd
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		push	[bp+var_A]
		push	[bp+var_C]
		push	[bp+var_A]
		push	[bp+var_C]
		call	__aFlmul
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+var_10]
		call	__aFlmul
		mov	[bp+var_1C], ax
		mov	[bp+var_1A], dx
		shl	ax, 1
		rcl	dx, 1
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		mov	ax, 4
		cwd
		push	dx
		push	ax
		push	[bp+var_16]
		push	[bp+var_18]
		call	__aFldiv
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_16]
		push	[bp+var_18]
		mov	si, ax
		mov	di, dx
		call	__aFlmul
		mov	cx, [bp+var_1C]
		mov	bx, [bp+var_1A]
		sub	cx, ax
		sbb	bx, dx
		add	cx, si
		adc	bx, di
		mov	[bp+var_14], cx
		mov	[bp+var_12], bx
		sub	ax, ax
		mov	[bp+var_22], ax
		mov	[bp+var_24], ax
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_2]
		push	[bp+var_4]
		call	__aFlmul
		mov	[bp+var_28], ax
		mov	[bp+var_26], dx
		nop
		push	cs
		call	near ptr sub_271BD
		jmp	short loc_20D7C
; ---------------------------------------------------------------------------

loc_20D13:				; CODE XREF: sub_20C45+142j
					; sub_20C45+147j
		cmp	[bp+var_12], 0
		jl	short loc_20D5B
		jg	short loc_20D21
		cmp	[bp+var_14], 0
		jz	short loc_20D5B

loc_20D21:				; CODE XREF: sub_20C45+D4j
		mov	ax, [bp+arg_6]
		sub	ax, [bp+var_1E]
		push	ax
		mov	ax, [bp+var_1E]
		shl	ax, 1
		inc	ax
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_20]
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, [bp+var_20]
		push	ax
		call	sub_20E40
		dec	[bp+var_20]
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		sub	[bp+var_28], ax
		sbb	[bp+var_26], dx
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		sub	[bp+var_14], ax
		sbb	[bp+var_12], dx

loc_20D5B:				; CODE XREF: sub_20C45+D2j
					; sub_20C45+DAj
		inc	[bp+var_1E]
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	[bp+var_24], ax
		adc	[bp+var_22], dx
		mov	ax, [bp+var_1C]
		mov	dx, [bp+var_1A]
		add	ax, [bp+var_24]
		adc	dx, [bp+var_22]
		add	[bp+var_14], ax
		adc	[bp+var_12], dx

loc_20D7C:				; CODE XREF: sub_20C45+CCj
		mov	ax, [bp+var_28]
		mov	dx, [bp+var_26]
		cmp	[bp+var_22], dx
		jg	short loc_20D8E
		jl	short loc_20D13
		cmp	[bp+var_24], ax
		jb	short loc_20D13

loc_20D8E:				; CODE XREF: sub_20C45+140j
		mov	ax, 2
		cwd
		push	dx
		push	ax
		cwd
		push	dx
		push	ax
		mov	ax, 3
		cwd
		push	dx
		push	ax
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sub	ax, [bp+var_1C]
		sbb	dx, [bp+var_1A]
		push	dx
		push	ax
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		sub	ax, [bp+var_24]
		sbb	dx, [bp+var_22]
		sub	ax, [bp+var_28]
		sbb	dx, [bp+var_26]
		push	dx
		push	ax
		call	__aFldiv
		jmp	short loc_20E27
; ---------------------------------------------------------------------------

loc_20DCC:				; CODE XREF: sub_20C45+1ECj
		mov	ax, [bp+arg_6]
		sub	ax, [bp+var_1E]
		push	ax
		mov	ax, [bp+var_1E]
		shl	ax, 1
		inc	ax
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_20]
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, [bp+var_20]
		push	ax
		call	sub_20E40
		cmp	[bp+var_12], 0
		jge	short loc_20E0C
		inc	[bp+var_1E]
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		add	[bp+var_24], ax
		adc	[bp+var_22], dx
		mov	ax, [bp+var_24]
		mov	dx, [bp+var_22]
		add	[bp+var_14], ax
		adc	[bp+var_12], dx

loc_20E0C:				; CODE XREF: sub_20C45+1AAj
		dec	[bp+var_20]
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		sub	[bp+var_28], ax
		sbb	[bp+var_26], dx
		mov	ax, [bp+var_18]
		mov	dx, [bp+var_16]
		sub	ax, [bp+var_28]
		sbb	dx, [bp+var_26]

loc_20E27:				; CODE XREF: sub_20C45+185j
		add	[bp+var_14], ax
		adc	[bp+var_12], dx
		cmp	[bp+var_20], 0
		jge	short loc_20DCC
		nop
		push	cs
		call	near ptr sub_2711B
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_20C45	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20E40	proc near		; CODE XREF: sub_20C45+F8p
					; sub_20C45+1A3p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_2]
		call	dword_4B3A2
		push	[bp+arg_4]
		call	dword_48788
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], ax
		jz	short loc_20E72
		push	[bp+arg_6]
		push	ax
		call	dword_4B3A2
		push	[bp+arg_4]
		call	dword_48788

loc_20E72:				; CODE XREF: sub_20E40+21j
		pop	bp
		retn	8
sub_20E40	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20E76	proc far		; CODE XREF: seg000:3766P
					; sub_20BBA+3Fp ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	ds
		lds	si, [bp+arg_8]
		mov	ax, [si]
		mov	bx, [si+4]
		lds	si, [bp+arg_4]
		mov	cx, [si]
		mov	dx, [si+4]
		cmp	ax, bx
		jge	short loc_20EF7
		cmp	cx, dx
		jge	short loc_20EF7
		cmp	cx, ax
		jg	short loc_20E9F
		jz	short loc_20EA5
		cmp	dx, ax
		jle	short loc_20EF7
		jmp	short loc_20EA5
; ---------------------------------------------------------------------------

loc_20E9F:				; CODE XREF: sub_20E76+1Fj
		cmp	cx, bx
		jge	short loc_20EF7
		mov	ax, cx

loc_20EA5:				; CODE XREF: sub_20E76+21j
					; sub_20E76+27j
		cmp	dx, bx
		jg	short loc_20EAB
		mov	bx, dx

loc_20EAB:				; CODE XREF: sub_20E76+31j
		lds	si, [bp+arg_0]
		mov	[si], ax
		mov	[si+4],	bx
		lds	si, [bp+arg_8]
		mov	dx, [si+2]
		mov	cx, [si+6]
		lds	si, [bp+arg_4]
		mov	bx, [si+2]
		mov	ax, [si+6]
		cmp	dx, cx
		jge	short loc_20EF7
		cmp	bx, ax
		jge	short loc_20EF7
		cmp	bx, dx
		jg	short loc_20ED9
		jz	short loc_20EDF
		cmp	ax, dx
		jle	short loc_20EF7
		jmp	short loc_20EDF
; ---------------------------------------------------------------------------

loc_20ED9:				; CODE XREF: sub_20E76+59j
		cmp	bx, cx
		jge	short loc_20EF7
		mov	dx, bx

loc_20EDF:				; CODE XREF: sub_20E76+5Bj
					; sub_20E76+61j
		cmp	ax, cx
		jg	short loc_20EE5
		mov	cx, ax

loc_20EE5:				; CODE XREF: sub_20E76+6Bj
		lds	si, [bp+arg_0]
		mov	[si+2],	dx
		mov	[si+6],	cx
		mov	ax, 1

loc_20EF1:				; CODE XREF: sub_20E76+91j
		pop	ds
		pop	si
		pop	bp
		retf	8
; ---------------------------------------------------------------------------

loc_20EF7:				; CODE XREF: sub_20E76+17j
					; sub_20E76+1Bj ...
		sub	ax, ax
		lds	si, [bp+arg_0]
		mov	[si], ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		mov	[si+6],	ax
		jmp	short loc_20EF1
sub_20E76	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20F09	proc far		; CODE XREF: sub_2925A+318p
					; sub_2925A+85Dp ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	ds
		lds	si, [bp+arg_8]
		mov	ax, [si]
		mov	bx, [si+4]
		lds	si, [bp+arg_4]
		mov	cx, [si]
		mov	dx, [si+4]
		cmp	ax, bx
		jge	short loc_20F9C
		cmp	cx, dx
		jge	short loc_20F79
		cmp	cx, ax
		jg	short loc_20F2C
		mov	ax, cx

loc_20F2C:				; CODE XREF: sub_20F09+1Fj
		cmp	dx, bx
		jl	short loc_20F32
		mov	bx, dx

loc_20F32:				; CODE XREF: sub_20F09+25j
		lds	si, [bp+arg_0]
		mov	[si], ax
		mov	[si+4],	bx
		lds	si, [bp+arg_8]
		mov	dx, [si+2]
		mov	cx, [si+6]
		lds	si, [bp+arg_4]
		mov	bx, [si+2]
		mov	ax, [si+6]
		cmp	dx, cx
		jge	short loc_20F92
		cmp	bx, ax
		jge	short loc_20F6F
		cmp	bx, dx
		jg	short loc_20F5A
		mov	dx, bx

loc_20F5A:				; CODE XREF: sub_20F09+4Dj
		cmp	ax, cx
		jl	short loc_20F60
		mov	cx, ax

loc_20F60:				; CODE XREF: sub_20F09+53j
		lds	si, [bp+arg_0]
		mov	[si+2],	dx
		mov	[si+6],	cx

loc_20F69:				; CODE XREF: sub_20F09+87j
					; sub_20F09+AAj
		pop	ds
		pop	si
		pop	bp
		retf	8
; ---------------------------------------------------------------------------

loc_20F6F:				; CODE XREF: sub_20F09+49j
		lds	si, [bp+arg_8]
		mov	ax, [si]
		mov	bx, [si+4]
		jmp	short loc_20F82
; ---------------------------------------------------------------------------

loc_20F79:				; CODE XREF: sub_20F09+1Bj
		lds	si, [bp+arg_8]
		mov	dx, [si+2]
		mov	cx, [si+6]

loc_20F82:				; CODE XREF: sub_20F09+6Ej
		lds	si, [bp+arg_0]
		mov	[si+2],	dx
		mov	[si+6],	cx
		mov	[si], ax
		mov	[si+4],	bx
		jmp	short loc_20F69
; ---------------------------------------------------------------------------

loc_20F92:				; CODE XREF: sub_20F09+45j
		lds	si, [bp+arg_4]
		mov	cx, [si]
		mov	dx, [si+4]
		jmp	short loc_20FA5
; ---------------------------------------------------------------------------

loc_20F9C:				; CODE XREF: sub_20F09+17j
		lds	si, [bp+arg_4]
		mov	bx, [si+2]
		mov	ax, [si+6]

loc_20FA5:				; CODE XREF: sub_20F09+91j
		lds	si, [bp+arg_0]
		mov	[si+2],	bx
		mov	[si+6],	ax
		mov	[si], cx
		mov	[si+4],	dx
		jmp	short loc_20F69
sub_20F09	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_20FB6	proc far		; CODE XREF: sub_23E78+95p

var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= REGS ptr -20h
var_12		= REGS ptr -12h
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		mov	ax, 26h	; '&'
		call	__chkstk
		mov	ax, 6568h
		push	ds
		push	ax		; unsigned int *
		call	__dos_getdrive
		add	sp, 4
		mov	ax, 6506h
		push	ds
		push	ax		; unsigned int *
		push	word_47548	; unsigned int
		call	__dos_setdrive
		add	sp, 6
		mov	ax, 6508h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20483
		mov	ax, word_474E8
		add	ax, word_474EA
		add	ax, word_474EE
		mov	word_4759A, ax
		mov	ax, 0Dh
		imul	word_474EC
		mov	word_4754A, ax
		mov	ax, word_474E6
		add	ax, 13h
		cmp	ax, 1Eh
		jbe	short loc_2100F
		mov	ax, 1Eh

loc_2100F:				; CODE XREF: sub_20FB6+54j
		mov	word_47546, ax
		mov	ax, 14E4h
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], ds
		mov	ax, 18h
		mul	word_47546
		add	ax, 1214h
		mov	[bp+var_26], ax
		mov	[bp+var_24], ds
		jmp	short loc_21039
; ---------------------------------------------------------------------------

loc_2102D:				; CODE XREF: sub_20FB6+8Cj
		les	bx, [bp+var_4]
		or	byte ptr es:[bx+12h], 80h
		sub	word ptr [bp+var_4], 18h

loc_21039:				; CODE XREF: sub_20FB6+75j
		mov	ax, [bp+var_26]
		mov	dx, [bp+var_24]
		cmp	word ptr [bp+var_4], ax
		ja	short loc_2102D
		call	sub_34D60
		test	al, 0C0h
		jnz	short loc_21052
		or	byte_423FE, 80h

loc_21052:				; CODE XREF: sub_20FB6+95j
		cmp	byte ptr word_46657, 3
		jb	short loc_2109D
		mov	[bp+var_22], 3
		jmp	short loc_21092
; ---------------------------------------------------------------------------

loc_21060:				; CODE XREF: sub_20FB6+E5j
		mov	word ptr [bp+var_12], 4408h
		mov	al, byte ptr [bp+var_22]
		mov	byte ptr [bp+var_12+2],	al
		lea	ax, [bp+var_20]
		push	ss
		push	ax		; union	REGS *
		lea	ax, [bp+var_12]
		push	ss
		push	ax		; union	REGS *
		call	_intdos
		add	sp, 8
		cmp	ax, 1
		jz	short loc_2108F
		mov	ax, 18h
		imul	[bp+var_22]
		mov	bx, ax
		or	byte ptr [bx+13EEh], 80h

loc_2108F:				; CODE XREF: sub_20FB6+CAj
		inc	[bp+var_22]

loc_21092:				; CODE XREF: sub_20FB6+A8j
		mov	ax, word_47546
		sub	ax, 13h
		cmp	[bp+var_22], ax
		jbe	short loc_21060

loc_2109D:				; CODE XREF: sub_20FB6+A1j
		mov	ax, 1066h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1C51D
		mov	sp, bp
		pop	bp
		retf
sub_20FB6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_210AE	proc near		; CODE XREF: sub_210F9+96p
					; sub_21616+18Dp

var_4		= dword	ptr -4
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_210F3
		mov	ax, 13F4h
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], ds
		jmp	short loc_210E2
; ---------------------------------------------------------------------------

loc_210CA:				; CODE XREF: sub_210AE+43j
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_0]
		add	es:[bx+2], ax
		les	bx, [bp+var_4]
		mov	ax, [bp+arg_0]
		add	es:[bx+6], ax
		add	word ptr [bp+var_4], 18h

loc_210E2:				; CODE XREF: sub_210AE+1Aj
		mov	ax, 18h
		mul	word_47546
		add	ax, 1214h
		mov	cx, ds
		cmp	ax, word ptr [bp+var_4]
		jnb	short loc_210CA

loc_210F3:				; CODE XREF: sub_210AE+Fj
		mov	sp, bp
		pop	bp
		retn	2
sub_210AE	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_210F9	proc far		; CODE XREF: sub_17C9B+23P

var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= byte ptr -3Ah
var_38		= byte ptr -38h
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		mov	ax, 42h	; 'B'
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_2112E
		nop
		push	cs
		call	near ptr sub_25276
		jmp	loc_215F3
; ---------------------------------------------------------------------------

loc_2112E:				; CODE XREF: sub_210F9+2Bj
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_A]
		mov	word_42560, ax
		mov	word_42562, dx
		mov	ax, 64C0h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_2290A
		call	sub_22FD4
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; __int32
		sub	ax, ax
		push	ax		; int
		call	sub_229A9
		mov	ax, word_42542
		sub	ax, word_4253E
		dec	ax
		dec	ax
		sub	dx, dx
		div	word_4759A
		mov	word_474F2, ax
		mov	ax, word_4758E
		cmp	word_474F2, ax
		jbe	short loc_21176
		mov	word_474F2, ax

loc_21176:				; CODE XREF: sub_210F9+78j
		mov	ax, 0FFFFh
		mov	[bp+var_12], ax
		mov	[bp+var_8], ax
		sub	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_6], ax
		mov	ax, 1Ch
		sub	ax, word_423D6
		push	ax
		call	sub_210AE
		mov	ax, 158Ch
		push	ds
		push	ax
		push	[bp+arg_E]
		push	[bp+arg_C]
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, 158Ch
		push	ds
		push	ax
		call	sub_15564
		mov	word_4753E, ax
		mov	word_47540, dx
		mov	ax, 158Ch
		push	ds
		push	ax
		mov	ax, [bp+arg_E]
		neg	ax
		push	ax
		mov	ax, [bp+arg_C]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, 16ABh
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1544A
		mov	word_474E2, ax
		mov	word_474E4, dx
		lea	ax, [bp+var_38]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_211FD
		nop
		push	cs
		call	near ptr sub_25276
		jmp	loc_215D6
; ---------------------------------------------------------------------------

loc_211FD:				; CODE XREF: sub_210F9+FAj
					; sub_210F9+4D5j
		push	word_47540
		push	word_4753E
		mov	ax, 0Ch
		push	ax
		call	sub_15363
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		push	dx
		push	ax
		call	sub_1B047
		les	bx, [bp+var_C]
		les	bx, es:[bx]
		mov	al, es:[bx+11h]
		mov	[bp+var_3A], al
		or	al, al
		jz	short loc_2124C
		push	word_47540
		push	word_4753E
		mov	ax, 0Ch
		push	ax
		call	sub_154F5
		mov	cl, [bp+var_3A]
		sub	ch, ch
		add	cx, ax
		sub	cx, 20h	; ' '
		mov	[bp+var_8], cx
		jmp	short loc_21255
; ---------------------------------------------------------------------------

loc_2124C:				; CODE XREF: sub_210F9+131j
		mov	ax, 0FFFFh
		mov	[bp+var_12], ax
		mov	[bp+var_8], ax

loc_21255:				; CODE XREF: sub_210F9+151j
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		call	sub_1B063
		cmp	[bp+var_8], 0FFFFh
		jz	short loc_21278
		mov	ax, 0Fh
		imul	[bp+var_8]
		mov	bx, ax
		les	si, dword_4753A
		test	byte ptr es:[bx+si], 80h
		jz	short loc_2127D

loc_21278:				; CODE XREF: sub_210F9+16Bj
		mov	ax, 0FFh
		jmp	short loc_2127F
; ---------------------------------------------------------------------------

loc_2127D:				; CODE XREF: sub_210F9+17Dj
		sub	ax, ax

loc_2127F:				; CODE XREF: sub_210F9+182j
		push	ax
		push	word_47540
		push	word_4753E
		mov	ax, 1
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_11C58
		push	word_47540
		push	word_4753E
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15650
		mov	[bp+var_10], ax
		mov	[bp+var_E], dx
		mov	[bp+var_26], ax
		mov	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [bp+var_26]
		sub	ax, 1
		cmp	ax, 1Ch
		ja	short loc_212E1
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_2158E[bx]
; ---------------------------------------------------------------------------
		push	[bp+var_26]
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_21DA8

loc_212D6:				; CODE XREF: sub_210F9+300j
		push	word_47540
		push	word_4753E
		call	sub_21E98

loc_212E1:				; CODE XREF: sub_210F9+1C7j
					; sub_210F9+1CCj ...
		mov	[bp+var_12], 0FFFFh
		jmp	loc_215C8
; ---------------------------------------------------------------------------

loc_212E9:				; CODE XREF: sub_210F9+1CCj
					; sub_210F9+464j
					; DATA XREF: ...
		mov	ax, 0Fh
		imul	[bp+var_8]
		mov	si, ax
		les	bx, dword_4753A
		lea	di, [bx+si+1]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	ax, cx
		mov	dx, ax
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, dx
		inc	cx
		cmp	cx, 40h	; '@'
		jbe	short loc_2134B
		dec	word_46CA0
		js	short loc_21338
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_212E1
; ---------------------------------------------------------------------------

loc_21338:				; CODE XREF: sub_210F9+22Aj
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6
		jmp	short loc_212E1
; ---------------------------------------------------------------------------

loc_2134B:				; CODE XREF: sub_210F9+224j
		mov	ax, 0Fh
		imul	[bp+var_8]
		mov	bx, ax
		les	si, dword_4753A
		assume es:nothing
		test	byte ptr es:[bx+si], 40h
		jnz	short loc_21360
		jmp	loc_213FC
; ---------------------------------------------------------------------------

loc_21360:				; CODE XREF: sub_210F9+262j
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx+64BFh], 5Ch ; '\'
		jz	short loc_213A1
		mov	di, 17A6h
		mov	si, 64C0h
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_213A1:				; CODE XREF: sub_210F9+27Fj
		mov	ax, 0Fh
		imul	[bp+var_8]
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		inc	ax
		mov	bx, ax
		mov	word ptr [bp+var_3E], bx
		mov	word ptr [bp+var_3E+2],	dx
		mov	si, 64C0h
		les	di, [bp+var_3E]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx

loc_213E5:				; CODE XREF: sub_210F9+43Bj
		call	sub_22FD4
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; __int32
		sub	ax, ax
		push	ax		; int
		call	sub_229A9
		jmp	loc_212D6
; ---------------------------------------------------------------------------

loc_213FC:				; CODE XREF: sub_210F9+264j
		les	bx, [bp+arg_0]
		assume es:nothing
		mov	word ptr es:[bx], 1
		mov	ax, 0Fh
		imul	[bp+var_8]
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		inc	ax
		mov	cx, word ptr [bp+arg_0]
		mov	bx, word ptr [bp+arg_0+2]
		add	cx, 6
		mov	word ptr [bp+var_3E], ax
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_42], cx
		mov	word ptr [bp+var_42+2],	bx
		les	di, [bp+var_3E]
		push	ds
		lds	si, [bp+var_42]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, word ptr [bp+arg_0]
		add	ax, 14h
		mov	bx, ax
		mov	word ptr [bp+var_42], bx
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp+var_42]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, 0Fh
		imul	[bp+var_8]
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		inc	ax
		mov	cx, word ptr [bp+arg_0]
		mov	bx, es
		add	cx, 14h
		mov	word ptr [bp+var_42], ax
		mov	word ptr [bp+var_42+2],	dx
		mov	word ptr [bp+var_3E], cx
		mov	word ptr [bp+var_3E+2],	bx
		les	di, [bp+var_42]
		assume es:nothing
		push	ds
		lds	si, [bp+var_3E]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, 64C0h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_22943
		mov	ax, 6506h
		push	ds
		push	ax		; unsigned int *
		push	word_47548	; unsigned int
		call	__dos_setdrive
		add	sp, 6
		jmp	loc_215D1
; ---------------------------------------------------------------------------

loc_214E8:				; CODE XREF: sub_210F9+1CCj
					; DATA XREF: sub_210F9+4A7o
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx+64BEh], 3Ah ; ':'
		jnz	short loc_21505
		jmp	loc_212E1
; ---------------------------------------------------------------------------

loc_21505:				; CODE XREF: sub_210F9+407j
		mov	di, 64C0h
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		mov	byte ptr [bx+64BFh], 0
		mov	ax, 5Ch	; '\'
		push	ax		; int
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	bx, ax
		mov	es, dx
		assume es:nothing
		mov	byte ptr es:[bx], 0
		jmp	loc_213E5
; ---------------------------------------------------------------------------
		align 2
		push	cs
		call	near ptr sub_26DFB
		mov	si, ax
		mov	di, dx
		call	sub_1FBD0
		sub	ax, [bp+var_6]
		sbb	dx, [bp+var_4]
		cmp	dx, di
		ja	short loc_21560
		jb	short loc_21555
		cmp	ax, si
		jnb	short loc_21560

loc_21555:				; CODE XREF: sub_210F9+456j
		mov	ax, [bp+var_12]
		cmp	[bp+var_2], ax
		jnz	short loc_21560
		jmp	loc_212E9
; ---------------------------------------------------------------------------

loc_21560:				; CODE XREF: sub_210F9+454j
					; sub_210F9+45Aj ...
		push	[bp+var_2]
		push	word_47540
		push	word_4753E
		mov	ax, 0Ch
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_11C58
		call	sub_1FBD0
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_2]
		mov	[bp+var_12], ax
		jmp	short loc_215C8
; ---------------------------------------------------------------------------
off_2158E	dw offset loc_212E9	; DATA XREF: sub_210F9+1CCr
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_212E1
		dw offset loc_214E8
		dw offset loc_212E1
		db 0E7h, 15h, 91h, 13h,	91h, 13h, 91h, 13h, 91h, 13h, 91h
		db 13h,	91h, 13h, 91h, 13h, 7Ah, 13h, 7Ah, 13h,	7Ah, 13h
		db 7Ah,	13h, 7Ah, 13h, 7Ah, 13h, 7Ah, 13h, 7Ah,	13h, 7Ah
		db 13h,	7Ah, 13h
; ---------------------------------------------------------------------------

loc_215C8:				; CODE XREF: sub_210F9+1EDj
					; sub_210F9+493j
		cmp	[bp+var_26], 2
		jz	short loc_215D1
		jmp	loc_211FD
; ---------------------------------------------------------------------------

loc_215D1:				; CODE XREF: sub_210F9+3ECj
					; sub_210F9+4D3j
		call	sub_1B0CF

loc_215D6:				; CODE XREF: sub_210F9+101j
		push	word_474E4
		push	word_474E2
		call	sub_1544A
		push	word_47540
		push	word_4753E
		call	sub_21E5B
		call	sub_1B0CF

loc_215F3:				; CODE XREF: sub_210F9+32j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	10h
sub_210F9	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word_47540
		push	word_4753E
		call	sub_14B6B
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_21616(__int32, __int32, int, char *, int, int, int, int)
sub_21616	proc far		; CODE XREF: sub_17E89+36P

var_4A		= dword	ptr -4Ah
var_46		= byte ptr -46h
var_44		= byte ptr -44h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= byte ptr -2Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah

		push	bp
		mov	bp, sp
		mov	ax, 4Ah	; 'J'
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		lea	ax, [bp+var_2C]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_2164B
		nop
		push	cs
		call	near ptr sub_25276
		jmp	loc_21D19
; ---------------------------------------------------------------------------

loc_2164B:				; CODE XREF: sub_21616+2Bj
		mov	ax, [bp+arg_E]
		mov	dx, [bp+arg_10]
		mov	word_4266E, ax
		mov	word_42670, dx
		mov	ax, [bp+arg_8]
		mov	word_47598, ax
		cmp	ax, 8
		jbe	short loc_21669
		mov	word_47598, 8

loc_21669:				; CODE XREF: sub_21616+4Bj
		mov	ax, 64B2h
		push	ds
		push	ax		; char *
		push	word ptr [bp+arg_A+2]
		push	word ptr [bp+arg_A] ; char *
		nop
		push	cs
		call	near ptr sub_231D1
		mov	bx, word_47598
		mov	byte ptr [bx+64B2h], 0
		mov	ax, 2Eh	; '.'
		push	ax		; int
		mov	ax, 64B2h
		push	ds
		push	ax		; char *
		call	_strchr
		add	sp, 6
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		or	dx, ax
		jz	short loc_216A4
		les	bx, [bp+var_C]
		mov	byte ptr es:[bx], 0

loc_216A4:				; CODE XREF: sub_21616+85j
		mov	ax, 64B2h
		push	ds
		push	ax		; char *
		call	_strupr
		add	sp, 4
		mov	di, 64B2h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	word_42696, cx
		or	cx, cx
		jz	short loc_216D2
		mov	word_47594, 2
		jmp	short loc_216D8
; ---------------------------------------------------------------------------

loc_216D2:				; CODE XREF: sub_21616+B2j
		mov	word_47594, 0

loc_216D8:				; CODE XREF: sub_21616+BAj
		mov	si, 64C0h
		les	di, [bp+arg_A]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	ax, 5Ch	; '\'
		push	ax		; int
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_10], ax
		mov	word ptr [bp+var_10+2],	dx
		mov	ax, 2Fh	; '/'
		push	ax		; int
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_32], ax
		mov	word ptr [bp+var_32+2],	dx
		cmp	word ptr [bp+var_10], ax
		jbe	short loc_21733
		les	bx, [bp+var_10]
		assume es:nothing
		jmp	short loc_2173E
; ---------------------------------------------------------------------------

loc_21733:				; CODE XREF: sub_21616+116j
		mov	ax, word ptr [bp+var_32]
		or	ax, word ptr [bp+var_32+2]
		jz	short loc_21742
		les	bx, [bp+var_32]

loc_2173E:				; CODE XREF: sub_21616+11Bj
		mov	byte ptr es:[bx], 0

loc_21742:				; CODE XREF: sub_21616+123j
		cmp	byte_474A0, 0
		jnz	short loc_21752
		mov	ax, 64C0h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_2290A

loc_21752:				; CODE XREF: sub_21616+131j
		call	sub_22FD4
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		mov	ax, 2990h
		mov	dx, seg	seg001
		push	dx
		push	ax		; __int32
		mov	ax, 1
		push	ax		; int
		call	sub_229A9
		mov	ax, word_42650
		sub	ax, word_4264C
		dec	ax
		dec	ax
		sub	dx, dx
		div	word_4759A
		mov	word_474F2, ax
		mov	word_474F0, ax
		mov	ax, word_4758E
		cmp	word_474F2, ax
		jbe	short loc_2178A
		mov	word_474F2, ax

loc_2178A:				; CODE XREF: sub_21616+16Fj
		mov	ax, 0FFFFh
		mov	[bp+var_1A], ax
		mov	[bp+var_8], ax
		sub	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_6], ax
		mov	ax, 0Eh
		sub	ax, word_423D6
		push	ax
		call	sub_210AE
		mov	ax, 16D6h
		push	ds
		push	ax
		push	[bp+arg_14]
		push	[bp+arg_12]
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, 16D6h
		push	ds
		push	ax
		call	sub_15564
		mov	word_47542, ax
		mov	word_47544, dx
		mov	ax, 16D6h
		push	ds
		push	ax
		mov	ax, [bp+arg_14]
		neg	ax
		push	ax
		mov	ax, [bp+arg_12]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, 1E3Dh
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1544A
		mov	word_474E2, ax
		mov	word_474E4, dx
		call	sub_14C44
		lea	ax, [bp+var_44]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_21816
		nop
		push	cs
		call	near ptr sub_25276
		jmp	loc_21CF7
; ---------------------------------------------------------------------------

loc_21816:				; CODE XREF: sub_21616+1F6j
					; sub_21616+6D9j
		push	word_47544
		push	word_47542
		mov	ax, 0Ch
		push	ax
		call	sub_15363
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		push	dx
		push	ax
		call	sub_1B047
		les	bx, [bp+var_14]
		les	bx, es:[bx]
		mov	al, es:[bx+11h]
		mov	[bp+var_46], al
		or	al, al
		jz	short loc_21865
		push	word_47544
		push	word_47542
		mov	ax, 0Ch
		push	ax
		call	sub_154F5
		mov	cl, [bp+var_46]
		sub	ch, ch
		add	cx, ax
		sub	cx, 20h	; ' '
		mov	[bp+var_8], cx
		jmp	short loc_2186E
; ---------------------------------------------------------------------------

loc_21865:				; CODE XREF: sub_21616+22Dj
		mov	ax, 0FFFFh
		mov	[bp+var_1A], ax
		mov	[bp+var_8], ax

loc_2186E:				; CODE XREF: sub_21616+24Dj
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		call	sub_1B063
		cmp	[bp+var_8], 0FFFFh
		jz	short loc_21891
		mov	ax, 0Fh
		imul	[bp+var_8]
		mov	bx, ax
		les	si, dword_4753A
		test	byte ptr es:[bx+si], 80h
		jz	short loc_21896

loc_21891:				; CODE XREF: sub_21616+267j
		mov	ax, 0FFh
		jmp	short loc_21898
; ---------------------------------------------------------------------------

loc_21896:				; CODE XREF: sub_21616+279j
		sub	ax, ax

loc_21898:				; CODE XREF: sub_21616+27Ej
		push	ax
		push	word_47544
		push	word_47542
		mov	ax, 5
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_11C58
		cmp	byte_47492, 0
		jnz	short loc_218BD
		mov	ax, 0FFh
		jmp	short loc_218BF
; ---------------------------------------------------------------------------

loc_218BD:				; CODE XREF: sub_21616+2A0j
		sub	ax, ax

loc_218BF:				; CODE XREF: sub_21616+2A5j
		push	ax
		push	word_47544
		push	word_47542
		mov	ax, 1
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_11C58
		push	word_47544
		push	word_47542
		mov	ax, 283Ch
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_15650
		mov	[bp+var_18], ax
		mov	[bp+var_16], dx
		mov	[bp+var_2E], ax
		mov	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2E]
		sub	ax, 1
		cmp	ax, 1Ch
		ja	short loc_2192A
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_21CAF[bx]
; ---------------------------------------------------------------------------
		push	[bp+var_2E]
		mov	ax, 2990h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_21DA8
		push	word_47544
		push	word_47542
		call	sub_21E98
		call	sub_21D3C

loc_2192A:				; CODE XREF: sub_21616+2EEj
					; sub_21616+2F3j ...
		mov	[bp+var_1A], 0FFFFh
		jmp	loc_21CE9
; ---------------------------------------------------------------------------

loc_21932:				; CODE XREF: sub_21616+2F3j
					; DATA XREF: sub_21616:off_21CAFo
		mov	di, 64B2h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	ax, cx
		mov	dx, ax
		mov	di, 64C0h
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, dx
		inc	cx
		cmp	cx, 40h	; '@'
		jbe	short loc_2198A

loc_2195E:				; CODE XREF: sub_21616+39Dj
					; sub_21616+53Fj
		dec	word_46CA0
		js	short loc_21977
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_2192A
; ---------------------------------------------------------------------------

loc_21977:				; CODE XREF: sub_21616+34Cj
		mov	ax, 5CBCh
		push	ds
		push	ax		; FILE *
		mov	ax, 7
		push	ax		; int
		call	__flsbuf
		add	sp, 6
		jmp	short loc_2192A
; ---------------------------------------------------------------------------

loc_2198A:				; CODE XREF: sub_21616+346j
		mov	ax, 64C0h
		push	ds
		push	ax
		mov	ax, 64B2h
		push	ds
		push	ax
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		call	sub_22CAC
		or	ax, ax
		jnz	short loc_219A4
		jmp	loc_21A46
; ---------------------------------------------------------------------------

loc_219A4:				; CODE XREF: sub_21616+389j
		mov	ax, 64C0h
		push	ds
		push	ax
		mov	ax, 64B2h
		push	ds
		push	ax
		call	sub_22F19
		or	ax, ax
		jnz	short loc_2195E
		mov	di, 64B2h
		mov	si, 13E1h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	di, 17A8h
		mov	si, 13CAh
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ax, 1784h
		push	ds
		push	ax
		push	[bp+arg_14]
		push	[bp+arg_12]
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, 1784h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A4B
		mov	[bp+var_18], ax
		mov	[bp+var_16], 0
		mov	ax, 1784h
		push	ds
		push	ax
		mov	ax, [bp+arg_14]
		neg	ax
		push	ax
		mov	ax, [bp+arg_12]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		cmp	[bp+var_18], 2
		jnz	short loc_21A46
		cmp	[bp+var_16], 0
		jnz	short loc_21A46
		jmp	loc_2192A
; ---------------------------------------------------------------------------

loc_21A46:				; CODE XREF: sub_21616+38Bj
					; sub_21616+425j ...
		les	bx, [bp+arg_0]
		assume es:nothing
		mov	word ptr es:[bx], 1
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		add	ax, 6
		mov	bx, ax
		mov	word ptr [bp+var_4A], bx
		mov	word ptr [bp+var_4A+2],	dx
		mov	di, 64B2h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_4A]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:nothing
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, word ptr [bp+arg_0]
		add	ax, 14h
		mov	bx, ax
		mov	word ptr [bp+var_4A], bx
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_4A]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:nothing
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, word ptr [bp+arg_0]
		add	ax, 14h
		mov	bx, ax
		mov	word ptr [bp+var_4A], bx
		mov	di, 64B2h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+var_4A]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:nothing
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, 64C0h
		push	ds
		push	ax
		push	cs
		call	near ptr sub_22943
		mov	ax, 6506h
		push	ds
		push	ax		; unsigned int *
		push	word_47548	; unsigned int
		call	__dos_setdrive
		add	sp, 6
		jmp	loc_21CF2
; ---------------------------------------------------------------------------

loc_21B0B:				; CODE XREF: sub_21616+2F3j
					; sub_21616+668j
					; DATA XREF: ...
		les	di, [bp+arg_4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	ax, cx
		mov	dx, ax
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, dx
		mov	ax, 0Fh
		imul	[bp+var_8]
		mov	si, ax
		les	bx, dword_4753A
		assume es:nothing
		mov	ax, cx
		mov	dx, ax
		lea	di, [bx+si+1]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	dx, cx
		inc	dx
		inc	dx
		cmp	dx, 40h	; '@'
		jbe	short loc_21B58
		jmp	loc_2195E
; ---------------------------------------------------------------------------

loc_21B58:				; CODE XREF: sub_21616+53Dj
		call	sub_21D3C
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx+64BFh], 5Ch ; '\'
		jz	short loc_21B9C
		mov	di, 17ABh
		mov	si, 64C0h
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_21B9C:				; CODE XREF: sub_21616+55Dj
		mov	ax, 0Fh
		imul	[bp+var_8]
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		inc	ax
		mov	bx, ax
		mov	word ptr [bp+var_4A], bx
		mov	word ptr [bp+var_4A+2],	dx
		mov	si, 64C0h
		les	di, [bp+var_4A]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx

loc_21BE0:				; CODE XREF: sub_21616+640j
		call	sub_22FD4
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		mov	ax, 2990h
		mov	dx, seg	seg001
		push	dx
		push	ax		; __int32
		mov	ax, 1
		push	ax		; int
		call	sub_229A9
		push	word_47544
		push	word_47542
		call	sub_21E98
		jmp	loc_2192A
; ---------------------------------------------------------------------------

loc_21C05:				; CODE XREF: sub_21616+2F3j
					; DATA XREF: sub_21616+6ABo
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx+64BEh], 3Ah ; ':'
		jnz	short loc_21C22
		jmp	loc_2192A
; ---------------------------------------------------------------------------

loc_21C22:				; CODE XREF: sub_21616+607j
		call	sub_21D3C
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		mov	byte ptr [bx+64BFh], 0
		mov	ax, 5Ch	; '\'
		push	ax		; int
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	bx, ax
		mov	es, dx
		assume es:nothing
		mov	byte ptr es:[bx], 0
		jmp	short loc_21BE0
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		push	cs
		call	near ptr sub_26DFB
		mov	si, ax
		mov	di, dx
		call	sub_1FBD0
		sub	ax, [bp+var_6]
		sbb	dx, [bp+var_4]
		cmp	dx, di
		ja	short loc_21C81
		jb	short loc_21C76
		cmp	ax, si
		jnb	short loc_21C81

loc_21C76:				; CODE XREF: sub_21616+65Aj
		mov	ax, [bp+var_1A]
		cmp	[bp+var_2], ax
		jnz	short loc_21C81
		jmp	loc_21B0B
; ---------------------------------------------------------------------------

loc_21C81:				; CODE XREF: sub_21616+658j
					; sub_21616+65Ej ...
		push	[bp+var_2]
		push	word_47544
		push	word_47542
		mov	ax, 0Ch
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_11C58
		call	sub_1FBD0
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_2]
		mov	[bp+var_1A], ax
		jmp	short loc_21CE9
; ---------------------------------------------------------------------------
off_21CAF	dw offset loc_21932	; DATA XREF: sub_21616+2F3r
		dw offset loc_2192A
		dw offset loc_2192A
		dw offset loc_2192A
		dw offset loc_21B0B
		dw offset loc_2192A
		dw offset loc_2192A
		dw offset loc_2192A
		dw offset loc_2192A
		dw offset loc_21C05
		dw offset loc_2192A
		db 8, 1Dh, 0DAh, 19h, 0DAh, 19h, 0DAh, 19h, 0DAh, 19h
		db 0DAh, 19h, 0DAh, 19h, 0DAh, 19h, 0BEh, 19h, 0BEh, 19h
		db 0BEh, 19h, 0BEh, 19h, 0BEh, 19h, 0BEh, 19h, 0BEh, 19h
		db 0BEh, 19h, 0BEh, 19h, 0BEh, 19h
; ---------------------------------------------------------------------------

loc_21CE9:				; CODE XREF: sub_21616+319j
					; sub_21616+697j
		cmp	[bp+var_2E], 2
		jz	short loc_21CF2
		jmp	loc_21816
; ---------------------------------------------------------------------------

loc_21CF2:				; CODE XREF: sub_21616+4F2j
					; sub_21616+6D7j
		call	sub_1B0CF

loc_21CF7:				; CODE XREF: sub_21616+1FDj
		call	sub_14D1E
		push	word_474E4
		push	word_474E2
		call	sub_1544A
		push	word_47544
		push	word_47542
		call	sub_21E5B
		call	sub_1B0CF

loc_21D19:				; CODE XREF: sub_21616+32j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	16h
sub_21616	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_21D21	proc far		; CODE XREF: sub_198ED+2AP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word ptr dword_498F0, ax
		mov	word ptr dword_498F0+2,	dx
		pop	bp
		retf	4
sub_21D21	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_21D3C	proc near		; CODE XREF: sub_21616+311p
					; sub_21616:loc_21B58p	...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		cmp	word_47594, 2
		jnz	short loc_21D89
		push	word_47544
		push	word_47542
		mov	ax, 7
		push	ax
		call	sub_15363
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		mov	ax, 9
		push	ax
		push	cs
		call	near ptr sub_22536
		add	sp, 0Ah
		mov	byte_47492, 0
		sub	ax, ax
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_120D1

loc_21D89:				; CODE XREF: sub_21D3C+10j
		mov	sp, bp
		pop	bp
		retn
sub_21D3C	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	word_47544
		push	word_47542
		call	sub_14B6B
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_21DA8	proc near		; CODE XREF: sub_210F9+1DAp
					; sub_21616+303p

var_2		= word ptr -2
arg_0		= dword	ptr  4
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	word_4E948, 1

loc_21DB9:				; CODE XREF: sub_21DA8+96j
		mov	word_4DF5E, 0
		mov	ax, [bp+arg_4]
		sub	ax, 13h
		mov	[bp+var_2], ax
		mov	ax, 6506h
		push	ds
		push	ax		; unsigned int *
		push	[bp+var_2]	; unsigned int
		call	__dos_setdrive
		add	sp, 6
		cmp	word_4DF5E, 0
		jnz	short loc_21E35
		mov	ax, word ptr dword_498F0
		or	ax, word ptr dword_498F0+2
		jz	short loc_21E05
		mov	word_4E948, 0
		mov	ax, 64C0h
		push	ds
		push	ax
		push	[bp+var_2]
		call	dword_498F0
		mov	word_4DF5E, ax
		mov	word_4E948, 1
		jmp	short loc_21E13
; ---------------------------------------------------------------------------

loc_21E05:				; CODE XREF: sub_21DA8+3Ej
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		mov	ax, 40h	; '@'
		push	ax		; int
		call	sub_1A694

loc_21E13:				; CODE XREF: sub_21DA8+5Bj
		call	sub_22FD4
		cmp	word_4DF5E, 0
		jnz	short loc_21E35
		mov	ax, 64C0h
		push	ds
		push	ax		; char *
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; __int32
		sub	ax, ax
		push	ax		; int
		call	sub_229A9
		cmp	word_4DF5E, 0
		jz	short loc_21E41

loc_21E35:				; CODE XREF: sub_21DA8+35j
					; sub_21DA8+73j
		mov	ax, word_47548
		add	ax, 13h
		mov	[bp+arg_4], ax
		jmp	loc_21DB9
; ---------------------------------------------------------------------------

loc_21E41:				; CODE XREF: sub_21DA8+8Bj
		mov	ax, 6506h
		push	ds
		push	ax		; unsigned int *
		push	word_47548	; unsigned int
		call	__dos_setdrive
		mov	word_4E948, 0
		mov	sp, bp
		pop	bp
		retn	6
sub_21DA8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_21E5B	proc near		; CODE XREF: sub_210F9+4F2p
					; sub_21616+6FBp

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, word ptr dword_47536
		or	ax, word ptr dword_47536+2
		jz	short loc_21E83
		push	word ptr dword_47536+2
		push	word ptr dword_47536
		call	sub_1AEAD
		sub	ax, ax
		mov	word ptr dword_47536+2,	ax
		mov	word ptr dword_47536, ax

loc_21E83:				; CODE XREF: sub_21E5B+11j
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_14A8E
		mov	word_490A0, 0
		pop	bp
		retn	4
sub_21E5B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_21E98	proc near		; CODE XREF: sub_210F9+1E5p
					; sub_21616+30Ep ...

var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Ah
		push	ax
		call	sub_15601
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Ah
		push	ax
		call	sub_15C06
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Ch
		push	ax
		call	sub_15363
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		push	dx
		push	ax
		call	sub_1B047
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		mov	ax, es:[bx+0Ch]
		les	bx, [bp+var_4]
		les	bx, es:[bx]
		sub	ax, es:[bx+8]
		dec	ax
		dec	ax
		sub	dx, dx
		div	word_4759A
		mov	word_474F2, ax
		mov	word_474F0, ax
		mov	ax, word_4758E
		cmp	word_474F2, ax
		jbe	short loc_21F0B
		mov	word_474F2, ax

loc_21F0B:				; CODE XREF: sub_21E98+6Ej
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		call	sub_1B063
		sub	ax, ax
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Ch
		push	ax
		call	sub_15BD2
		sub	ax, ax
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Ch
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_11C58
		sub	ax, ax
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Bh
		push	ax
		call	sub_15BD2
		push	word_4758E
		push	word_474F2
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Bh
		push	ax
		call	sub_15363
		push	dx
		push	ax
		call	sub_12007
		mov	sp, bp
		pop	bp
		retn	4
sub_21E98	endp

; ---------------------------------------------------------------------------

loc_21F77:				; DATA XREF: dseg:1568o dseg:1676o
		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+0Ch]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp+6]
		or	ax, ax
		jz	short loc_21FE8
		cmp	ax, 2
		jnz	short loc_21FA3
		jmp	loc_22240
; ---------------------------------------------------------------------------

loc_21FA3:				; CODE XREF: seg001:204Ej
		cmp	ax, 9
		jz	short loc_21FAB
		jmp	loc_2223B
; ---------------------------------------------------------------------------

loc_21FAB:				; CODE XREF: seg001:2056j
		les	bx, [bp-4]
		cmp	byte ptr es:[bx+11h], 0
		jz	short loc_21FE0
		mov	al, es:[bx+11h]
		sub	ah, ah
		add	ax, [bp+0Ah]
		sub	ax, [bp+8]
		mov	[bp-0Ch], ax
		cmp	ax, 20h	; ' '
		jl	short loc_21FD4
		mov	ax, word_474F2
		add	ax, 20h	; ' '
		cmp	[bp-0Ch], ax
		jb	short loc_21FD9

loc_21FD4:				; CODE XREF: seg001:2077j
		mov	word ptr [bp-0Ch], 0

loc_21FD9:				; CODE XREF: seg001:2082j
		mov	al, [bp-0Ch]
		mov	es:[bx+11h], al

loc_21FE0:				; CODE XREF: seg001:2063j
		sub	ax, ax
		mov	[bp+0Ah], ax
		mov	[bp+8],	ax

loc_21FE8:				; CODE XREF: seg001:2049j
		les	bx, [bp-4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		lea	ax, [bp-18h]
		push	ss
		push	ax
		lea	ax, [bp-16h]
		push	ss
		push	ax
		call	sub_1333C
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		push	word ptr [bp-18h]
		push	word ptr [bp-16h]
		nop
		push	cs
		call	near ptr sub_208AA
		les	bx, [bp-4]
		mov	ax, es:[bx+12h]
		add	ax, [bp+8]
		sub	ax, 20h	; ' '
		mov	[bp-0Ch], ax
		mov	ax, [bp+8]
		or	ax, [bp+0Ah]
		jz	short loc_22043
		cmp	word ptr [bp+8], 0FFh
		jz	short loc_2203A
		jmp	loc_22178
; ---------------------------------------------------------------------------

loc_2203A:				; CODE XREF: seg001:20E5j
		cmp	word ptr [bp+0Ah], 0
		jz	short loc_22043
		jmp	loc_22178
; ---------------------------------------------------------------------------

loc_22043:				; CODE XREF: seg001:20DEj seg001:20EEj
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20ADE
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233FE
		les	bx, [bp-4]
		mov	ax, es:[bx+8]
		add	ax, word_474E8
		inc	ax
		mov	[bp-0Ah], ax
		mov	ax, es:[bx+8]
		inc	ax
		mov	[bp-14h], ax
		add	ax, word_4759A
		mov	[bp-10h], ax
		mov	ax, es:[bx+0Ah]
		inc	ax
		inc	ax
		mov	[bp-12h], ax
		mov	ax, es:[bx+0Eh]
		dec	ax
		dec	ax
		mov	[bp-0Eh], ax
		mov	ax, es:[bx+12h]
		mov	[bp-0Ch], ax
		jmp	short loc_220D4
; ---------------------------------------------------------------------------

loc_2209E:				; CODE XREF: seg001:21DBj seg001:21E4j
		mov	ax, [bp-0Ch]
		les	bx, [bp-4]
		sub	ax, es:[bx+12h]
		mov	cl, es:[bx+11h]
		sub	ch, ch
		sub	cx, 20h	; ' '
		cmp	ax, cx
		jnz	short loc_220BF
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_205C8

loc_220BF:				; CODE XREF: seg001:2163j seg001:21F1j
		mov	ax, word_4759A
		add	[bp-0Ah], ax
		mov	ax, [bp-10h]
		mov	[bp-14h], ax
		mov	ax, word_4759A
		add	[bp-10h], ax
		inc	word ptr [bp-0Ch]

loc_220D4:				; CODE XREF: seg001:214Cj
		les	bx, [bp-4]
		mov	ax, es:[bx+12h]
		add	ax, word_474F2
		cmp	ax, [bp-0Ch]
		jbe	short loc_22163
		mov	ax, [bp-12h]
		add	ax, 4
		push	ax
		push	word ptr [bp-0Ah]
		nop
		push	cs
		call	near ptr sub_20892
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		mov	ax, [bp-12h]
		add	ax, 4
		push	ax
		push	word ptr [bp-0Ah]
		nop
		push	cs
		call	near ptr sub_20892
		push	word ptr [bp-0Ch]
		call	sub_222AE
		mov	ax, 0Fh
		imul	word ptr [bp-0Ch]
		mov	bx, ax
		les	si, dword_4753A
		test	byte ptr es:[bx+si], 80h
		jnz	short loc_22137
		cmp	word ptr [bp+8], 0FFh
		jz	short loc_2212E
		jmp	loc_2209E
; ---------------------------------------------------------------------------

loc_2212E:				; CODE XREF: seg001:21D9j
		cmp	word ptr [bp+0Ah], 0
		jz	short loc_22137
		jmp	loc_2209E
; ---------------------------------------------------------------------------

loc_22137:				; CODE XREF: seg001:21D2j seg001:21E2j
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_23427
		jmp	loc_220BF
; ---------------------------------------------------------------------------

loc_22144:				; CODE XREF: seg001:loc_22176j
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		mov	ax, word_4759A
		add	[bp-0Ah], ax
		mov	ax, [bp-10h]
		mov	[bp-14h], ax
		mov	ax, word_4759A
		add	[bp-10h], ax
		inc	word ptr [bp-0Ch]

loc_22163:				; CODE XREF: seg001:2192j
		les	bx, [bp-4]
		mov	ax, es:[bx+12h]
		add	ax, word_474F0
		cmp	ax, [bp-0Ch]
		ja	short loc_22176
		jmp	loc_2221F
; ---------------------------------------------------------------------------

loc_22176:				; CODE XREF: seg001:2221j
		jmp	short loc_22144
; ---------------------------------------------------------------------------

loc_22178:				; CODE XREF: seg001:20E7j seg001:20F0j
		mov	ax, word_4758E
		cmp	[bp-0Ch], ax
		jb	short loc_22183
		jmp	loc_2221F
; ---------------------------------------------------------------------------

loc_22183:				; CODE XREF: seg001:222Ej
		mov	ax, 0Fh
		imul	word ptr [bp-0Ch]
		mov	bx, ax
		les	si, dword_4753A
		test	byte ptr es:[bx+si], 80h
		jz	short loc_22198
		jmp	loc_2221F
; ---------------------------------------------------------------------------

loc_22198:				; CODE XREF: seg001:2243j
		mov	ax, [bp-0Ch]
		les	bx, [bp-4]
		sub	ax, es:[bx+12h]
		mul	word_4759A
		add	ax, es:[bx+8]
		inc	ax
		mov	[bp-14h], ax
		add	ax, word_4759A
		mov	[bp-10h], ax
		mov	ax, es:[bx+0Ah]
		inc	ax
		inc	ax
		mov	[bp-12h], ax
		mov	ax, es:[bx+0Eh]
		dec	ax
		dec	ax
		mov	[bp-0Eh], ax
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		mov	ax, [bp-12h]
		add	ax, 4
		push	ax
		mov	ax, [bp-14h]
		add	ax, word_474E8
		push	ax
		nop
		push	cs
		call	near ptr sub_20892
		push	word ptr [bp-0Ch]
		call	sub_222AE
		mov	ax, 0Fh
		imul	word ptr [bp-0Ch]
		mov	bx, ax
		les	si, dword_4753A
		test	byte ptr es:[bx+si], 80h
		jz	short loc_22209
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_23427
		jmp	short loc_2221F
; ---------------------------------------------------------------------------

loc_22209:				; CODE XREF: seg001:22ABj
		les	bx, [bp-4]
		mov	al, es:[bx+11h]
		cmp	[bp+8],	al
		jnz	short loc_2221F
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_205C8

loc_2221F:				; CODE XREF: seg001:2223j seg001:2230j ...
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp-18h]
		neg	ax
		push	ax
		mov	ax, [bp-16h]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA

loc_2223B:				; CODE XREF: seg001:2058j seg001:2313j ...
		sub	ax, ax
		cwd
		jmp	short loc_222A8
; ---------------------------------------------------------------------------

loc_22240:				; CODE XREF: seg001:2050j
		mov	ax, [bp+0Ah]
		mov	[bp-6],	ax
		mov	ax, [bp+8]
		mov	[bp-8],	ax
		lea	ax, [bp-8]
		push	ss
		push	ax
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_20A1B
		or	ax, ax
		jz	short loc_2223B
		mov	ax, [bp-8]
		les	bx, [bp-4]
		sub	ax, es:[bx+8]
		sub	dx, dx
		div	word_4759A
		add	ax, es:[bx+12h]
		mov	[bp-0Ch], ax
		mov	ax, word_4758E
		cmp	[bp-0Ch], ax
		jnb	short loc_2223B
		mov	si, [bp-0Ch]
		sub	si, es:[bx+12h]
		cmp	word_474F2, si
		jbe	short loc_2223B
		mov	ax, 0Fh
		imul	word ptr [bp-0Ch]
		mov	bx, ax
		les	di, dword_4753A
		test	byte ptr es:[bx+di], 80h
		jnz	short loc_2223B
		lea	ax, [si+20h]
		sub	dx, dx

loc_222A8:				; CODE XREF: seg001:22EEj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_222AE	proc near		; CODE XREF: seg001:21BFp seg001:2298p

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 1Ch
		call	__chkstk
		push	di
		push	si
		mov	ax, 0Fh
		mul	[bp+arg_0]
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		mov	word ptr [bp+var_14], ax
		mov	word ptr [bp+var_14+2],	dx
		les	bx, [bp+var_14]
		test	byte ptr es:[bx], 40h
		jz	short loc_2233B
		mov	cx, dx
		inc	bx
		mov	word ptr [bp+var_18], bx
		mov	word ptr [bp+var_18+2],	cx
		lea	si, [bp+var_10]
		les	di, [bp+var_18]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	bx, ax
		mov	word ptr [bp+var_1C], bx
		mov	word ptr [bp+var_1C+2],	dx
		mov	di, 17ADh
		mov	ax, ds
		push	ds
		lds	si, [bp+var_1C]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		jmp	short loc_22375
; ---------------------------------------------------------------------------

loc_2233B:				; CODE XREF: sub_222AE+28j
		mov	ax, 0Fh
		mul	[bp+arg_0]
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		inc	ax
		mov	bx, ax
		mov	word ptr [bp+var_1C], bx
		mov	word ptr [bp+var_1C+2],	dx
		lea	si, [bp+var_10]
		les	di, [bp+var_1C]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx

loc_22375:				; CODE XREF: sub_222AE+8Bj
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		lea	di, [bp+var_10]
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		nop
		push	cs
		call	near ptr sub_2017A
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	2
sub_222AE	endp

; ---------------------------------------------------------------------------

loc_22399:				; DATA XREF: dseg:1538o dseg:1646o
		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, [bp+6]
		sub	ax, 1
		cmp	ax, 7
		jbe	short loc_223B2
		jmp	loc_22479
; ---------------------------------------------------------------------------

loc_223B2:				; CODE XREF: seg001:245Dj
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_22469[bx]
; ---------------------------------------------------------------------------

loc_223BA:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:off_22469o
		mov	ax, word_474F2

loc_223BD:				; CODE XREF: seg001:2476j
		mov	[bp-2],	ax
		jmp	loc_22479
; ---------------------------------------------------------------------------

loc_223C3:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:251Bo
		mov	ax, word_4758E
		jmp	short loc_223BD
; ---------------------------------------------------------------------------

loc_223C8:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:251Do
		mov	word ptr [bp-2], 0
		jmp	loc_22479
; ---------------------------------------------------------------------------

loc_223D0:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:251Fo
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		dec	ax

loc_223DF:				; CODE XREF: seg001:24EFj
		mov	[bp-2],	ax
		or	ax, ax
		jge	short loc_223EB
		mov	word ptr [bp-2], 0

loc_223EB:				; CODE XREF: seg001:2494j seg001:24CBj ...
		push	word ptr [bp-2]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		mov	ax, 0Ch
		push	ax
		call	sub_15BD2
		jmp	short loc_22479
; ---------------------------------------------------------------------------

loc_223FF:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:2521o
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		inc	ax

loc_2240E:				; CODE XREF: seg001:2507j seg001:2517j
		mov	[bp-2],	ax
		mov	ax, word_4758E
		sub	ax, word_474F2
		cmp	ax, [bp-2]
		jnb	short loc_223EB
		mov	ax, word_4758E
		sub	ax, word_474F2
		mov	[bp-2],	ax
		jmp	short loc_223EB
; ---------------------------------------------------------------------------

loc_22429:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:2523o
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		mov	cx, word_474F2
		shr	cx, 1
		sub	ax, cx
		jmp	short loc_223DF
; ---------------------------------------------------------------------------

loc_22441:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:2525o
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		mov	cx, word_474F2
		shr	cx, 1
		add	ax, cx
		jmp	short loc_2240E
; ---------------------------------------------------------------------------

loc_22459:				; CODE XREF: seg001:2465j
					; DATA XREF: seg001:2527o
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		jmp	short loc_2240E
; ---------------------------------------------------------------------------
off_22469	dw offset loc_223BA	; DATA XREF: seg001:2465r
		dw offset loc_223C3
		dw offset loc_223C8
		dw offset loc_223D0
		dw offset loc_223FF
		dw offset loc_22429
		dw offset loc_22441
		dw offset loc_22459
; ---------------------------------------------------------------------------

loc_22479:				; CODE XREF: seg001:245Fj seg001:2470j ...
		mov	ax, [bp-2]
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_22480:				; DATA XREF: dseg:16CAo
		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		lea	ax, [bp-0Ch]
		push	ss
		push	ax
		lea	ax, [bp-0Ah]
		push	ss
		push	ax
		call	sub_1333C
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		call	sub_15363
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		or	dx, ax
		jz	short loc_22532
		push	word ptr [bp-6]
		push	ax
		call	sub_1B047
		les	bx, [bp-8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		add	ax, 8
		push	dx
		push	ax
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Ah]
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233FE
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp-0Ch]
		neg	ax
		push	ax
		mov	ax, [bp-0Ah]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		call	sub_1B063

loc_22532:				; CODE XREF: seg001:2566j
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_22536	proc far		; CODE XREF: sub_21D3C+34p
					; sub_22536+86p
					; DATA XREF: ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		push	di
		les	bx, [bp+arg_6]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+var_4]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		lea	ax, [bp+var_C]
		push	ss
		push	ax
		call	sub_1333C
		les	bx, [bp+var_4]
		mov	ax, es:[bx+8]
		add	ax, [bp+var_C]
		mov	word_47590, ax
		mov	ax, es:[bx+0Ch]
		add	ax, [bp+var_C]
		mov	word_47592, ax
		mov	ax, es:[bx+0Ah]
		add	ax, [bp+var_E]
		inc	ax
		inc	ax
		mov	word_4754C, ax
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	short loc_225A2
		cmp	ax, 2
		jz	short loc_225C8
		cmp	ax, 9
		jz	short loc_225F4
		jmp	short loc_225C2
; ---------------------------------------------------------------------------

loc_225A2:				; CODE XREF: sub_22536+5Ej
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jnz	short loc_225C2
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		sub	ax, ax
		push	ax
		push	word ptr es:[bx+12h]
		mov	ax, 9
		push	ax
		push	cs
		call	near ptr sub_22536
		add	sp, 0Ah

loc_225C2:				; CODE XREF: sub_22536+6Aj
					; sub_22536+72j ...
		sub	ax, ax
		cwd
		jmp	loc_2275E
; ---------------------------------------------------------------------------

loc_225C8:				; CODE XREF: sub_22536+63j
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Ah]
		les	bx, es:[bx+1Ch]
		mov	dx, ax
		mov	di, bx
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	ax, cx
		mov	cl, 3
		shl	ax, cl
		add	dx, ax
		add	dx, [bp+var_E]
		inc	dx
		inc	dx
		mov	word_4754C, dx
		jmp	short loc_225C2
; ---------------------------------------------------------------------------

loc_225F4:				; CODE XREF: sub_22536+68j
		les	bx, [bp+var_4]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_225C2
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		nop
		push	cs
		call	near ptr sub_208AA
		cmp	word_47594, 1
		jnz	short loc_22639
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_22763
		mov	word_47594, 0

loc_22639:				; CODE XREF: sub_22536+EDj
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20ADE
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jnz	short loc_2266E
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Ah]
		inc	ax
		inc	ax
		mov	word_4754C, ax
		mov	word_47594, 0
		jmp	loc_22710
; ---------------------------------------------------------------------------

loc_2266E:				; CODE XREF: sub_22536+111j
		mov	ax, [bp+var_A]
		cmp	[bp+var_8], ax
		jnb	short loc_226AA
		mov	ax, [bp+var_8]
		mov	cl, 3
		shl	ax, cl
		mov	[bp+var_6], ax
		les	bx, [bp+var_4]
		add	es:[bx+0Ah], ax
		mov	ax, [bp+var_6]
		add	word_4754C, ax
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		les	bx, [bp+var_4]
		mov	ax, [bp+var_6]
		sub	es:[bx+0Ah], ax
		jmp	short loc_22710
; ---------------------------------------------------------------------------

loc_226AA:				; CODE XREF: sub_22536+13Ej
		mov	ax, [bp+var_A]
		cmp	[bp+var_8], ax
		jbe	short loc_22710
		call	sub_14D1E
		mov	ax, 6508h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20483
		mov	ax, [bp+var_A]
		mov	cl, 3
		shl	ax, cl
		mov	[bp+var_6], ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20B78
		les	bx, [bp+var_4]
		mov	ax, es:[bx+0Ah]
		add	ax, [bp+var_6]
		push	ax
		mov	ax, es:[bx+8]
		add	ax, word_474E8
		push	ax
		mov	ax, es:[bx+1Ch]
		mov	dx, es:[bx+1Eh]
		add	ax, [bp+var_A]
		push	dx
		push	ax
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_A]
		push	ax
		nop
		push	cs
		call	near ptr sub_23537
		mov	ax, [bp+var_8]
		mov	cl, 3
		shl	ax, cl
		add	word_4754C, ax
		call	sub_14C44

loc_22710:				; CODE XREF: sub_22536+135j
					; sub_22536+172j ...
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+11h], 0FFh
		jnz	short loc_2272A
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_23427
		jmp	short loc_2273F
; ---------------------------------------------------------------------------

loc_2272A:				; CODE XREF: sub_22536+1E2j
		cmp	word_47594, 2
		jnz	short loc_2273F
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 8
		push	dx
		push	ax
		call	sub_22763

loc_2273F:				; CODE XREF: sub_22536+1F2j
					; sub_22536+1F9j
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp+var_E]
		neg	ax
		push	ax
		mov	ax, [bp+var_C]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		jmp	loc_225C2
; ---------------------------------------------------------------------------

loc_2275E:				; CODE XREF: sub_22536+8Fj
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_22536	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_22763	proc near		; CODE XREF: sub_22536+FAp
					; sub_22536+206p

arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		sub	word ptr es:[bx+6], 2
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_205C8
		les	bx, [bp+arg_0]
		add	word ptr es:[bx+6], 2
		pop	bp
		retn	4
sub_22763	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	si
		push	word_4754C
		push	word_47590
		push	word_47592
		call	sub_14C5A
		les	bx, [bp+0Ah]
		mov	si, es:[bx]
		cmp	si, 3
		jz	short loc_227B9
		cmp	si, 5
		jnz	short loc_227F0

loc_227B9:				; CODE XREF: seg001:2862j
		mov	al, es:[bx+2]
		sub	ah, ah
		mov	[bp-2],	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, 7
		push	ax
		call	sub_154F5
		mov	[bp-4],	ax
		cmp	word ptr [bp-2], 61h ; 'a'
		jl	short loc_227E4
		cmp	word ptr [bp-2], 7Ah ; 'z'
		jg	short loc_227E4
		add	word ptr [bp-2], 0FFE0h

loc_227E4:				; CODE XREF: seg001:2888j seg001:288Ej
		cmp	word ptr [bp-2], 0Dh
		jnz	short loc_227F5
		cmp	word ptr [bp-4], 0
		jle	short loc_227F5

loc_227F0:				; CODE XREF: seg001:2867j seg001:28A9j ...
		sub	ax, ax
		jmp	loc_228DB
; ---------------------------------------------------------------------------

loc_227F5:				; CODE XREF: seg001:2898j seg001:289Ej
		cmp	word ptr [bp-2], 1Bh
		jz	short loc_227F0
		cmp	word ptr [bp-2], 8
		jz	short loc_22807
		cmp	word ptr [bp-2], 7Fh ; ''
		jnz	short loc_22844

loc_22807:				; CODE XREF: seg001:28AFj
		cmp	word ptr [bp-4], 0
		jle	short loc_22844
		cmp	word_47594, 2
		jnz	short loc_2281A
		mov	word_47594, 1

loc_2281A:				; CODE XREF: seg001:28C2j
		mov	bx, [bp-4]
		mov	byte ptr [bx+64B1h], 0
		mov	ax, [bp-4]
		dec	ax

loc_22826:				; CODE XREF: seg001:295Aj
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, 7
		push	ax
		call	sub_15BD2
		les	bx, [bp+0Eh]
		mov	word ptr es:[bx], 0
		mov	ax, 1
		jmp	loc_228DB
; ---------------------------------------------------------------------------

loc_22844:				; CODE XREF: seg001:28B5j seg001:28BBj
		cmp	word ptr [bp-2], 41h ; 'A'
		jl	short loc_22850
		cmp	word ptr [bp-2], 5Ah ; 'Z'
		jle	short loc_22870

loc_22850:				; CODE XREF: seg001:28F8j
		cmp	word ptr [bp-2], 30h ; '0'
		jl	short loc_2285C
		cmp	word ptr [bp-2], 39h ; '9'
		jle	short loc_22870

loc_2285C:				; CODE XREF: seg001:2904j
		push	word ptr [bp-2]
		mov	ax, 17AFh
		push	ds
		push	ax
		call	_strchr
		add	sp, 6
		or	dx, ax
		jz	short loc_228AD

loc_22870:				; CODE XREF: seg001:28FEj seg001:290Aj
		mov	ax, word_47598
		cmp	[bp-4],	ax
		jb	short loc_2287F
		cmp	word_47594, 2
		jnz	short loc_228AD

loc_2287F:				; CODE XREF: seg001:2926j
		cmp	word_47594, 2
		jnz	short loc_22894
		call	sub_21D3C
		mov	word ptr [bp-4], 0
		mov	word_47594, 0

loc_22894:				; CODE XREF: seg001:2934j
		mov	bx, [bp-4]
		mov	al, [bp-2]
		mov	[bx+64B2h], al
		mov	bx, [bp-4]
		mov	byte ptr [bx+64B3h], 0
		mov	ax, [bp-4]
		inc	ax
		jmp	loc_22826
; ---------------------------------------------------------------------------

loc_228AD:				; CODE XREF: seg001:291Ej seg001:292Dj
		dec	word_46CA0
		js	short loc_228C7
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	loc_227F0
; ---------------------------------------------------------------------------

loc_228C7:				; CODE XREF: seg001:2961j
		mov	ax, 5CBCh
		push	ds
		push	ax
		mov	ax, 7
		push	ax
		call	__flsbuf
		add	sp, 6
		jmp	loc_227F0
; ---------------------------------------------------------------------------

loc_228DB:				; CODE XREF: seg001:28A2j seg001:28F1j
		pop	si
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+6]
		assume es:nothing
		test	byte ptr es:[bx], 40h
		jz	short loc_22903
		cmp	byte ptr es:[bx+1], 2Eh	; '.'
		jnz	short loc_228FE
		sub	ax, ax
		jmp	short loc_22906
; ---------------------------------------------------------------------------

loc_228FE:				; CODE XREF: seg001:29A8j
		mov	ax, 2
		jmp	short loc_22906
; ---------------------------------------------------------------------------

loc_22903:				; CODE XREF: seg001:29A1j
		mov	ax, 1

loc_22906:				; CODE XREF: seg001:29ACj seg001:29B1j
		pop	bp
		retf	4

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2290A	proc far		; CODE XREF: sub_197B5+11P
					; sub_210F9+48p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		push	si
		mov	di, 656Eh
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		push	ds
		lds	si, [bp+arg_0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		pop	si
		pop	di
		pop	bp
		retf	4
sub_2290A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_22943	proc far		; CODE XREF: sub_19782+2AP
					; sub_210F9+3D8p ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	di
		push	si
		mov	si, 656Eh
		les	di, [bp+arg_0]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	ax, 656Eh
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], ds
		jmp	short loc_22985
; ---------------------------------------------------------------------------

loc_2297E:				; CODE XREF: sub_22943+5Cj
		les	bx, [bp+var_4]
		assume es:nothing
		mov	byte ptr es:[bx], 5Ch ;	'\'

loc_22985:				; CODE XREF: sub_22943+39j
		mov	ax, 2Fh	; '/'
		push	ax		; int
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; char *
		call	_strchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jnz	short loc_2297E
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	4
sub_22943	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_229A9(int, __int32,	char *)
sub_229A9	proc near		; CODE XREF: sub_210F9+5Cp
					; sub_210F9+2FDp ...

var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= _find_t ptr -30h
var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 36h	; '6'
		call	__chkstk
		push	di
		push	si
		mov	word_4758E, 0
		mov	ax, word ptr dword_47536
		or	ax, word ptr dword_47536+2
		jnz	short loc_229F7
		mov	ax, 2EEh
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_47536, ax
		mov	word ptr dword_47536+2,	dx
		mov	word_47490, 32h	; '2'
		les	bx, dword_47536
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr dword_4753A, ax
		mov	word ptr dword_4753A+2,	dx

loc_229F7:				; CODE XREF: sub_229A9+1Aj
		les	di, [bp+arg_6]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		add	cx, word ptr [bp+arg_6]
		mov	ax, es
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ax
		mov	ax, word ptr [bp+arg_6]
		mov	dx, es
		cmp	cx, ax
		jnz	short loc_22A1D
		cmp	word ptr [bp+var_4+2], dx
		jz	short loc_22A2F

loc_22A1D:				; CODE XREF: sub_229A9+6Dj
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx-1], 5Ch	; '\'
		jnz	short loc_22A2F
		mov	cx, 4
		mov	si, 17BFh
		jmp	short loc_22A35
; ---------------------------------------------------------------------------

loc_22A2F:				; CODE XREF: sub_229A9+72j
					; sub_229A9+7Cj
		mov	cx, 5
		mov	si, 17C3h

loc_22A35:				; CODE XREF: sub_229A9+84j
		les	di, [bp+var_4]
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	word_4E948, 1
		lea	ax, [bp+var_30]
		push	ss
		push	ax		; struct _find_t *
		mov	ax, 11h
		push	ax		; unsigned int
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6] ; char *
		call	__dos_findfirst
		add	sp, 0Ah
		mov	[bp+var_32], ax
		mov	word_4E948, 0
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0
		cmp	[bp+var_32], 0
		jz	short loc_22A76
		jmp	loc_22BD8
; ---------------------------------------------------------------------------

loc_22A76:				; CODE XREF: sub_229A9+C8j
					; sub_229A9+1DFj
		mov	word_4E948, 0
		mov	ax, word_47490
		cmp	word_4758E, ax
		jb	short loc_22AD7
		push	word ptr dword_47536+2
		push	word ptr dword_47536
		call	sub_1B063
		mov	ax, 0Fh
		mul	word_47490
		add	ax, 2EEh
		push	ax
		push	word ptr dword_47536+2
		push	word ptr dword_47536
		call	sub_1B551
		mov	ax, 3
		push	ax
		call	sub_102F7
		push	word ptr dword_47536+2
		push	word ptr dword_47536
		call	sub_1B047
		les	bx, dword_47536
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr dword_4753A, ax
		mov	word ptr dword_4753A+2,	dx
		add	word_47490, 32h	; '2'

loc_22AD7:				; CODE XREF: sub_229A9+DAj
		mov	ax, 0Fh
		mul	word_4758E
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		inc	ax
		mov	bx, ax
		mov	word ptr [bp+var_36], bx
		mov	word ptr [bp+var_36+2],	dx
		lea	di, [bp+var_30.name]
		mov	ax, ss
		mov	es, ax
		push	ds
		lds	si, [bp+var_36]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		test	[bp+var_30.attrib], 10h
		jz	short loc_22B1E
		mov	al, 40h	; '@'
		jmp	short loc_22B20
; ---------------------------------------------------------------------------

loc_22B1E:				; CODE XREF: sub_229A9+16Fj
		sub	al, al

loc_22B20:				; CODE XREF: sub_229A9+173j
		mov	cx, ax
		mov	ax, 0Fh
		mul	word_4758E
		mov	bx, ax
		mov	si, word ptr dword_4753A
		mov	es:[bx+si], cl
		mov	ax, word ptr [bp+arg_2]
		or	ax, word ptr [bp+arg_2+2]
		jz	short loc_22B6D
		mov	ax, 0Fh
		mul	word_4758E
		add	ax, word ptr dword_4753A
		mov	dx, word ptr dword_4753A+2
		push	dx
		push	ax
		call	[bp+arg_2]
		or	ax, ax
		jz	short loc_22B9E
		cmp	ax, 1
		jz	short loc_22B8B
		cmp	ax, 2
		jnz	short loc_22B6D
		mov	ax, 0Fh
		mul	word_4758E
		mov	bx, ax
		les	si, dword_4753A
		and	byte ptr es:[bx+si], 7Fh

loc_22B6D:				; CODE XREF: sub_229A9+18Fj
					; sub_229A9+1B1j ...
		inc	word_4758E
		mov	word_4E948, 1
		lea	ax, [bp+var_30]
		push	ss
		push	ax		; struct _find_t *
		call	far ptr	__dos_findnext
		add	sp, 4
		or	ax, ax
		jnz	short loc_22BA4
		jmp	loc_22A76
; ---------------------------------------------------------------------------

loc_22B8B:				; CODE XREF: sub_229A9+1ACj
		mov	ax, 0Fh
		mul	word_4758E
		mov	bx, ax
		les	si, dword_4753A
		or	byte ptr es:[bx+si], 80h
		jmp	short loc_22B6D
; ---------------------------------------------------------------------------

loc_22B9E:				; CODE XREF: sub_229A9+1A7j
		dec	word_4758E
		jmp	short loc_22B6D
; ---------------------------------------------------------------------------

loc_22BA4:				; CODE XREF: sub_229A9+1DDj
		mov	word_4E948, 0
		cmp	[bp+arg_0], 0
		jz	short loc_22BB8
		mov	ax, 2C90h
		mov	dx, seg	seg001
		jmp	short loc_22BBE
; ---------------------------------------------------------------------------

loc_22BB8:				; CODE XREF: sub_229A9+205j
		mov	ax, 2CF8h
		mov	dx, seg	seg001

loc_22BBE:				; CODE XREF: sub_229A9+20Dj
		push	dx
		push	ax		; int (__cdecl *)(const	void *,	const void *)
		mov	ax, 0Fh
		push	ax		; size_t
		push	word_4758E	; size_t
		push	word ptr dword_4753A+2
		push	word ptr dword_4753A ; void *
		call	_qsort
		add	sp, 0Ch

loc_22BD8:				; CODE XREF: sub_229A9+CAj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_229A9	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+6]
		mov	al, es:[bx]
		sub	ah, ah
		and	ax, 40h
		les	bx, [bp+0Ah]
		mov	cl, es:[bx]
		sub	ch, ch
		and	cx, 40h
		sub	ax, cx
		mov	[bp-2],	ax
		or	ax, ax
		jz	short loc_22C10
		neg	ax
		jmp	short loc_22C42
; ---------------------------------------------------------------------------

loc_22C10:				; CODE XREF: seg001:2CBAj
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		inc	ax
		mov	cx, es
		inc	bx
		mov	[bp-6],	ax
		mov	[bp-4],	dx
		mov	[bp-0Ah], bx
		mov	[bp-8],	cx
		les	di, [bp-0Ah]
		push	ds
		lds	si, [bp-6]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		repe cmpsb
		jz	short loc_22C41
		sbb	ax, ax
		sbb	ax, 0FFFFh

loc_22C41:				; CODE XREF: seg001:2CEAj
		pop	ds

loc_22C42:				; CODE XREF: seg001:2CBEj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		push	si
		les	bx, [bp+6]
		mov	al, es:[bx]
		sub	ah, ah
		and	ax, 40h
		les	bx, [bp+0Ah]
		mov	cl, es:[bx]
		sub	ch, ch
		and	cx, 40h
		sub	ax, cx
		mov	[bp-2],	ax
		or	ax, ax
		jnz	short loc_22CA6
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		inc	ax
		mov	cx, es
		inc	bx
		mov	[bp-6],	ax
		mov	[bp-4],	dx
		mov	[bp-0Ah], bx
		mov	[bp-8],	cx
		les	di, [bp-0Ah]
		push	ds
		lds	si, [bp-6]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		repe cmpsb
		jz	short loc_22CA5
		sbb	ax, ax
		sbb	ax, 0FFFFh

loc_22CA5:				; CODE XREF: seg001:2D4Ej
		pop	ds

loc_22CA6:				; CODE XREF: seg001:2D22j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_22CAC	proc near		; CODE XREF: sub_21616+384p

var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= byte ptr -40h
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 52h	; 'R'
		call	__chkstk
		push	di
		push	si
		lea	si, [bp+var_40]
		les	di, [bp+arg_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		lea	di, [bp+var_40]
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	si, cx
		lea	bx, [bp+si+var_44+3]
		mov	word ptr [bp+var_44], bx
		mov	word ptr [bp-42h], ss
		cmp	byte ptr [bx], 5Ch ; '\'
		jz	short loc_22D15
		inc	word ptr [bp+var_44]
		les	ax, [bp+var_44]
		mov	cx, 2
		mov	di, ax
		mov	si, 17C8h
		mov	dx, es
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_22D15:				; CODE XREF: sub_22CAC+4Fj
		inc	word ptr [bp+var_44]
		mov	bx, word ptr [bp+var_44]
		mov	cx, word ptr [bp+var_44+2]
		mov	word ptr [bp+var_4A], bx
		mov	word ptr [bp+var_4A+2],	cx
		les	di, [bp+arg_4]
		push	ds
		lds	si, [bp+var_4A]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word ptr [bp+var_4E], si
		mov	word ptr [bp+var_4E+2],	cx
		mov	word ptr [bp+var_52], bx
		mov	word ptr [bp+var_52+2],	dx
		les	di, [bp+var_4E]
		assume es:nothing
		push	ds
		lds	si, [bp+var_52]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	word_4E948, 1
		sub	ax, ax
		push	ax		; int
		lea	ax, [bp+var_40]
		push	ss
		push	ax		; char *
		call	far ptr	_access
		add	sp, 6
		cmp	ax, 1
		sbb	cx, cx
		neg	cx
		mov	[bp+var_46], cx
		mov	word_4E948, 0
		mov	ax, cx
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	0Ch
sub_22CAC	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 4Ch	; 'L'
		call	__chkstk
		push	di
		push	si
		lea	si, [bp-40h]
		les	di, [bp+8]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	bx, ax
		mov	[bp-44h], bx
		mov	[bp-42h], dx
		mov	di, 17CAh
		mov	ax, ds
		push	ds
		lds	si, [bp-44h]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	bx, ax
		mov	si, [bp+4]
		mov	cx, [bp+6]
		mov	[bp-48h], si
		mov	[bp-46h], cx
		mov	[bp-4Ch], bx
		mov	[bp-4Ah], dx
		les	di, [bp-48h]
		assume es:nothing
		push	ds
		lds	si, [bp-4Ch]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		lea	ax, [bp-40h]
		push	ss
		push	ax
		call	far ptr	_mkdir
		add	sp, 4
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_22E75(char *)
sub_22E75	proc far		; CODE XREF: sub_198ED+89P
					; sub_19BE4+44P ...

var_28		= stat ptr -28h
var_A		= _diskfree_t ptr -0Ah
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 28h	; '('
		call	__chkstk
		push	di
		push	si
		mov	word_4E948, 1
		lea	ax, [bp+var_28]
		push	ss
		push	ax		; struct stat *
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_stat
		add	sp, 8
		mov	[bp+var_2], ax
		mov	word_4E948, 0
		or	ax, ax
		jz	short loc_22F04
		les	bx, [bp+arg_0]
		assume es:nothing
		mov	cx, 2
		mov	di, 17CCh
		lea	si, [bx+1]
		push	ds
		push	ds
		push	es
		pop	ds
		pop	es
		shr	cx, 1
		sbb	ax, ax
		cmp	cx, cx
		repe cmpsw
		jnz	short loc_22EC7
		sub	cx, ax
		repe cmpsb

loc_22EC7:				; CODE XREF: sub_22E75+4Cj
		pop	ds
		jz	short loc_22ECE

loc_22ECA:				; CODE XREF: sub_22E75+82j
					; sub_22E75:loc_22EFDj
		sub	ax, ax
		jmp	short loc_22F11
; ---------------------------------------------------------------------------

loc_22ECE:				; CODE XREF: sub_22E75+53j
		mov	word_4E948, 1
		lea	ax, [bp+var_A]
		push	ss
		push	ax		; struct _diskfree_t *
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		cbw
		sub	ax, 40h	; '@'
		push	ax		; unsigned int
		call	__dos_getdiskfree
		add	sp, 6
		mov	[bp+var_2], ax
		mov	word_4E948, 0
		or	ax, ax
		jnz	short loc_22ECA
		cmp	byte ptr [bp+var_A.sectors_per_cluster], 0FFh

loc_22EFD:				; CODE XREF: sub_22E75+9Aj
		jz	short loc_22ECA
		mov	ax, 1
		jmp	short loc_22F11
; ---------------------------------------------------------------------------

loc_22F04:				; CODE XREF: sub_22E75+31j
		mov	word_4E948, 0
		test	[bp+var_28.st_mode], 4000h
		jmp	short loc_22EFD
; ---------------------------------------------------------------------------

loc_22F11:				; CODE XREF: sub_22E75+57j
					; sub_22E75+8Dj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	4
sub_22E75	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_22F19	proc near		; CODE XREF: sub_21616+398p

var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= byte ptr -40h
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4Ch	; 'L'
		call	__chkstk
		push	di
		push	si
		lea	si, [bp+var_40]
		les	di, [bp+arg_4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	bx, ax
		mov	word ptr [bp+var_44], bx
		mov	word ptr [bp+var_44+2],	dx
		mov	di, 17CEh
		mov	ax, ds
		push	ds
		lds	si, [bp+var_44]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	bx, ax
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	word ptr [bp+var_48], si
		mov	word ptr [bp+var_48+2],	cx
		mov	word ptr [bp+var_4C], bx
		mov	word ptr [bp+var_4C+2],	dx
		les	di, [bp+var_48]
		assume es:nothing
		push	ds
		lds	si, [bp+var_4C]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		lea	ax, [bp+var_40]
		push	ss
		push	ax		; char *
		push	cs
		call	near ptr sub_22E75
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_22F19	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_22FD4	proc near		; CODE XREF: sub_210F9+4Bp
					; sub_210F9:loc_213E5p	...

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		push	si
		mov	di, 64C0h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx+64BFh], 5Ch ; '\'
		jz	short loc_23022
		mov	di, 17D0h
		mov	si, 64C0h
		mov	ax, ds
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_23022:				; CODE XREF: sub_22FD4+25j
		mov	ax, 64C0h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20114
		cmp	ax, 0FAh ; '�'
		jg	short loc_23034
		jmp	loc_230C1
; ---------------------------------------------------------------------------

loc_23034:				; CODE XREF: sub_22FD4+5Bj
		mov	ax, 17D2h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20114
		sub	ax, 0FAh ; '�'
		neg	ax
		mov	[bp+var_6], ax
		mov	ax, 64C1h
		mov	[bp+var_4], ax
		mov	[bp+var_2], ds
		jmp	short loc_23054
; ---------------------------------------------------------------------------

loc_23051:				; CODE XREF: sub_22FD4+8Ej
		inc	[bp+var_4]

loc_23054:				; CODE XREF: sub_22FD4+7Bj
		push	[bp+var_2]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_20114
		cmp	ax, [bp+var_6]
		jg	short loc_23051
		mov	di, 17D2h
		mov	si, 6514h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	ax, di
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	bx, ax
		mov	si, [bp+var_4]
		mov	cx, [bp+var_2]
		mov	word ptr [bp+var_A], si
		mov	word ptr [bp+var_A+2], cx
		mov	si, bx
		les	di, [bp+var_A]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		jmp	short loc_230E0
; ---------------------------------------------------------------------------

loc_230C1:				; CODE XREF: sub_22FD4+5Dj
		mov	di, 64C0h
		mov	si, 6514h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_230E0:				; CODE XREF: sub_22FD4+EBj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn
sub_22FD4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_230E6	proc far		; CODE XREF: sub_2607A+E2p
					; sub_2607A+14Ap

var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		les	bx, [bp+arg_4]
		assume es:nothing
		mov	ax, es:[bx]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		les	bx, [bp+arg_4]
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_2]
		mov	es:[bx], ax
		mov	sp, bp
		pop	bp
		retf	8
sub_230E6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23115	proc far		; CODE XREF: sub_231D1+92p
					; sub_2B7A7+EDp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		test	byte ptr [bx+5E27h], 2
		jz	short loc_23139
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx]
		sub	al, 20h	; ' '
		jmp	short loc_2313F
; ---------------------------------------------------------------------------

loc_23139:				; CODE XREF: sub_23115+18j
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx]

loc_2313F:				; CODE XREF: sub_23115+22j
		mov	es:[bx], al
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1], 0
		jz	short loc_2315B
		mov	ax, bx
		mov	dx, es
		inc	ax
		push	dx
		push	ax		; char *
		call	_strlwr
		add	sp, 4

loc_2315B:				; CODE XREF: sub_23115+35j
		pop	bp
		retf	4
sub_23115	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_2315F(char *,	char *)
sub_2315F	proc far		; CODE XREF: sub_1EF9A+96P
					; sub_2B0C0+B1p ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, 5Ch	; '\'
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	dx, ax
		jnz	short loc_23192
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx

loc_23192:				; CODE XREF: sub_2315F+25j
		mov	ax, 5Ch	; '\'
		push	ax		; int
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jnz	short loc_231BA
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_231BA:				; CODE XREF: sub_2315F+4Dj
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; char *
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8] ; char *
		call	_stricmp
		mov	sp, bp
		pop	bp
		retf	8
sub_2315F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_231D1(char *,	char *)
sub_231D1	proc far		; CODE XREF: sub_21616+60p
					; sub_23A5F+E3p ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, 2Fh	; '/'
		push	ax		; int
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 5Ch	; '\'
		push	ax		; int
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_strrchr
		add	sp, 6
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		mov	ax, word ptr [bp+var_4]
		mov	dx, word ptr [bp+var_4+2]
		cmp	[bp+var_8], ax
		jbe	short loc_23223
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_23223:				; CODE XREF: sub_231D1+44j
		mov	ax, word ptr [bp+var_4]
		or	ax, word ptr [bp+var_4+2]
		jz	short loc_23230
		inc	word ptr [bp+var_4]
		jmp	short loc_2323C
; ---------------------------------------------------------------------------

loc_23230:				; CODE XREF: sub_231D1+58j
		mov	ax, word ptr [bp+arg_0]
		mov	dx, word ptr [bp+arg_0+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx

loc_2323C:				; CODE XREF: sub_231D1+5Dj
		mov	ax, 0Dh
		push	ax		; size_t
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4] ; char *
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	_strncpy
		add	sp, 0Ah
		les	bx, [bp+arg_4]
		mov	byte ptr es:[bx+0Ch], 0
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4]
		push	cs
		call	near ptr sub_23115
		mov	sp, bp
		pop	bp
		retf	8
sub_231D1	endp


; =============== S U B	R O U T	I N E =======================================


sub_2326C	proc far		; CODE XREF: sub_23F23+16Bp
		xor	ax, ax
		call	__chkstk
		mov	word_4759E, 0
		mov	word_4759C, 0
		nop
		push	cs
		call	near ptr sub_20501
		retf
sub_2326C	endp


; =============== S U B	R O U T	I N E =======================================


sub_23285	proc far		; CODE XREF: sub_10167+7EP
					; sub_1071A+23P ...
		xor	ax, ax
		call	__chkstk
		mov	word_4759C, 0
		cmp	word_4759E, 0
		jl	short locret_2329E
		nop
		push	cs
		call	near ptr sub_20501

locret_2329E:				; CODE XREF: sub_23285+12j
		retf
sub_23285	endp


; =============== S U B	R O U T	I N E =======================================


sub_2329F	proc far		; CODE XREF: _main+128P sub_10167+BP ...
		xor	ax, ax
		call	__chkstk
		mov	word_4759C, 1
		nop
		push	cs
		call	near ptr sub_20BAD
		retf
sub_2329F	endp


; =============== S U B	R O U T	I N E =======================================


sub_232B2	proc far		; CODE XREF: sub_11334:loc_1153FP
					; sub_11334+21EP ...
		xor	ax, ax
		call	__chkstk
		inc	word_4759E
		jnz	short locret_232D2
		cmp	word_4759C, 0
		jnz	short loc_232CD
		nop
		push	cs
		call	near ptr sub_20501
		jmp	short locret_232D2
; ---------------------------------------------------------------------------

loc_232CD:				; CODE XREF: sub_232B2+12j
		nop
		push	cs
		call	near ptr sub_2711B

locret_232D2:				; CODE XREF: sub_232B2+Bj
					; sub_232B2+19j
		retf
sub_232B2	endp


; =============== S U B	R O U T	I N E =======================================


sub_232D3	proc far		; CODE XREF: sub_11334:loc_113CDP
					; sub_11334+ACP ...
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4759E
		dec	word_4759E
		or	ax, ax
		jnz	short locret_232EA
		nop
		push	cs
		call	near ptr sub_271BD

locret_232EA:				; CODE XREF: sub_232D3+10j
		retf
sub_232D3	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_232EB	proc far		; CODE XREF: sub_2D005+140p
					; sub_2D005+1D1p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		mov	ax, word_427B6
		cmp	[bp+arg_0], ax
		jz	short loc_2330D
		mov	ax, 0A0h ; '�'
		mul	[bp+arg_0]
		mov	word_427B8, ax
		mov	ax, [bp+arg_0]
		mov	word_427B6, ax

loc_2330D:				; CODE XREF: sub_232EB+11j
		test	byte ptr [bp+arg_2], 1
		jz	short loc_2332A
		mov	bx, [bp+arg_2]
		shr	bx, 1
		add	bx, word_427B8
		les	si, dword_42AD2
		mov	al, es:[bx+si]
		sub	ah, ah
		and	ax, 0Fh
		jmp	short loc_23340
; ---------------------------------------------------------------------------

loc_2332A:				; CODE XREF: sub_232EB+26j
		mov	bx, [bp+arg_2]
		shr	bx, 1
		add	bx, word_427B8
		les	si, dword_42AD2
		mov	al, es:[bx+si]
		sub	ah, ah
		mov	cl, 4
		shr	ax, cl

loc_23340:				; CODE XREF: sub_232EB+3Dj
		pop	si
		pop	bp
		retf	4
sub_232EB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23345	proc far		; CODE XREF: sub_185CA+13EP
					; sub_18844+159P ...

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	[bp+arg_6]	; int
		call	_tell
		add	sp, 2
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		or	dx, dx
		jge	short loc_2336B

loc_23365:				; CODE XREF: sub_23345+41j
					; sub_23345+55j ...
		mov	ax, 0FFFFh
		cwd
		jmp	short loc_233CE
; ---------------------------------------------------------------------------

loc_2336B:				; CODE XREF: sub_23345+1Ej
		mov	ax, 2
		push	ax		; int
		sub	ax, ax
		push	ax
		push	ax		; __int32
		push	[bp+arg_6]	; int
		call	far ptr	_lseek
		add	sp, 8
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, dx
		jl	short loc_23365
		cmp	word ptr [bp+arg_2+2], dx
		jl	short loc_2339C
		jg	short loc_23394
		cmp	word ptr [bp+arg_2], ax
		jb	short loc_2339C

loc_23394:				; CODE XREF: sub_23345+48j
		mov	word_4664F, 16h
		jmp	short loc_23365
; ---------------------------------------------------------------------------

loc_2339C:				; CODE XREF: sub_23345+46j
					; sub_23345+4Dj
		sub	ax, ax
		push	ax		; int
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8] ; __int32
		push	[bp+arg_6]	; int
		call	far ptr	_lseek
		add	sp, 8
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		or	dx, dx
		jl	short loc_23365
		push	[bp+arg_0]	; int
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2] ; __int32
		push	[bp+arg_6]	; int
		call	far ptr	_lseek
		add	sp, 8

loc_233CE:				; CODE XREF: sub_23345+24j
		mov	sp, bp
		pop	bp
		retf	8
sub_23345	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_233D4	proc far		; CODE XREF: sub_116EF+4DP
					; sub_11A4F+49P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20ADE
		mov	ax, 0Fh
		push	ax
		nop
		push	cs
		call	near ptr sub_20B78
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_208DF
		pop	bp
		retf	4
sub_233D4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_233FE	proc far		; CODE XREF: sub_116EF+2D1P
					; sub_12CA2+3FP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20ADE
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20B78
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_201CE
		pop	bp
		retf	4
sub_233FE	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23427	proc far		; CODE XREF: sub_116EF+166P
					; sub_16068+B7P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_20ADE
		nop
		push	cs
		call	near ptr sub_20AF6
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_208DF
		pop	bp
		retf	4
sub_23427	endp


; =============== S U B	R O U T	I N E =======================================


sub_2344E	proc far		; CODE XREF: sub_27987+39p
					; sub_27C5E+2Ep ...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_2329F
		push	cs
		call	near ptr sub_232B2
		retf
sub_2344E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2345E	proc far		; CODE XREF: sub_18844+47DP
					; sub_18844:loc_18CC8P	...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_23285
		push	cs
		call	near ptr sub_232B2
		retf
sub_2345E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2346E	proc far		; CODE XREF: sub_1F7D3+2AP
					; sub_2863E+46p ...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_2345E
		push	cs
		call	near ptr sub_232B2
		retf
sub_2346E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2347E	proc far		; CODE XREF: sub_2348E+Cp
					; sub_287CF+9Bp ...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_232D3
		push	cs
		call	near ptr sub_2329F
		retf
sub_2347E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2348E	proc far		; CODE XREF: sub_1F7D3+44P
					; sub_2863E+50p ...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_232D3
		push	cs
		call	near ptr sub_2347E
		retf
sub_2348E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2349E	proc far		; CODE XREF: sub_18D10+5AP
					; sub_18DDC:loc_18FE1P	...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_232B2
		push	cs
		call	near ptr sub_232B2
		retf
sub_2349E	endp


; =============== S U B	R O U T	I N E =======================================


sub_234AE	proc far		; CODE XREF: sub_18D10:loc_18D7AP
					; sub_18DDC+16P ...
		xor	ax, ax
		call	__chkstk
		push	cs
		call	near ptr sub_232D3
		push	cs
		call	near ptr sub_232D3
		retf
sub_234AE	endp


; =============== S U B	R O U T	I N E =======================================


sub_234BE	proc far		; CODE XREF: sub_140EB+2BP
					; sub_23A5F+Fp	...
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20AC6
		mov	ax, 4
		push	ax
		nop
		push	cs
		call	near ptr sub_20B95
		retf
sub_234BE	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_234D7	proc far		; CODE XREF: sub_12BA7+43P
					; sub_12BA7+5EP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_6]
		push	[bp+arg_4]
		nop
		push	cs
		call	near ptr sub_20892
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_20735
		pop	bp
		retf	8
sub_234D7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_234FB	proc far		; CODE XREF: sub_1EBF1+52P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_0]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_234D7
		pop	bp
		retf	6
sub_234FB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23519	proc far		; CODE XREF: sub_175B6+3BP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_4]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_234D7
		pop	bp
		retf	6
sub_23519	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23537	proc far		; CODE XREF: sub_133D5+26P
					; sub_14DB0+490P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_8]
		push	[bp+arg_6]
		nop
		push	cs
		call	near ptr sub_20892
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_2017A
		pop	bp
		retf	0Ah
sub_23537	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2355E	proc far		; CODE XREF: sub_23F23+E9p

var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	[bp+var_2], 7D00h
		mov	ax, 40h	; '@'
		mov	dx, seg	seg006
		push	dx
		push	ax
		mov	ax, 2959h
		push	ax
		lea	ax, [bp+arg_0]
		push	ss
		push	ax
		lea	ax, [bp+var_2]
		push	ss
		push	ax
		call	sub_1EF26
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_235A1
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jnz	short loc_235A1
		mov	ax, 0
		mov	dx, seg	seg006
		jmp	short loc_235A7
; ---------------------------------------------------------------------------

loc_235A1:				; CODE XREF: sub_2355E+31j
					; sub_2355E+39j
		mov	ax, 20h	; ' '
		mov	dx, seg	seg006

loc_235A7:				; CODE XREF: sub_2355E+41j
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_20A92
		mov	ax, 40h	; '@'
		mov	dx, seg	seg006
		push	dx
		push	ax
		mov	ax, 2996h
		cwd
		push	dx
		push	ax
		call	sub_1A9B3
		mov	ax, 360Eh
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1C51D
		mov	sp, bp
		pop	bp
		retf	4
sub_2355E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_235D4	proc far		; CODE XREF: sub_236EB+16p

var_2		= word ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	[bp+var_2], 7D00h
		mov	ax, 40h	; '@'
		mov	dx, seg	seg007
		push	dx
		push	ax
		mov	ax, 1A9Eh
		push	ax
		lea	ax, [bp+arg_0]
		push	ss
		push	ax
		lea	ax, [bp+var_2]
		push	ss
		push	ax
		call	sub_1EF26
		cmp	word ptr dword_4DF9C, 1BDBh
		jnz	short loc_23617
		cmp	word ptr dword_4DF9C+2,	seg seg002
		jnz	short loc_23617
		mov	ax, 20h	; ' '
		mov	dx, seg	seg007
		jmp	short loc_2361D
; ---------------------------------------------------------------------------

loc_23617:				; CODE XREF: sub_235D4+31j
					; sub_235D4+39j
		mov	ax, 0
		mov	dx, seg	seg007

loc_2361D:				; CODE XREF: sub_235D4+41j
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_20A92
		mov	sp, bp
		pop	bp
		retf	4
sub_235D4	endp


; =============== S U B	R O U T	I N E =======================================


sub_2362A	proc far		; CODE XREF: _main+123P
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_23285

loc_23636:				; CODE XREF: sub_2362A+3Ej
					; sub_2362A+43j ...
		push	word ptr dword_42AD2+2
		push	word ptr dword_42AD2
		call	sub_1A6F0
		nop
		push	cs
		call	near ptr sub_232D3
		mov	ax, 1B06h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_29DCE
		nop
		push	cs
		call	near ptr sub_232B2
		mov	ax, 5
		push	ax
		mov	ax, 17DAh
		push	ax
		call	sub_23875
		sub	ax, 0FFFCh
		cmp	ax, 8
		ja	short loc_23636
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_2368E[bx]
; ---------------------------------------------------------------------------
		jmp	short locret_236A2
; ---------------------------------------------------------------------------

loc_23674:				; CODE XREF: sub_2362A+43j
					; DATA XREF: sub_2362A+68o ...
		call	sub_236A3
		jmp	short loc_23687
; ---------------------------------------------------------------------------

loc_23679:				; CODE XREF: sub_2362A+43j
					; DATA XREF: sub_2362A+66o ...
		call	sub_236C5
		jmp	short loc_23687
; ---------------------------------------------------------------------------

loc_2367E:				; CODE XREF: sub_2362A+43j
					; DATA XREF: sub_2362A:off_2368Eo ...
		mov	ax, 1
		push	ax
		call	sub_10167

loc_23687:				; CODE XREF: sub_2362A+4Dj
					; sub_2362A+52j
		nop
		push	cs
		call	near ptr sub_2708A
		jmp	short loc_23636
; ---------------------------------------------------------------------------
off_2368E	dw offset loc_2367E	; DATA XREF: sub_2362A+43r
		dw offset loc_23679
		dw offset loc_23674
		dw offset loc_23636
		dw offset locret_236A2
		dw offset loc_23636
		dw offset loc_23674
		dw offset loc_23679
		dw offset loc_2367E
		dw offset loc_2943A+1
; ---------------------------------------------------------------------------

locret_236A2:				; CODE XREF: sub_2362A+43j
					; sub_2362A+48j
					; DATA XREF: ...
		retf
sub_2362A	endp


; =============== S U B	R O U T	I N E =======================================


sub_236A3	proc near		; CODE XREF: sub_2362A:loc_23674p
		xor	ax, ax
		call	__chkstk
		mov	ax, 7414h
		push	ax
		mov	ax, 3766h
		push	ax
		call	sub_236EB
		retn
sub_236A3	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		call	sub_196BF
		sub	ax, ax
		retn

; =============== S U B	R O U T	I N E =======================================


sub_236C5	proc near		; CODE XREF: sub_2362A:loc_23679p
		xor	ax, ax
		call	__chkstk
		mov	ax, 0CBFEh
		push	ax
		mov	ax, 3788h
		push	ax
		call	sub_236EB
		retn
sub_236C5	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		call	sub_10167
		mov	ax, 1
		retn

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_236EB	proc near		; CODE XREF: sub_236A3+Fp sub_236C5+Fp

var_16		= word ptr -16h
var_14		= byte ptr -14h
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 16h
		call	__chkstk
		push	si

loc_236F7:				; CODE XREF: sub_236EB+52j
					; sub_236EB+113j
		push	word ptr dword_42AD2+2
		push	word ptr dword_42AD2
		nop
		push	cs
		call	near ptr sub_235D4
		nop
		push	cs
		call	near ptr sub_232D3
		mov	ax, 1B06h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_29DCE
		mov	ax, 6
		push	ax
		mov	ax, 1812h
		push	ax
		push	ds
		push	[bp+arg_2]
		call	sub_23A5F
		nop
		push	cs
		call	near ptr sub_232B2
		lea	ax, [bp+var_14]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_236F7
		mov	ax, 8
		push	ax
		mov	ax, 1802h
		push	ax
		call	sub_23875
		mov	[bp+var_2], ax
		cmp	ax, 0FFFFh
		jz	short loc_2378C
		or	ax, ax
		jz	short loc_23785
		cmp	ax, 1
		jz	short loc_2378C
		or	ax, ax
		jl	short loc_23771
		mov	ax, 93h	; '�'
		imul	[bp+var_2]
		mov	si, ax
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+si-126h], 0
		jnz	short loc_237D8

loc_23771:				; CODE XREF: sub_236EB+72j
		mov	ax, [bp+var_2]
		cwd
		xor	ax, dx
		sub	ax, dx
		dec	ax
		dec	ax
		push	ax
		push	ds
		push	[bp+arg_2]
		call	sub_23B75
		jmp	short loc_237F4
; ---------------------------------------------------------------------------

loc_23785:				; CODE XREF: sub_236EB+69j
					; sub_236EB+107j
		call	sub_1B0CF
		jmp	short loc_23801
; ---------------------------------------------------------------------------

loc_2378C:				; CODE XREF: sub_236EB+65j
					; sub_236EB+6Ej
		cmp	[bp+var_2], 0
		jge	short loc_23797
		mov	ax, 1
		jmp	short loc_23799
; ---------------------------------------------------------------------------

loc_23797:				; CODE XREF: sub_236EB+A5j
		sub	ax, ax

loc_23799:				; CODE XREF: sub_236EB+AAj
		mov	[bp+var_16], ax
		mov	[bp+var_2], 0

loc_237A1:				; CODE XREF: sub_236EB+EBj
		cmp	[bp+var_2], 6
		jl	short loc_237B2
		cmp	[bp+var_16], 0
		jz	short loc_237F4
		mov	[bp+var_2], 0

loc_237B2:				; CODE XREF: sub_236EB+BAj
		mov	ax, 93h	; '�'
		imul	[bp+var_2]
		mov	bx, ax
		mov	si, [bp+arg_2]
		cmp	byte ptr [bx+si], 0
		jz	short loc_237D3
		mov	ax, 93h	; '�'
		imul	[bp+var_2]
		add	ax, si
		push	ds
		push	ax		; char *
		call	sub_23808
		or	ax, ax
		jnz	short loc_237F4

loc_237D3:				; CODE XREF: sub_236EB+D5j
		inc	[bp+var_2]
		jmp	short loc_237A1
; ---------------------------------------------------------------------------

loc_237D8:				; CODE XREF: sub_236EB+84j
		mov	ax, 93h	; '�'
		imul	[bp+var_2]
		add	ax, [bp+arg_2]
		sub	ax, 126h
		push	ds
		push	ax		; char *
		call	sub_23808
		or	ax, ax
		jl	short loc_237F4
		call	[bp+arg_0]
		or	ax, ax
		jnz	short loc_23785

loc_237F4:				; CODE XREF: sub_236EB+98j
					; sub_236EB+C0j ...
		nop
		push	cs
		call	near ptr sub_2708A
		call	sub_1B0CF
		jmp	loc_236F7
; ---------------------------------------------------------------------------

loc_23801:				; CODE XREF: sub_236EB+9Fj
		pop	si
		mov	sp, bp
		pop	bp
		retn	4
sub_236EB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	sub_23808(char *)
sub_23808	proc near		; CODE XREF: sub_236EB+E1p
					; sub_236EB+FBp

var_2		= word ptr -2
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_2329F
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		sub	ax, ax
		push	ax		; int
		call	sub_19181
		or	ax, ax
		jz	short loc_23834
		nop
		push	cs
		call	near ptr sub_23285
		mov	ax, 0FFFFh
		jmp	short loc_2386F
; ---------------------------------------------------------------------------

loc_23834:				; CODE XREF: sub_23808+20j
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		mov	ax, 6
		push	ax		; int
		call	sub_185CA
		or	ax, ax
		jnz	short loc_23862
		sub	ax, ax
		push	ax
		mov	ax, 8FF1h
		mov	dx, seg	seg000
		push	dx
		push	ax
		mov	ax, 5
		push	ax
		call	sub_18DDC
		neg	ax
		mov	[bp+var_2], ax
		jmp	short loc_23867
; ---------------------------------------------------------------------------

loc_23862:				; CODE XREF: sub_23808+3Dj
		mov	[bp+var_2], 0FFFFh

loc_23867:				; CODE XREF: sub_23808+58j
		nop
		push	cs
		call	near ptr sub_23285
		mov	ax, [bp+var_2]

loc_2386F:				; CODE XREF: sub_23808+2Aj
		mov	sp, bp
		pop	bp
		retn	4
sub_23808	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23875	proc near		; CODE XREF: sub_2362A+35p
					; sub_236EB+5Cp

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 18h
		call	__chkstk
		mov	bx, [bp+arg_0]
		mov	ax, [bx+2]
		add	ax, [bx+6]
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bx+4]
		add	ax, [bx]
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_E], ax
		mov	ax, [bx+6]
		sub	ax, [bx+2]
		add	ax, [bx+4]
		sub	ax, [bx]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cx, 2
		sar	ax, cl
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_2], ax
		imul	ax
		mov	[bp+var_2], ax
		mov	ax, [bx+0Ah]
		add	ax, [bx+0Eh]
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_C], ax
		mov	ax, [bx+8]
		add	ax, [bx+0Ch]
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_10], ax
		mov	ax, [bx+0Eh]
		sub	ax, [bx+0Ah]
		add	ax, [bx+0Ch]
		sub	ax, [bx+8]
		cwd
		xor	ax, dx
		sub	ax, dx
		sar	ax, cl
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_4], ax
		imul	ax
		mov	[bp+var_4], ax
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_26D6D
		mov	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		nop
		push	cs
		call	near ptr sub_2708A

loc_23911:				; CODE XREF: sub_23875+1C5j
					; sub_23875+1D0j
		mov	ax, 0FFFFh
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_26E7B
		mov	[bp+var_8], 0
		jmp	short loc_23929
; ---------------------------------------------------------------------------

loc_23926:				; CODE XREF: sub_23875+D4j
		inc	[bp+var_8]

loc_23929:				; CODE XREF: sub_23875+AFj
		mov	ax, [bp+arg_2]
		cmp	[bp+var_8], ax
		jge	short loc_2394B
		mov	ax, 80AEh
		push	ds
		push	ax
		mov	ax, [bp+var_8]
		mov	cl, 3
		shl	ax, cl
		add	ax, [bp+arg_0]
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20A1B
		or	ax, ax
		jz	short loc_23926

loc_2394B:				; CODE XREF: sub_23875+BAj
		cmp	[bp+var_8], 0
		jnz	short loc_23979
		mov	ax, word_4908E
		sub	ax, [bp+var_E]
		mov	[bp+var_12], ax
		mov	ax, word_49090
		sub	ax, [bp+var_A]
		mov	[bp+var_14], ax
		imul	ax
		mov	cx, ax
		mov	ax, [bp+var_12]
		imul	ax
		add	cx, ax
		cmp	cx, [bp+var_2]
		jle	short loc_23979
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax

loc_23979:				; CODE XREF: sub_23875+DAj
					; sub_23875+FCj
		cmp	[bp+var_8], 1
		jnz	short loc_239A7
		mov	ax, word_4908E
		sub	ax, [bp+var_10]
		mov	[bp+var_16], ax
		mov	ax, word_49090
		sub	ax, [bp+var_C]
		mov	[bp+var_18], ax
		imul	ax
		mov	cx, ax
		mov	ax, [bp+var_16]
		imul	ax
		add	cx, ax
		cmp	cx, [bp+var_4]
		jle	short loc_239A7
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax

loc_239A7:				; CODE XREF: sub_23875+108j
					; sub_23875+12Aj
		mov	ax, [bp+var_6]
		cmp	[bp+var_8], ax
		jnz	short loc_239B2
		jmp	loc_23A33
; ---------------------------------------------------------------------------

loc_239B2:				; CODE XREF: sub_23875+138j
		cmp	ax, 1
		jle	short loc_239D2
		mov	ax, [bp+arg_2]
		cmp	[bp+var_6], ax
		jge	short loc_239D2
		mov	ax, [bp+var_6]
		mov	cl, 3
		shl	ax, cl
		add	ax, [bp+arg_0]
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_205C8
		jmp	short loc_239EF
; ---------------------------------------------------------------------------

loc_239D2:				; CODE XREF: sub_23875+140j
					; sub_23875+148j
		cmp	[bp+var_6], 0
		jl	short loc_239EF
		cmp	[bp+var_6], 1
		jg	short loc_239EF
		mov	ax, [bp+var_6]
		mov	cl, 3
		shl	ax, cl
		add	ax, [bp+arg_0]
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20548

loc_239EF:				; CODE XREF: sub_23875+15Bj
					; sub_23875+161j ...
		cmp	[bp+var_8], 1
		jle	short loc_23A10
		mov	ax, [bp+arg_2]
		cmp	[bp+var_8], ax
		jge	short loc_23A10
		mov	ax, [bp+var_8]
		mov	cl, 3
		shl	ax, cl
		add	ax, [bp+arg_0]
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_205C8
		jmp	short loc_23A2D
; ---------------------------------------------------------------------------

loc_23A10:				; CODE XREF: sub_23875+17Ej
					; sub_23875+186j
		cmp	[bp+var_8], 0
		jl	short loc_23A2D
		cmp	[bp+var_8], 1
		jg	short loc_23A2D
		mov	ax, [bp+var_8]
		mov	cl, 3
		shl	ax, cl
		add	ax, [bp+arg_0]
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20548

loc_23A2D:				; CODE XREF: sub_23875+199j
					; sub_23875+19Fj ...
		mov	ax, [bp+var_8]
		mov	[bp+var_6], ax

loc_23A33:				; CODE XREF: sub_23875+13Aj
		cmp	word_49084, 1
		jz	short loc_23A3D
		jmp	loc_23911
; ---------------------------------------------------------------------------

loc_23A3D:				; CODE XREF: sub_23875+1C3j
		mov	ax, [bp+arg_2]
		cmp	[bp+var_8], ax
		jl	short loc_23A48
		jmp	loc_23911
; ---------------------------------------------------------------------------

loc_23A48:				; CODE XREF: sub_23875+1CEj
		test	byte ptr word_49092, 80h
		jz	short loc_23A56
		mov	ax, [bp+var_8]
		neg	ax
		jmp	short loc_23A59
; ---------------------------------------------------------------------------

loc_23A56:				; CODE XREF: sub_23875+1D8j
		mov	ax, [bp+var_8]

loc_23A59:				; CODE XREF: sub_23875+1DFj
		mov	sp, bp
		pop	bp
		retn	4
sub_23875	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23A5F	proc near		; CODE XREF: sub_236EB+34p

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  4
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 22h	; '"'
		call	__chkstk
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_234BE
		mov	[bp+var_6], 0
		jmp	loc_23B13
; ---------------------------------------------------------------------------

loc_23A79:				; CODE XREF: sub_23A5F+CDj
		mov	cx, 0Fh
		lea	di, [bp+var_1C]
		mov	si, 1859h
		mov	ax, ss
		mov	es, ax
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb

loc_23A8E:				; CODE XREF: sub_23A5F+101j
					; sub_23A5F+10Bj
		mov	ax, [bp+var_6]
		mov	cl, 3
		shl	ax, cl
		add	ax, [bp+arg_4]
		mov	[bp+var_22], ax
		mov	bx, ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		nop
		push	cs
		call	near ptr sub_20892
		jmp	short loc_23AC0
; ---------------------------------------------------------------------------

loc_23AA9:				; CODE XREF: sub_23A5F+89j
		lea	di, [bp+var_1C]
		mov	ax, ss
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	si, cx
		mov	[bp+si+var_1D],	0

loc_23AC0:				; CODE XREF: sub_23A5F+48j
		lea	ax, [bp+var_1C]
		push	ss
		push	ax
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_200D2
		mov	bx, [bp+var_22]
		mov	ax, [bx+6]
		sub	ax, [bx+2]
		sub	ax, [bp+var_8]
		add	ax, [bp+var_C]
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp-1Eh], ax
		or	ax, ax
		jl	short loc_23AA9
		mov	ax, [bx+4]
		sub	ax, [bx]
		sub	ax, [bp+var_A]
		add	ax, [bp+var_E]
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_20], ax
		push	word ptr [bp-1Eh]
		push	ax
		nop
		push	cs
		call	near ptr sub_20870
		lea	ax, [bp+var_1C]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_20152
		inc	[bp+var_6]

loc_23B13:				; CODE XREF: sub_23A5F+17j
		mov	ax, [bp+arg_6]
		cmp	[bp+var_6], ax
		jge	short loc_23B6D
		mov	ax, 93h	; '�'
		imul	[bp+var_6]
		mov	bx, ax
		les	si, [bp+arg_0]
		cmp	byte ptr es:[bx+si], 0
		jnz	short loc_23B2F
		jmp	loc_23A79
; ---------------------------------------------------------------------------

loc_23B2F:				; CODE XREF: sub_23A5F+CBj
		lea	ax, [bp+var_1C]
		push	ss
		push	ax		; char *
		mov	ax, 93h	; '�'
		imul	[bp+var_6]
		add	ax, si
		mov	dx, es
		push	dx
		push	ax		; char *
		nop
		push	cs
		call	near ptr sub_231D1
		mov	ax, 2Eh	; '.'
		push	ax		; int
		lea	ax, [bp+var_1C]
		push	ss
		push	ax		; char *
		call	_strrchr
		add	sp, 6
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		or	dx, ax
		jnz	short loc_23B63
		jmp	loc_23A8E
; ---------------------------------------------------------------------------

loc_23B63:				; CODE XREF: sub_23A5F+FFj
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0
		jmp	loc_23A8E
; ---------------------------------------------------------------------------

loc_23B6D:				; CODE XREF: sub_23A5F+BAj
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	8
sub_23A5F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23B75	proc near		; CODE XREF: sub_236EB+95p

var_AC		= dword	ptr -0ACh
var_A8		= word ptr -0A8h
var_94		= byte ptr -94h
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 0ACh ; '�'
		call	__chkstk
		push	di
		push	si
		mov	ax, 3
		push	ax
		mov	ax, 1B2Eh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_17C2A
		mov	ax, 1842h
		push	ds
		push	ax
		lea	ax, [bp+var_A8]
		push	ss
		push	ax
		call	sub_17C9B
		nop
		push	cs
		call	near ptr sub_232D3
		mov	ax, 1B06h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_29DCE
		nop
		push	cs
		call	near ptr sub_232B2
		cmp	[bp+var_A8], 0
		jz	short loc_23C0A
		mov	ax, 93h	; '�'
		imul	[bp+arg_4]
		add	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	bx, ax
		mov	word ptr [bp+var_AC], bx
		mov	word ptr [bp+var_AC+2],	dx
		lea	di, [bp+var_94]
		mov	ax, ss
		mov	es, ax
		push	ds
		lds	si, [bp+var_AC]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		push	es
		mov	es, dx
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	ax, 3
		push	ax
		call	sub_197B5
		call	sub_1A1F0

loc_23C0A:				; CODE XREF: sub_23B75+48j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	6
sub_23B75	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23C12	proc far		; CODE XREF: sub_14A8E+C6P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_11D4B
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1AEAD
		mov	word_490A0, 0
		pop	bp
		retf	4
sub_23C12	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23C3C	proc far		; CODE XREF: sub_15AF5+11P
					; sub_1632A+26P ...

var_1A		= byte ptr -1Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1Ah
		call	__chkstk
		lea	ax, [bp+var_1A]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_23C62
		jmp	loc_23CEC
; ---------------------------------------------------------------------------

loc_23C62:				; CODE XREF: sub_23C3C+21j
		mov	ax, 0Ch
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		call	sub_1B209
		mov	word ptr [bp+var_8], ax
		mov	word ptr [bp+var_8+2], dx
		call	sub_1B0CF
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		les	bx, [bp+var_4]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		les	bx, [bp+var_4]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		les	bx, [bp+var_4]
		mov	es:[bx+4], ax
		les	bx, [bp+var_4]
		sub	ax, ax
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], ax
		push	word ptr [bp+var_8+2]
		push	word ptr [bp+var_8]
		call	sub_1B063
		mov	word_490A0, 0
		mov	ax, word ptr [bp+var_8]
		mov	dx, word ptr [bp+var_8+2]
		jmp	short loc_23CF5
; ---------------------------------------------------------------------------

loc_23CEC:				; CODE XREF: sub_23C3C+23j
		mov	word_490A0, 0E02h
		sub	ax, ax
		cwd

loc_23CF5:				; CODE XREF: sub_23C3C+AEj
		mov	sp, bp
		pop	bp
		retf	4
sub_23C3C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23CFB	proc far		; CODE XREF: sub_10167+AAP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_26E7B
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx+4]
		mov	es:[bx+10h], ax
		mov	es:[bx+12h], dx
		les	bx, [bp+arg_0]
		test	word ptr es:[bx+16h], 0FFFFh
		jz	short loc_23D46
		sub	ax, ax
		mov	es:[bx+12h], ax
		mov	es:[bx+10h], ax
		mov	word_490A0, 0E03h

loc_23D41:				; CODE XREF: sub_23CFB+73j
					; sub_23CFB+117j
		sub	ax, ax
		jmp	loc_23E2D
; ---------------------------------------------------------------------------

loc_23D46:				; CODE XREF: sub_23CFB+34j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		or	ax, ax
		jz	short loc_23D61
		cmp	ax, 1
		jz	short loc_23DAA
		cmp	ax, 3
		jz	short loc_23D70
		cmp	ax, 5
		jz	short loc_23D70
		jmp	short loc_23D7A
; ---------------------------------------------------------------------------

loc_23D61:				; CODE XREF: sub_23CFB+53j
		sub	ax, ax
		mov	es:[bx+12h], ax
		mov	es:[bx+10h], ax
		mov	word_490A0, ax
		jmp	short loc_23D41
; ---------------------------------------------------------------------------

loc_23D70:				; CODE XREF: sub_23CFB+5Dj
					; sub_23CFB+62j
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+14h], 1
		jnz	short loc_23D89

loc_23D7A:				; CODE XREF: sub_23CFB+64j
					; sub_23CFB+A1j
		mov	word_490A0, 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		jmp	loc_23E2D
; ---------------------------------------------------------------------------

loc_23D89:				; CODE XREF: sub_23CFB+7Dj
		push	es
		push	bx
		sub	ax, ax
		push	ax
		push	ax
		call	sub_1D6D0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+10h], 0
		jz	short loc_23D7A

loc_23D9E:				; CODE XREF: sub_23CFB+EEj
					; sub_23CFB+103j
		mov	word_490A0, 0
		mov	ax, 11h
		jmp	loc_23E2D
; ---------------------------------------------------------------------------

loc_23DAA:				; CODE XREF: sub_23CFB+58j
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+14h], 4
		jnz	short loc_23DBF
		mov	word_490A0, 0
		mov	ax, 1
		jmp	short loc_23E2D
; ---------------------------------------------------------------------------

loc_23DBF:				; CODE XREF: sub_23CFB+B7j
		mov	ax, bx
		mov	dx, es
		add	ax, 0Ah
		push	dx
		push	ax
		call	sub_1D3FF
		mov	bx, ax
		mov	es, dx
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_20A1B
		or	ax, ax
		jz	short loc_23E15
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+14h], 8
		jz	short loc_23D9E
		push	es
		push	bx
		sub	ax, ax
		push	ax
		push	ax
		call	sub_1D879
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+10h], 0
		jnz	short loc_23D9E
		mov	word ptr es:[bx+10h], 11h
		mov	word ptr es:[bx+12h], 0
		mov	word_490A0, 0
		jmp	loc_23D41
; ---------------------------------------------------------------------------

loc_23E15:				; CODE XREF: sub_23CFB+E4j
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx+14h], 80h
		sub	ax, ax
		mov	es:[bx+12h], ax
		mov	es:[bx+10h], ax
		mov	word_490A0, ax
		mov	ax, 13h

loc_23E2D:				; CODE XREF: sub_23CFB+48j
					; sub_23CFB+8Bj ...
		pop	bp
		retf	6
sub_23CFB	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_23E31	proc far		; CODE XREF: sub_1CE23+1DP
					; sub_1CE72+1CP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		cmp	[bp+arg_4], 0
		jz	short loc_23E58
		call	sub_1D3FF
		mov	bx, ax
		mov	es, dx
		les	bx, es:[bx]
		mov	ax, es
		les	si, [bp+arg_0]
		mov	cx, es:[si]
		jmp	short loc_23E6D
; ---------------------------------------------------------------------------

loc_23E58:				; CODE XREF: sub_23E31+Fj
		call	sub_1D3FF
		mov	bx, ax
		mov	es, dx
		les	bx, es:[bx]
		mov	ax, es
		les	si, [bp+arg_0]
		mov	cx, es:[si+4]

loc_23E6D:				; CODE XREF: sub_23E31+25j
		mov	es, ax
		mov	es:[bx+4], cx
		pop	si
		pop	bp
		retf	6
sub_23E31	endp


; =============== S U B	R O U T	I N E =======================================


sub_23E78	proc far		; CODE XREF: sub_23F23+ABp
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_20A79
		sub	ax, ax
		push	ax
		call	sub_102F7
		sub	ax, ax
		push	ax
		mov	ax, 140h
		push	ax
		sub	ax, ax
		push	ax
		mov	ax, 0C8h ; '�'
		push	ax
		nop
		push	cs
		call	near ptr sub_26B42
		cmp	word_490A0, 6FFh
		jnz	short loc_23EB4
		mov	ax, 1878h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		call	sub_1034A
; ---------------------------------------------------------------------------

loc_23EB4:				; CODE XREF: sub_23E78+2Dj
		mov	ax, 9
		push	ax
		call	sub_102F7
		mov	ax, 0Ah
		push	ax
		call	sub_102F7
		mov	ax, 0Bh
		push	ax
		call	sub_102F7
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		call	sub_1CEB6
		mov	ax, 9F16h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1D858
		mov	ax, 0Ch
		push	ax
		call	sub_102F7
		call	sub_149FC
		mov	ax, 9F16h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1544A
		mov	ax, 0Dh
		push	ax
		call	sub_102F7
		nop
		push	cs
		call	near ptr sub_20FB6
		mov	ax, 0Eh
		push	ax
		call	sub_102F7
		mov	ax, 0Fh
		push	ax
		call	sub_102F7
		retf
sub_23E78	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_23F23(char *)
sub_23F23	proc far		; CODE XREF: _main+109P

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1Eh
		call	__chkstk
		push	di
		call	sub_1FBE2
		mov	ax, 0FC11h
		mov	dx, seg	seg000
		push	dx
		push	ax		; void (*)(void)
		call	_atexit
		add	sp, 4
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		nop
		push	cs
		call	near ptr sub_24333
		mov	ax, 415Ah
		mov	dx, seg	seg001
		push	dx
		push	ax		; void (*)(void)
		call	_atexit
		add	sp, 4
		sub	ax, ax
		push	ax
		call	sub_1A746
		or	al, 0F0h
		mov	byte_4DF88, al
		mov	ax, 8
		push	ax
		call	sub_102F7
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_23F9D
		push	seg_42B8A
		push	word_42B88
		sub	ax, ax
		push	ax
		call	sub_1034A
; ---------------------------------------------------------------------------

loc_23F9D:				; CODE XREF: sub_23F23+68j
		mov	ax, 8000h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		call	sub_1B209
		mov	[bp+var_1A], ax
		mov	[bp+var_18], dx
		mov	ax, 2710h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		sub	ax, ax
		push	ax
		call	sub_1B209
		mov	[bp+var_1E], ax
		mov	[bp+var_1C], dx
		push	cs
		call	near ptr sub_23E78
		nop
		push	cs
		call	near ptr sub_240B6
		call	sub_1C53C
		mov	word_4DF96, 0
		mov	cx, 7D00h
		les	di, dword_42AD2
		sub	ax, ax
		repne stosb
		mov	dx, es
		push	dx
		push	word ptr dword_42AD2
		nop
		push	cs
		call	near ptr sub_20A92
		mov	ax, 1B06h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_29DCE
		push	word ptr dword_42AD2+2
		push	word ptr dword_42AD2
		nop
		push	cs
		call	near ptr sub_2355E
		mov	ax, 1B06h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_29DCE
		call	sub_1FBD0
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		call	sub_1FCD6
		nop
		push	cs
		call	near ptr sub_2329F
		call	sub_13524
		call	sub_10712
		call	sub_1632A
		call	sub_1FAA3
		call	sub_1A113
		call	sub_198ED
		push	[bp+var_18]
		push	[bp+var_1A]
		call	sub_1AEAD
		push	[bp+var_1C]
		push	[bp+var_1E]
		call	sub_1AEAD
		call	sub_1B0CF
		sub	ax, ax
		push	ax
		push	ax
		call	sub_18143

loc_24070:				; CODE XREF: sub_23F23+163j
					; sub_23F23+167j
		call	sub_1FBD0
		mov	cx, [bp+var_4]
		mov	bx, [bp+var_2]
		add	cx, 12Ch
		adc	bx, 0
		cmp	bx, dx
		jb	short loc_2408C
		ja	short loc_24070
		cmp	cx, ax
		ja	short loc_24070

loc_2408C:				; CODE XREF: sub_23F23+161j
		nop
		push	cs
		call	near ptr sub_2326C
		nop
		push	cs
		call	near ptr sub_2329F
		mov	ax, 3F28h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1C51D
		pop	di
		mov	sp, bp
		pop	bp
		retf	4
sub_23F23	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		call	dword_490A8
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_240B6	proc far		; CODE XREF: sub_23F23+B0p

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 14h
		call	__chkstk
		mov	ax, 7E40h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr dword_42AC4, ax
		mov	word ptr dword_42AC4+2,	dx
		mov	ax, 7EFEh
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr dword_42AD2, ax
		mov	word ptr dword_42AD2+2,	dx
		mov	ax, 306h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_48796, ax
		mov	word ptr dword_48796+2,	dx
		les	bx, dword_48796
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word_490A2, ax
		mov	word_490A4, dx
		mov	ax, 306h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_4DBDA, ax
		mov	word ptr dword_4DBDA+2,	dx
		les	bx, dword_4DBDA
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word_4DF54, ax
		mov	word_4DF56, dx
		mov	ax, 306h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_4DF80, ax
		mov	word ptr dword_4DF80+2,	dx
		les	bx, dword_4DF80
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word_4DF8E, ax
		mov	word_4DF90, dx
		mov	ax, 4
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_4E932, ax
		mov	word ptr dword_4E932+2,	dx
		les	bx, dword_4E932
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word_4E94A, ax
		mov	word_4E94C, dx
		mov	word ptr [bp+var_A], ax
		mov	word ptr [bp+var_A+2], dx
		les	bx, [bp+var_A]
		sub	al, al
		mov	es:[bx+3], al
		les	bx, [bp+var_A]
		mov	es:[bx+2], al
		les	bx, [bp+var_A]
		mov	es:[bx+1], al
		les	bx, [bp+var_A]
		mov	es:[bx], al
		mov	[bp+var_E], 7D0h
		mov	[bp+var_12], 0A4ACh
		mov	[bp+var_14], 7D0h

loc_241ED:				; CODE XREF: sub_240B6+14Dj
		mov	bx, [bp+var_12]
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		mov	[bx], ax
		mov	[bx+2],	dx
		add	[bp+var_12], 4
		dec	[bp+var_14]
		jnz	short loc_241ED
		mov	[bp+var_C], 8914h

loc_2420A:				; CODE XREF: sub_240B6+171j
		mov	bx, [bp+var_C]
		mov	word ptr [bx+20h], 0
		mov	bx, [bp+var_C]
		sub	ax, ax
		mov	[bx+4Ah], ax
		mov	[bx+48h], ax
		add	[bp+var_C], 1E7h
		cmp	[bp+var_C], 0A3B6h
		jb	short loc_2420A
		mov	[bp+var_2], 80DAh

loc_2422E:				; CODE XREF: sub_240B6+189j
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr sub_2453F
		add	[bp+var_2], 1Eh
		cmp	[bp+var_2], 890Eh
		jb	short loc_2422E
		mov	[bp+var_6], 0CFCCh

loc_24246:				; CODE XREF: sub_240B6+1B0j
		mov	bx, [bp+var_6]
		mov	word ptr [bx+97h], 0
		mov	bx, [bp+var_6]
		sub	ax, ax
		mov	[bx+95h], ax
		mov	[bx+93h], ax
		add	[bp+var_6], 0BBh ; '�'
		cmp	[bp+var_6], 0D94Bh
		jb	short loc_24246
		mov	[bp+var_10], 0C3ECh

loc_2426D:				; CODE XREF: sub_240B6+1D7j
		mov	bx, [bp+var_10]
		mov	word ptr [bx+97h], 0
		mov	bx, [bp+var_10]
		sub	ax, ax
		mov	[bx+95h], ax
		mov	[bx+93h], ax
		add	[bp+var_10], 0BBh ; '�'
		cmp	[bp+var_10], 0CBF5h
		jb	short loc_2426D
		mov	[bp+var_4], 77BCh

loc_24294:				; CODE XREF: sub_240B6+1F2j
		mov	bx, [bp+var_4]
		sub	ax, ax
		mov	[bx+1Ah], ax
		mov	[bx+18h], ax
		add	[bp+var_4], 26h	; '&'
		cmp	[bp+var_4], 80A4h
		jb	short loc_24294
		mov	word_4DF5A, ax
		mov	word_4DF9A, ax
		mov	word_4B486, ax
		mov	word_4B488, ax
		mov	word ptr dword_483F0+2,	ax
		mov	word ptr dword_483F0, ax
		mov	word_4B396, 0FFFFh
		mov	word_42AE6, ax
		mov	word_42AEA, 0C8h ; '�'
		mov	ax, 1B06h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_23C3C
		mov	word_4DF84, ax
		mov	word_4DF86, dx
		mov	word_4E92C, 0
		mov	word_4879A, 0
		mov	word_4B39E, 0
		mov	word_4DF76, 0
		mov	word_4E954, 1
		mov	word_4DF98, 0
		mov	ax, 4166h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1C51D
		mov	sp, bp
		pop	bp
		retf
sub_240B6	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_24312	proc far		; CODE XREF: sub_24333+91p
					; sub_24333+154p
		xor	ax, ax
		call	__chkstk
		mov	ax, 1BACh
		push	ds
		push	ax		; char *
		call	_puts
		add	sp, 4
		mov	ax, 1
		push	ax		; int
		call	far ptr	_exit
sub_24312	endp

; ---------------------------------------------------------------------------
		add	sp, 2
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_24333(char *)
sub_24333	proc far		; CODE XREF: sub_23F23+29p

var_24		= REGS ptr -24h
var_16		= REGS ptr -16h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 24h	; '$'
		call	__chkstk
		mov	[bp+var_8], 0
		mov	ax, word ptr [bp+arg_0]
		or	ax, word ptr [bp+arg_0+2]
		jz	short loc_24378
		mov	[bp+var_2], 1BE4h
		mov	[bp+var_6], 1C98h

loc_24355:				; CODE XREF: sub_24333+A2j
		mov	bx, [bp+var_2]
		push	word ptr [bx+2]
		push	word ptr [bx]	; char *
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		call	_stricmp
		add	sp, 8
		or	ax, ax
		jnz	short loc_243C9
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		mov	[bp+var_8], ax

loc_24378:				; CODE XREF: sub_24333+16j
					; sub_24333+A0j
		cmp	[bp+var_8], 0
		jnz	short loc_243DD
		mov	word ptr [bp+var_16], 1A00h
		lea	ax, [bp+var_24]
		push	ss
		push	ax		; union	REGS *
		lea	ax, [bp+var_16]
		push	ss
		push	ax		; union	REGS *
		mov	ax, 10h
		push	ax		; int
		call	_int86
		add	sp, 0Ah
		cmp	byte ptr [bp+var_24], 1Ah
		jnz	short loc_243DD
		mov	al, byte ptr [bp+var_24+2]
		sub	ah, ah
		cmp	ax, 7
		jz	short loc_243C3
		cmp	ax, 8
		jz	short loc_243D8
		cmp	ax, 0Ah
		jnz	short loc_243B6
		jmp	loc_24465
; ---------------------------------------------------------------------------

loc_243B6:				; CODE XREF: sub_24333+7Ej
		cmp	ax, 0Bh
		jz	short loc_243C3
		cmp	ax, 0Ch
		jnz	short loc_243C3
		jmp	loc_24465
; ---------------------------------------------------------------------------

loc_243C3:				; CODE XREF: sub_24333+74j
					; sub_24333+86j ...
		push	cs
		call	near ptr sub_24312
; ---------------------------------------------------------------------------
		jmp	short loc_243DD
; ---------------------------------------------------------------------------

loc_243C9:				; CODE XREF: sub_24333+3Aj
		add	[bp+var_2], 6
		mov	ax, [bp+var_6]
		cmp	[bp+var_2], ax
		jnb	short loc_24378
		jmp	loc_24355
; ---------------------------------------------------------------------------

loc_243D8:				; CODE XREF: sub_24333+79j
		mov	[bp+var_8], 8

loc_243DD:				; CODE XREF: sub_24333+49j
					; sub_24333+6Aj ...
		cmp	[bp+var_8], 0
		jnz	short loc_24403
		mov	bx, 0FFFFh
		mov	es, bx
		assume es:nothing
		mov	bx, 0Eh
		cmp	byte ptr es:[bx], 0FFh
		jnz	short loc_24403
		mov	bx, 0FC00h
		mov	es, bx
		assume es:nothing
		sub	bx, bx
		cmp	byte ptr es:[bx], 21h ;	'!'
		jnz	short loc_24403
		mov	[bp+var_8], 2

loc_24403:				; CODE XREF: sub_24333+AEj
					; sub_24333+BCj ...
		cmp	[bp+var_8], 0
		jnz	short loc_24432
		mov	byte ptr [bp+var_16+1],	12h
		mov	byte ptr [bp+var_16+2],	10h
		lea	ax, [bp+var_24]
		push	ss
		push	ax		; union	REGS *
		lea	ax, [bp+var_16]
		push	ss
		push	ax		; union	REGS *
		mov	ax, 10h
		push	ax		; int
		call	_int86
		add	sp, 0Ah
		cmp	byte ptr [bp+var_24+2],	10h
		jz	short loc_24432
		mov	[bp+var_8], 4

loc_24432:				; CODE XREF: sub_24333+D4j
					; sub_24333+F8j
		cmp	[bp+var_8], 0
		jnz	short loc_24480
		mov	ax, 0Fh
		mov	dx, 3D4h
		out	dx, al		; Video: CRT cntrlr addr
					; Cursor location (low)
		mov	dx, 3D5h
		in	al, dx		; Video: CRT controller	internal registers
		sub	ah, ah
		mov	[bp+var_4], ax
		xor	al, 55h
		out	dx, al		; Video: CRT controller	internal registers
		call	sub_1FBD8
		call	sub_1FBD8
		mov	dx, 3D5h
		in	al, dx		; Video: CRT controller	internal registers
		sub	ah, ah
		cmp	ax, [bp+var_4]
		jnz	short loc_2446D
		mov	ax, 1
		jmp	short loc_2446F
; ---------------------------------------------------------------------------

loc_24465:				; CODE XREF: sub_24333+80j
					; sub_24333+8Dj
		mov	[bp+var_8], 1
		jmp	loc_243DD
; ---------------------------------------------------------------------------

loc_2446D:				; CODE XREF: sub_24333+12Bj
		sub	ax, ax

loc_2446F:				; CODE XREF: sub_24333+130j
		xor	ax, 55h
		jz	short loc_24480
		mov	[bp+var_8], 10h
		mov	ax, [bp+var_4]
		mov	dx, 3D5h
		out	dx, al		; Video: CRT controller	internal registers

loc_24480:				; CODE XREF: sub_24333+103j
					; sub_24333+13Fj
		cmp	[bp+var_8], 0
		jnz	short loc_2448A
		push	cs
		call	near ptr sub_24312
; ---------------------------------------------------------------------------

loc_2448A:				; CODE XREF: sub_24333+151j
		test	byte ptr [bp+var_8], 9
		jz	short loc_244BC
		mov	bx, 0FFFFh
		mov	es, bx
		assume es:nothing
		mov	bx, 0Eh
		cmp	byte ptr es:[bx], 0FFh
		jnz	short loc_244B0
		mov	bx, 0FC00h
		mov	es, bx
		assume es:nothing
		sub	bx, bx
		cmp	byte ptr es:[bx], 21h ;	'!'
		jnz	short loc_244B0
		mov	ax, 1
		jmp	short loc_244B2
; ---------------------------------------------------------------------------

loc_244B0:				; CODE XREF: sub_24333+169j
					; sub_24333+176j
		sub	ax, ax

loc_244B2:				; CODE XREF: sub_24333+17Bj
		mov	word_4E92E, ax
		nop
		push	cs
		call	near ptr sub_2F0DA
		jmp	short loc_244C1
; ---------------------------------------------------------------------------

loc_244BC:				; CODE XREF: sub_24333+15Bj
		nop
		push	cs
		call	near ptr sub_2F37D

loc_244C1:				; CODE XREF: sub_24333+187j
		test	byte ptr [bp+var_8], 2
		jz	short loc_244D4
		mov	word_4E92E, 1
		nop
		push	cs
		call	near ptr sub_2E5F4
		jmp	short loc_244D9
; ---------------------------------------------------------------------------

loc_244D4:				; CODE XREF: sub_24333+192j
		nop
		push	cs
		call	near ptr sub_2E977

loc_244D9:				; CODE XREF: sub_24333+19Fj
		test	byte ptr [bp+var_8], 4
		jz	short loc_244E6
		call	sub_2F82E
		jmp	short loc_244EB
; ---------------------------------------------------------------------------

loc_244E6:				; CODE XREF: sub_24333+1AAj
		call	sub_2FAE6

loc_244EB:				; CODE XREF: sub_24333+1B1j
		test	byte ptr [bp+var_8], 10h
		jz	short loc_244F8
		call	sub_30C30
		jmp	short loc_244FD
; ---------------------------------------------------------------------------

loc_244F8:				; CODE XREF: sub_24333+1BCj
		call	sub_3117C

loc_244FD:				; CODE XREF: sub_24333+1C3j
		mov	ax, 43C2h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_1C51D
		mov	sp, bp
		pop	bp
		retf	4
sub_24333	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24510	proc far		; CODE XREF: sub_24565+Dp sub_245CA+Dp ...

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	cx, 80DAh

loc_2451E:				; CODE XREF: sub_24510+24j
		mov	bx, cx
		cmp	word ptr [bx+16h], 0
		jnz	short loc_2452D
		mov	ax, cx
		mov	[bp+var_2], cx
		jmp	short loc_2453B
; ---------------------------------------------------------------------------

loc_2452D:				; CODE XREF: sub_24510+14j
		add	cx, 1Eh
		cmp	cx, 890Eh
		jb	short loc_2451E
		mov	[bp+var_2], cx
		sub	ax, ax

loc_2453B:				; CODE XREF: sub_24510+1Bj
		mov	sp, bp
		pop	bp
		retf
sub_24510	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2453F	proc far		; CODE XREF: sub_18D10+3AP
					; sub_1A350+78P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+16h], 0
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+6], 0FFFFh
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+8], 4
		pop	bp
		retf	2
sub_2453F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24565	proc far		; CODE XREF: sub_1071A+47P
					; sub_2BACC+139p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		push	si
		push	cs
		call	near ptr sub_24510
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_2458A
		mov	ax, 1C02h
		push	ds
		push	ax
		mov	ax, 0FFFFh
		push	ax
		call	sub_1034A
; ---------------------------------------------------------------------------

loc_2458A:				; CODE XREF: sub_24565+15j
		mov	bx, [bp+var_2]
		mov	si, bx
		mov	ax, bx
		mov	[si+1Ah], ax
		mov	[bx+18h], ax
		mov	bx, [bp+arg_0]
		mov	[bx+1E5h], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+arg_0]
		mov	[bx+16h], ax
		mov	bx, [bp+var_2]
		mov	word ptr [bx+1Ch], 0
		mov	[bp+var_4], 1

loc_245B4:				; CODE XREF: sub_24565+5Cj
		push	[bp+arg_0]
		call	sub_245CA
		inc	[bp+var_4]
		cmp	[bp+var_4], 5
		jl	short loc_245B4
		pop	si
		mov	sp, bp
		pop	bp
		retf	2
sub_24565	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_245CA	proc near		; CODE XREF: sub_24565+52p

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	si
		push	cs
		call	near ptr sub_24510
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_2462D
		mov	bx, [bp+arg_0]
		mov	ax, [bx+1E5h]
		mov	[bp+var_4], ax
		mov	bx, ax
		mov	ax, [bx+1Ah]
		mov	[bp+var_6], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	[bx+18h], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_6]
		mov	[bx+1Ah], ax
		mov	bx, [bp+var_4]
		mov	ax, [bp+var_2]
		mov	[bx+1Ah], ax
		mov	bx, [bp+var_6]
		mov	ax, [bp+var_2]
		mov	[bx+18h], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+arg_0]
		mov	[bx+16h], ax
		mov	bx, [bp+var_2]
		mov	si, [bp+var_6]
		mov	ax, [si+1Ch]
		inc	ax
		mov	[bx+1Ch], ax

loc_2462D:				; CODE XREF: sub_245CA+15j
		mov	ax, [bp+var_2]
		pop	si
		mov	sp, bp
		pop	bp
		retn	2
sub_245CA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24637	proc far		; CODE XREF: sub_1C5B3+22DP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	si
		mov	ax, 1E7h
		imul	[bp+arg_0]
		mov	bx, ax
		mov	ax, [bx-7507h]
		mov	[bp+var_2], ax
		mov	bx, ax
		mov	si, word_4879A
		mov	ax, [si+16h]
		cmp	[bx+16h], ax
		jnz	short loc_24668
		mov	bx, si
		mov	ax, [bx+18h]
		mov	[bp+var_2], ax

loc_24668:				; CODE XREF: sub_24637+27j
		push	[bp+var_2]
		push	cs
		call	near ptr sub_24676
		pop	si
		mov	sp, bp
		pop	bp
		retf	2
sub_24637	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24676	proc far		; CODE XREF: sub_14619+1A5P
					; sub_16480+F6P ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	si
		sub	ax, ax
		push	ax
		call	sub_1C9A8
		push	[bp+arg_0]
		push	word_4DFA0
		nop
		push	cs
		call	near ptr sub_2A628
		or	ax, ax
		jz	short loc_246A8
		mov	ax, [bp+arg_0]
		mov	word_4879A, ax

loc_246A0:				; CODE XREF: sub_24676+11Ej
		mov	[bp+var_4], 0
		jmp	loc_247A3
; ---------------------------------------------------------------------------

loc_246A8:				; CODE XREF: sub_24676+22j
		nop
		push	cs
		call	near ptr sub_278A3
		or	ax, ax
		jnz	short loc_246B4
		jmp	loc_24799
; ---------------------------------------------------------------------------

loc_246B4:				; CODE XREF: sub_24676+39j
		mov	word_4DF98, 0
		mov	ax, [bp+arg_0]
		mov	word_4879A, ax
		mov	bx, ax
		mov	ax, 0Ah
		imul	word ptr [bx+1Ch]
		add	ax, 64h	; 'd'
		mov	[bx+10h], ax
		mov	bx, [bp+arg_0]
		mov	ax, 7
		imul	word ptr [bx+1Ch]
		add	ax, 3Ch	; '<'
		mov	[bx+0Eh], ax
		mov	bx, [bp+arg_0]
		mov	si, bx
		sub	ax, ax
		mov	[si+4],	ax
		mov	[bx+2],	ax
		mov	bx, [bp+arg_0]
		mov	[bx], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bx+16h]
		sub	ax, 8914h
		cwd
		mov	cx, 1E7h
		idiv	cx
		cmp	ax, word_4B45F
		jz	short loc_24709
		push	bx
		sub	ax, ax
		jmp	short loc_24781
; ---------------------------------------------------------------------------

loc_24709:				; CODE XREF: sub_24676+8Cj
		cmp	word_4B481, 0
		jnz	short loc_2471F
		nop
		push	cs
		call	near ptr sub_2329F
		nop
		push	cs
		call	near ptr sub_28D13
		nop
		push	cs
		call	near ptr sub_23285

loc_2471F:				; CODE XREF: sub_24676+98j
		mov	bx, [bp+arg_0]
		mov	ax, [bx+1Ch]
		mov	[bp+var_2], ax
		mov	bx, [bx+16h]
		cmp	[bx+3Ah], ax
		jle	short loc_2475B
		mov	ax, 26h	; '&'
		imul	[bp+var_2]
		add	ax, 77D2h
		mov	[bp+var_6], ax

loc_2473C:				; CODE XREF: sub_24676+E3j
		mov	bx, [bp+var_6]
		cmp	word ptr [bx], 0
		jz	short loc_2475B
		add	[bp+var_6], 0BEh ; '�'
		add	[bp+var_2], 5
		mov	bx, [bp+arg_0]
		mov	bx, [bx+16h]
		mov	ax, [bp+var_2]
		cmp	[bx+3Ah], ax
		jg	short loc_2473C

loc_2475B:				; CODE XREF: sub_24676+B8j
					; sub_24676+CCj
		mov	bx, [bp+arg_0]
		mov	bx, [bx+16h]
		mov	ax, [bp+var_2]
		cmp	[bx+3Ah], ax
		jg	short loc_24772
		mov	bx, [bp+arg_0]
		mov	ax, [bx+1Ch]
		mov	[bp+var_2], ax

loc_24772:				; CODE XREF: sub_24676+F1j
		push	[bp+arg_0]
		mov	bx, [bp+arg_0]
		mov	bx, [bx+16h]
		mov	ax, [bx+40h]
		imul	[bp+var_2]

loc_24781:				; CODE XREF: sub_24676+91j
		push	ax
		sub	ax, ax
		push	ax
		call	sub_248F5
		nop
		push	cs
		call	near ptr sub_2A50D
		cmp	word_4DF98, 0
		jnz	short loc_24797
		jmp	loc_246A0
; ---------------------------------------------------------------------------

loc_24797:				; CODE XREF: sub_24676+11Cj
		jmp	short loc_2479E
; ---------------------------------------------------------------------------

loc_24799:				; CODE XREF: sub_24676+3Bj
		nop
		push	cs
		call	near ptr sub_25213

loc_2479E:				; CODE XREF: sub_24676:loc_24797j
		mov	[bp+var_4], 0FFFFh

loc_247A3:				; CODE XREF: sub_24676+2Fj
		mov	ax, 1
		push	ax
		call	sub_1C9A8
		mov	ax, [bp+var_4]
		pop	si
		mov	sp, bp
		pop	bp
		retf	2
sub_24676	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_247B6	proc far		; CODE XREF: sub_1C5B3+247P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	si, [bx+40h]
		mov	bx, word_4879A
		mov	ax, [bx+6]
		cwd
		idiv	si
		mov	ax, [bp+arg_0]
		mov	cx, dx
		imul	si
		add	cx, ax
		push	cx
		call	sub_24814
		pop	si
		pop	bp
		retf	2
sub_247B6	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_247E7	proc far		; CODE XREF: sub_1C5B3+252P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	si
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		mov	si, [bx+40h]
		mov	bx, word_4879A
		mov	ax, [bx+6]
		cwd
		idiv	si
		imul	si
		add	ax, [bp+arg_0]
		push	ax
		call	sub_24814
		pop	si
		pop	bp
		retf	2
sub_247E7	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24814	proc near		; CODE XREF: sub_247B6+29p
					; sub_247E7+25p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	bx, word_4879A
		mov	ax, [bp+arg_0]
		cmp	[bx+6],	ax
		jz	short loc_24853
		sub	ax, ax
		push	ax
		call	sub_1C9A8
		push	word_4879A
		push	[bp+arg_0]
		push	[bp+arg_0]
		call	sub_2485F
		push	ax
		call	sub_248F5
		nop
		push	cs
		call	near ptr sub_2A50D
		mov	ax, 1
		push	ax
		call	sub_1C9A8
		jmp	short loc_2485B
; ---------------------------------------------------------------------------

loc_24853:				; CODE XREF: sub_24814+14j
		mov	bx, word_4879A
		mov	word ptr [bx], 1

loc_2485B:				; CODE XREF: sub_24814+3Dj
		pop	bp
		retn	2
sub_24814	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2485F	proc near		; CODE XREF: sub_24814+28p

var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		push	si
		mov	bx, word_4879A
		mov	ax, [bx+0Ch]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_0]
		shl	ax, 1
		mov	[bp+var_10], ax
		mov	bx, [bx+16h]
		les	bx, [bx+2Ah]
		assume es:nothing
		mov	si, ax
		mov	ax, 6
		imul	word ptr es:[bx+si]
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		add	ax, [bx+26h]
		mov	dx, [bx+28h]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		mov	bx, word_4879A
		mov	bx, [bx+16h]
		les	bx, [bx+2Eh]
		mov	ax, 6
		imul	word ptr es:[bx+si]
		add	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, [bp+var_8]
		mov	word ptr [bp+var_E], ax
		mov	word ptr [bp+var_E+2], dx
		jmp	short loc_248C9
; ---------------------------------------------------------------------------

loc_248C5:				; CODE XREF: sub_2485F+7Ej
		add	word ptr [bp+var_E], 6

loc_248C9:				; CODE XREF: sub_2485F+64j
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	word ptr [bp+var_E], ax
		jnb	short loc_248EC
		les	bx, [bp+var_E]
		mov	ax, [bp+var_A]
		cmp	es:[bx], ax
		jnz	short loc_248C5
		mov	ax, bx
		sub	ax, [bp+var_8]
		cwd
		mov	cx, 6
		idiv	cx
		jmp	short loc_248EE
; ---------------------------------------------------------------------------

loc_248EC:				; CODE XREF: sub_2485F+73j
		sub	ax, ax

loc_248EE:				; CODE XREF: sub_2485F+8Bj
		pop	si
		mov	sp, bp
		pop	bp
		retn	2
sub_2485F	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_248F5	proc near		; CODE XREF: sub_24676+10Fp
					; sub_24814+2Cp

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	si
		mov	bx, [bp+arg_4]
		mov	ax, [bx+16h]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	[bx+6],	ax
		mov	bx, [bp+arg_4]
		mov	ax, [bp+arg_0]
		mov	[bx+0Ah], ax
		mov	si, [bp+arg_2]
		shl	si, 1
		mov	bx, [bp+var_2]
		les	bx, [bx+2Ah]
		mov	ax, es:[bx+si]
		add	ax, [bp+arg_0]
		mov	cx, 6
		imul	cx
		mov	bx, ax
		mov	si, [bp+var_2]
		les	si, [si+26h]
		mov	ax, es:[bx+si]
		mov	bx, [bp+arg_4]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_2]
		les	bx, [bx+22h]
		mov	si, [bp+arg_4]
		mov	ax, 0Eh
		imul	word ptr [si+0Ch]
		mov	si, ax
		mov	ax, es:[bx+si+0Ch]
		mov	bx, [bp+arg_4]
		add	ax, [bx+10h]
		mov	[bx+14h], ax
		mov	bx, [bp+var_2]
		les	bx, [bx+22h]
		mov	si, [bp+arg_4]
		mov	ax, 0Eh
		imul	word ptr [si+0Ch]
		mov	si, ax
		mov	ax, es:[bx+si+0Ah]
		mov	bx, [bp+arg_4]
		add	ax, [bx+0Eh]
		mov	[bx+12h], ax
		push	[bp+arg_4]
		nop
		push	cs
		call	near ptr sub_27A07
		pop	si
		mov	sp, bp
		pop	bp
		retn	6
sub_248F5	endp


; =============== S U B	R O U T	I N E =======================================


sub_2498B	proc near		; CODE XREF: sub_24AF4+3Cp
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		call	sub_1C9A8
		nop
		push	cs
		call	near ptr sub_2A50D
		push	word_4879A
		push	word_4DFA0
		nop
		push	cs
		call	near ptr sub_2A628
		or	ax, ax
		jnz	short loc_249BF
		mov	bx, word_4879A
		mov	word ptr [bx+2], 1
		mov	word_4879A, 0

loc_249BF:				; CODE XREF: sub_2498B+23j
		mov	ax, 1
		push	ax
		call	sub_1C9A8
		retn
sub_2498B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_249C9	proc far		; CODE XREF: sub_137E6+427P

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		mov	[bp+var_6], 0
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_4], 80DAh

loc_249E3:				; CODE XREF: sub_249C9+68j
		mov	bx, [bp+var_4]
		cmp	word ptr [bx+6], 0FFFFh
		jz	short loc_24A28
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, bx
		add	ax, 0Eh
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_20A1B
		or	ax, ax
		jz	short loc_24A28
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	[bp+var_4]
		call	sub_24A3C
		or	ax, ax
		jz	short loc_24A28
		mov	bx, [bp+var_4]
		mov	ax, [bp+var_2]
		cmp	[bx+8],	ax
		jl	short loc_24A28
		mov	ax, bx
		mov	[bp+var_6], ax
		mov	ax, [bx+8]
		mov	[bp+var_2], ax

loc_24A28:				; CODE XREF: sub_249C9+21j
					; sub_249C9+37j ...
		add	[bp+var_4], 1Eh
		cmp	[bp+var_4], 890Eh
		jb	short loc_249E3
		mov	ax, [bp+var_6]
		mov	sp, bp
		pop	bp
		retf	4
sub_249C9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24A3C	proc near		; CODE XREF: sub_249C9+42p

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	di
		push	si
		mov	bx, [bp+arg_0]
		mov	ax, [bx+16h]
		mov	[bp+var_2], ax
		les	bx, [bp+arg_2]
		mov	ax, es:[bx+2]
		mov	bx, [bp+arg_0]
		sub	ax, [bx+10h]
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	word ptr [bx+0Ch]
		nop
		push	cs
		call	near ptr sub_278E9
		or	ax, ax
		jz	short loc_24A75
		sub	ax, ax
		jmp	short loc_24AEC
; ---------------------------------------------------------------------------

loc_24A75:				; CODE XREF: sub_24A3C+33j
		mov	bx, [bp+arg_0]
		mov	ax, 0Eh
		imul	word ptr [bx+0Ch]
		mov	bx, [bp+var_2]
		add	ax, [bx+22h]
		mov	dx, [bx+24h]
		mov	word ptr [bp+var_A], ax
		mov	word ptr [bp+var_A+2], dx
		mov	si, [bp+var_4]
		sar	si, 1
		les	bx, [bp+arg_2]
		mov	ax, es:[bx]
		mov	bx, [bp+arg_0]
		sub	ax, [bx+0Eh]
		les	bx, [bp+var_A]
		imul	word ptr es:[bx+8]
		mov	bx, ax
		mov	di, word ptr [bp+var_A]
		les	di, es:[di]
		add	bx, es:[di]
		mov	es, word ptr es:[di+2]
		mov	al, es:[bx+si]
		cbw
		mov	[bp+var_6], ax
		push	[bp+var_2]
		mov	bx, [bp+arg_0]
		push	word ptr [bx+0Ch]
		nop
		push	cs
		call	near ptr sub_27957
		test	byte ptr [bp+var_4], 1
		jz	short loc_24ADE
		mov	al, byte ptr [bp+var_6]
		and	al, 0Fh
		mov	cx, ax
		cmp	cl, 1

loc_24AD9:				; CODE XREF: sub_24A3C+AEj
		sbb	ax, ax
		inc	ax
		jmp	short loc_24AEC
; ---------------------------------------------------------------------------

loc_24ADE:				; CODE XREF: sub_24A3C+91j
		mov	ax, [bp+var_6]
		mov	cl, 4
		sar	ax, cl
		mov	cx, ax
		cmp	cx, 1
		jmp	short loc_24AD9
; ---------------------------------------------------------------------------

loc_24AEC:				; CODE XREF: sub_24A3C+37j
					; sub_24A3C+A0j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retn	6
sub_24A3C	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24AF4	proc far		; CODE XREF: sub_14619+1C4P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_0]
		add	ax, 0Eh
		push	ds
		push	ax
		mov	bx, [bp+arg_0]
		mov	ax, 0Ah
		imul	word ptr [bx+1Ch]
		sub	ax, [bx+10h]
		add	ax, 64h	; 'd'
		push	ax
		mov	ax, 7
		imul	word ptr [bx+1Ch]
		sub	ax, [bx+0Eh]
		add	ax, 3Ch	; '<'
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		mov	bx, [bp+arg_0]
		mov	word ptr [bx+8], 7
		call	sub_2498B
		pop	bp
		retf	2
sub_24AF4	endp

; ---------------------------------------------------------------------------
		align 2

loc_24B38:				; DATA XREF: dseg:28F0o dseg:2FFCo
		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, [bp+6]
		sub	ax, 1
		cmp	ax, 7
		jbe	short loc_24B51
		jmp	loc_24BE4
; ---------------------------------------------------------------------------

loc_24B51:				; CODE XREF: seg001:4BFCj
		add	ax, ax
		xchg	ax, bx
		jmp	cs:off_24BD4[bx]
; ---------------------------------------------------------------------------

loc_24B59:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:off_24BD4o
		mov	ax, word_475A8

loc_24B5C:				; CODE XREF: seg001:4C15j seg001:4C1Aj ...
		mov	[bp-2],	ax
		jmp	loc_24BE4
; ---------------------------------------------------------------------------

loc_24B62:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C86o
		mov	ax, word_475AC
		jmp	short loc_24B5C
; ---------------------------------------------------------------------------

loc_24B67:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C88o
		mov	ax, word_475AA
		jmp	short loc_24B5C
; ---------------------------------------------------------------------------

loc_24B6C:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C8Ao
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		dec	ax

loc_24B7B:				; CODE XREF: seg001:4C4Aj seg001:4C5Ej ...
		push	ax
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		call	word_475A6
		add	sp, 6
		jmp	short loc_24B5C
; ---------------------------------------------------------------------------

loc_24B8B:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C8Co
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		inc	ax
		jmp	short loc_24B7B
; ---------------------------------------------------------------------------

loc_24B9C:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C8Eo
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		sub	ax, word_475A4
		jmp	short loc_24B7B
; ---------------------------------------------------------------------------

loc_24BB0:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C90o
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		add	ax, word_475A4
		jmp	short loc_24B7B
; ---------------------------------------------------------------------------

loc_24BC4:				; CODE XREF: seg001:4C04j
					; DATA XREF: seg001:4C92o
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ch]
		call	sub_154F5
		jmp	short loc_24B7B
; ---------------------------------------------------------------------------
off_24BD4	dw offset loc_24B59	; DATA XREF: seg001:4C04r
		dw offset loc_24B62
		dw offset loc_24B67
		dw offset loc_24B6C
		dw offset loc_24B8B
		dw offset loc_24B9C
		dw offset loc_24BB0
		dw offset loc_24BC4
; ---------------------------------------------------------------------------

loc_24BE4:				; CODE XREF: seg001:4BFEj seg001:4C0Fj
		mov	ax, [bp-2]
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_24BEB:				; DATA XREF: dseg:233Ao dseg:2352o ...
		push	bp
		mov	bp, sp
		mov	ax, 20h	; ' '
		call	__chkstk
		push	si
		lea	ax, [bp-14h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_204CF
		mov	byte_490A6, 2
		mov	byte_490B0, 1
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		lea	ax, [bp-20h]
		push	ss
		push	ax
		lea	ax, [bp-16h]
		push	ss
		push	ax
		call	sub_1333C
		mov	ax, 18h
		mul	word ptr [bp+0Ah]
		mov	si, ax
		mov	es, seg_4703A
		assume es:dseg
		mov	ax, es:[si-1D96h]
		add	ax, [bp-20h]
		mov	[bp-1Ch], ax
		mov	ax, es:[si-1D98h]
		add	ax, [bp-16h]
		mov	[bp-1Eh], ax
		mov	ax, es:[si-1D92h]
		add	ax, [bp-20h]
		mov	[bp-18h], ax
		mov	ax, es:[si-1D94h]
		add	ax, [bp-16h]
		mov	[bp-1Ah], ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		call	sub_154F5
		or	ax, ax
		jz	short loc_24C6E
		sub	ax, ax
		jmp	short loc_24C71
; ---------------------------------------------------------------------------

loc_24C6E:				; CODE XREF: seg001:4D18j
		mov	ax, 0Fh

loc_24C71:				; CODE XREF: seg001:4D1Cj
		push	ax
		nop
		push	cs
		call	near ptr sub_20B78
		cmp	word ptr [bp+0Ah], 2BAh
		jnz	short loc_24CAA
		lea	ax, [bp-1Eh]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_208DF
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		call	sub_154F5
		or	ax, ax
		jz	short loc_24C9D
		jmp	loc_24D7E
; ---------------------------------------------------------------------------

loc_24C9D:				; CODE XREF: seg001:4D48j
		lea	ax, [bp-1Eh]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233FE
		jmp	loc_24D7E
; ---------------------------------------------------------------------------

loc_24CAA:				; CODE XREF: seg001:4D2Cj
		mov	ax, 18h
		mul	word ptr [bp+0Ah]
		mov	si, ax
		mov	es, seg_4703A
		mov	ax, es:[si-1D7Eh]
		add	ax, [bp-20h]
		mov	[bp-6],	ax
		mov	ax, es:[si-1D80h]
		add	ax, [bp-16h]
		mov	[bp-8],	ax
		mov	ax, es:[si-1D7Ah]
		add	ax, [bp-20h]
		mov	[bp-2],	ax
		mov	ax, es:[si-1D7Ch]
		add	ax, [bp-16h]
		mov	[bp-4],	ax
		mov	ax, [bp-1Ch]
		mov	[bp-0Eh], ax
		mov	ax, [bp-1Eh]
		mov	[bp-10h], ax
		mov	ax, [bp-18h]
		mov	[bp-0Ah], ax
		mov	ax, [bp-8]
		dec	ax
		mov	[bp-0Ch], ax
		lea	ax, [bp-10h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_208DF
		mov	ax, [bp-6]
		dec	ax
		mov	[bp-0Ah], ax
		mov	ax, [bp-1Ah]
		mov	[bp-0Ch], ax
		lea	ax, [bp-10h]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_208DF
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		call	sub_154F5
		or	ax, ax
		jnz	short loc_24D7E
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20B78
		mov	ax, [bp-18h]
		dec	ax
		dec	ax
		push	ax
		mov	ax, [bp-8]
		dec	ax
		dec	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20892
		mov	ax, [bp-18h]
		dec	ax
		dec	ax
		push	ax
		push	word ptr [bp-1Eh]
		nop
		push	cs
		call	near ptr sub_20735
		push	word ptr [bp-1Ch]
		push	word ptr [bp-1Eh]
		nop
		push	cs
		call	near ptr sub_20735
		push	word ptr [bp-1Ch]
		mov	ax, [bp-1Ah]
		dec	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20735
		mov	ax, [bp-6]
		sub	ax, 3
		push	ax
		mov	ax, [bp-1Ah]
		dec	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20735

loc_24D7E:				; CODE XREF: seg001:4D4Aj seg001:4D57j ...
		mov	al, [bp-12h]
		mov	byte_490A6, al
		mov	al, [bp-14h]
		mov	byte_490B0, al
		pop	si
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

loc_24D8F:				; DATA XREF: dseg:2DCEo
		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		lea	ax, [bp-8]
		push	ss
		push	ax
		call	sub_15481
		nop
		push	cs
		call	near ptr sub_20AF6
		lea	ax, [bp-8]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_208DF
		lea	ax, [bp-8]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233FE
		lea	ax, [bp-8]
		push	ss
		push	ax
		mov	ax, 1
		push	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20513
		sub	ax, ax
		mov	dx, 1
		push	dx
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		call	sub_154F5
		sub	cx, cx
		push	cx
		push	ax
		mov	ax, [bp-2]
		sub	ax, [bp-6]
		cwd
		push	dx
		push	ax
		call	__aFlmul
		push	dx
		push	ax
		call	__aFldiv
		add	ax, [bp-6]
		mov	[bp-2],	ax
		lea	ax, [bp-8]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		lea	ax, [bp-8]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_233FE
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24E21	proc far		; CODE XREF: sub_1C5B3:loc_1C5FFP

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, 1872h
		mov	dx, seg	dseg
		push	dx
		push	ax
		mov	ax, 1AD6h
		mov	dx, seg	dseg
		push	dx
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		call	sub_15B6A
		mov	ax, 1DF8h
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx

loc_24E57:				; CODE XREF: sub_24E21+48j
		push	[bp+var_2]
		push	[bp+var_4]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		cmp	ax, 1
		jnz	short loc_24E57
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_14A8E
		mov	sp, bp
		pop	bp
		retf
sub_24E21	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24E7A	proc far		; CODE XREF: sub_17F89+16P
					; sub_1806F+25P ...

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	di
		push	si
		cmp	word_4B39E, 0
		jnz	short loc_24E93

loc_24E8E:				; CODE XREF: sub_24E7A+A0j
		sub	ax, ax
		jmp	loc_24F2E
; ---------------------------------------------------------------------------

loc_24E93:				; CODE XREF: sub_24E7A+12j
		mov	si, 65D8h
		les	di, [bp+arg_0]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		les	di, [bp+arg_0]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	word_42EAE, cx
		mov	ax, 1ED6h
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx
		jmp	short loc_24EE6
; ---------------------------------------------------------------------------

loc_24ED9:				; CODE XREF: sub_24E7A+81j
		cmp	[bp+var_2], 2
		jz	short loc_24EFD
		cmp	[bp+var_2], 12Bh
		jz	short loc_24EFD

loc_24EE6:				; CODE XREF: sub_24E7A+5Dj
		push	[bp+var_4]
		push	[bp+var_6]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		mov	[bp+var_2], ax
		cmp	ax, 1
		jnz	short loc_24ED9

loc_24EFD:				; CODE XREF: sub_24E7A+63j
					; sub_24E7A+6Aj
		push	[bp+var_4]
		push	[bp+var_6]
		call	sub_14A8E
		mov	ax, [bp+var_2]
		cmp	ax, 1
		jz	short loc_24F1F
		cmp	ax, 2
		jz	short loc_24F26
		cmp	ax, 12Bh
		jnz	short loc_24F1D
		jmp	loc_24E8E
; ---------------------------------------------------------------------------

loc_24F1D:				; CODE XREF: sub_24E7A+9Ej
		jmp	short loc_24F2B
; ---------------------------------------------------------------------------

loc_24F1F:				; CODE XREF: sub_24E7A+94j
		call	sub_17E89
		jmp	short loc_24F2E
; ---------------------------------------------------------------------------

loc_24F26:				; CODE XREF: sub_24E7A+99j
		mov	ax, 2
		jmp	short loc_24F2E
; ---------------------------------------------------------------------------

loc_24F2B:				; CODE XREF: sub_24E7A:loc_24F1Dj
		mov	ax, 0FFFFh

loc_24F2E:				; CODE XREF: sub_24E7A+16j
					; sub_24E7A+AAj ...
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	4
sub_24E7A	endp


; =============== S U B	R O U T	I N E =======================================


sub_24F36	proc far		; CODE XREF: seg000:830BP
		xor	ax, ax
		call	__chkstk
		mov	ax, 1F6Ch
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_24F36	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	ax, 1FA6h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf

; =============== S U B	R O U T	I N E =======================================


sub_24F62	proc far		; CODE XREF: sub_28A28+4Cp
					; sub_2B0C0+FDp
		xor	ax, ax
		call	__chkstk
		mov	ax, 1FE0h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_24F62	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	ax, 201Ah
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_24F8E	proc far		; CODE XREF: sub_1C5B3:loc_1C731P

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	di
		mov	bx, word_4879A
		mov	ax, [bx+8]
		mov	[bp+var_2], ax
		mov	ax, 0Ah
		push	ax		; int
		mov	ax, 6656h
		push	ds
		push	ax		; char *
		mov	ax, 8
		sub	ax, [bp+var_2]
		push	ax		; int
		call	_itoa
		add	sp, 8
		mov	di, 6656h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	word_433F6, cx
		mov	[bp+var_8], 0
		mov	[bp+var_C], 233Eh

loc_24FDB:				; CODE XREF: sub_24F8E+6Cj
		mov	ax, [bp+var_2]
		cmp	[bp+var_8], ax
		jnz	short loc_24FE8
		mov	ax, 1
		jmp	short loc_24FEA
; ---------------------------------------------------------------------------

loc_24FE8:				; CODE XREF: sub_24F8E+53j
		sub	ax, ax

loc_24FEA:				; CODE XREF: sub_24F8E+58j
		mov	bx, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_C], 18h
		inc	[bp+var_8]
		cmp	[bp+var_8], 8
		jl	short loc_24FDB
		mov	ax, 2436h
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_6], ax
		mov	[bp+var_4], dx

loc_2500C:				; CODE XREF: sub_24F8E+133j
		push	[bp+var_4]
		push	[bp+var_6]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		mov	[bp+var_A], ax
		cmp	ax, 2B3h
		jge	short loc_25026
		jmp	loc_250B5
; ---------------------------------------------------------------------------

loc_25026:				; CODE XREF: sub_24F8E+93j
		cmp	ax, 2BBh
		jl	short loc_2502E
		jmp	loc_250B5
; ---------------------------------------------------------------------------

loc_2502E:				; CODE XREF: sub_24F8E+9Bj
		sub	ax, ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_6]
		mov	ax, [bp+var_2]
		add	ax, 2B3h
		push	ax
		call	sub_15BD2
		mov	ax, 1
		push	ax
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_A]
		call	sub_15BD2
		mov	ax, [bp+var_A]
		sub	ax, 2B3h
		mov	[bp+var_2], ax
		mov	ax, 0Ah
		push	ax		; int
		mov	ax, 6656h
		push	ds
		push	ax		; char *
		mov	ax, 8
		sub	ax, [bp+var_2]
		push	ax		; int
		call	_itoa
		add	sp, 8
		push	[bp+var_4]
		push	[bp+var_6]
		mov	ax, 2BBh
		push	ax
		call	sub_15601
		mov	di, 6656h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		push	[bp+var_4]
		push	[bp+var_6]
		mov	ax, 2BBh
		push	ax
		call	sub_15BD2
		push	[bp+var_4]
		push	[bp+var_6]
		mov	ax, 2BBh
		push	ax
		call	sub_15C06

loc_250B5:				; CODE XREF: sub_24F8E+95j
					; sub_24F8E+9Dj
		cmp	[bp+var_A], 1
		jz	short loc_250C4
		cmp	[bp+var_A], 2
		jz	short loc_250C4
		jmp	loc_2500C
; ---------------------------------------------------------------------------

loc_250C4:				; CODE XREF: sub_24F8E+12Bj
					; sub_24F8E+131j
		push	[bp+var_4]
		push	[bp+var_6]
		call	sub_14A8E
		cmp	[bp+var_A], 1
		jnz	short loc_250F5
		sub	ax, ax
		push	ax
		call	sub_1C9A8
		mov	bx, word_4879A
		mov	ax, [bp+var_2]
		mov	[bx+8],	ax
		nop
		push	cs
		call	near ptr sub_2A50D
		mov	ax, 1
		push	ax
		call	sub_1C9A8

loc_250F5:				; CODE XREF: sub_24F8E+145j
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_24F8E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_250FA	proc far		; CODE XREF: sub_1EF9A+22P
					; sub_2B0C0+23p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	[bp+arg_2]
		push	[bp+arg_0]
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		call	sub_15B6A
		mov	ax, 24CCh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15B48
		pop	bp
		retf	4
sub_250FA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25129	proc far		; CODE XREF: seg000:9070P

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 252Ah
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A4B
		mov	[bp+var_2], ax
		mov	sp, bp
		pop	bp
		retf
sub_25129	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25149	proc far		; CODE XREF: sub_1C5B3+144P
					; sub_1C5B3+15EP

var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	di
		push	si
		lea	si, [bp+var_A]
		les	di, [bp+arg_0]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		lea	ax, [bp+var_A]
		push	ss
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		call	sub_15B6A
		mov	ax, 2594h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_C], ax
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	4
sub_25149	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_251A4	proc near		; CODE XREF: sub_251E6+15p
					; seg001:52BFp	...

arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	word_437A2, ax
		mov	seg_437A4, dx
		mov	ax, word_43796
		add	ax, 0Ah
		mov	word_475A2, ax
		mov	ax, word_43794
		add	ax, word_436BE
		mov	word_475A0, ax
		mov	ax, 27B4h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		mov	word_4DF98, 1
		pop	bp
		retn	6
sub_251A4	endp


; =============== S U B	R O U T	I N E =======================================


sub_251E6	proc far		; CODE XREF: sub_26624+D6p
					; sub_26818+94p
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_23285
		mov	ax, 26F4h
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf
sub_251E6	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	ax, 270Ch
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf

; =============== S U B	R O U T	I N E =======================================


sub_25213	proc far		; CODE XREF: sub_142F7:loc_14351P
					; sub_1C5B3:loc_1C77EP	...
		xor	ax, ax
		call	__chkstk
		mov	ax, 2724h
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf
sub_25213	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	ax, 273Ch
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		call	sub_251A4
		retf

; =============== S U B	R O U T	I N E =======================================


sub_2523A	proc far		; CODE XREF: sub_1071A+28P
					; sub_2BACC+174p
		xor	ax, ax
		call	__chkstk
		mov	ax, 2754h
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf
sub_2523A	endp


; =============== S U B	R O U T	I N E =======================================


sub_2524E	proc far		; CODE XREF: sub_1FD8B:loc_1FE4CP
					; sub_1FD8B:loc_1FF27P
		xor	ax, ax
		call	__chkstk
		mov	ax, 276Ch
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf
sub_2524E	endp


; =============== S U B	R O U T	I N E =======================================


sub_25262	proc far		; CODE XREF: sub_1F902+87P
		xor	ax, ax
		call	__chkstk
		mov	ax, 2784h
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf
sub_25262	endp


; =============== S U B	R O U T	I N E =======================================


sub_25276	proc far		; CODE XREF: sub_16EE2+ABP
					; sub_16FA8:loc_17006P	...
		xor	ax, ax
		call	__chkstk
		mov	ax, 279Ch
		push	ds
		push	ax
		mov	ax, 1
		push	ax
		call	sub_251A4
		retf
sub_25276	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2528A	proc far		; CODE XREF: sub_26352+8Fp

var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_8		= byte ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 16h
		call	__chkstk
		push	di
		push	si
		mov	ax, 0Ah
		push	ax		; int
		lea	ax, [bp+var_8]
		push	ss
		push	ax		; char *
		push	[bp+arg_0]	; int
		call	_itoa
		add	sp, 8
		mov	bx, ax
		mov	word ptr [bp+var_16], bx
		mov	word ptr [bp+var_16+2],	dx
		lea	si, [bp+var_10]
		les	di, [bp+var_16]
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		call	sub_15B6A
		mov	ax, 2828h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_12], ax
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	2
sub_2528A	endp


; =============== S U B	R O U T	I N E =======================================


sub_25301	proc far		; CODE XREF: sub_2863E+4Bp
					; sub_2BACC+FDp ...
		xor	ax, ax
		call	__chkstk
		mov	ax, 2862h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_25301	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_25317(int, int, char *)
sub_25317	proc far		; CODE XREF: sub_1F7D3+3CP
					; sub_287CF+87p ...

var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword	ptr -2Eh
var_4		= word ptr -4
var_2		= word ptr -2
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 0E4h ; '�'
		call	__chkstk
		push	di
		push	si
		mov	ax, 5Ch	; '\'
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	_strrchr
		add	sp, 6
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, 2Fh	; '/'
		push	ax		; int
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		call	_strrchr
		add	sp, 6
		mov	[bp+var_32], ax
		mov	[bp+var_30], dx
		or	ax, dx
		jz	short loc_25377
		mov	ax, [bp+var_4]
		or	ax, [bp+var_2]
		jz	short loc_25377
		mov	ax, [bp+var_4]
		mov	dx, [bp+var_2]
		cmp	[bp+var_32], ax
		jbe	short loc_25377
		mov	ax, [bp+var_32]
		mov	dx, [bp+var_30]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx

loc_25377:				; CODE XREF: sub_25317+3Fj
					; sub_25317+47j ...
		mov	ax, [bp+var_4]
		or	ax, [bp+var_2]
		jnz	short loc_2538B
		mov	ax, word ptr [bp+arg_4]
		mov	dx, word ptr [bp+arg_4+2]
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx

loc_2538B:				; CODE XREF: sub_25317+66j
		mov	cx, 8
		lea	di, [bp+var_2E+2]
		mov	si, 365Eh
		mov	ax, ss
		mov	es, ax
		assume es:nothing
		mov	ax, di
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	bx, ax
		mov	si, [bp+var_4]
		mov	cx, [bp+var_2]
		mov	word ptr [bp+var_E0], si
		mov	word ptr [bp+var_E0+2],	cx
		mov	si, bx
		les	di, [bp+var_E0]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		mov	ax, di
		not	cx
		sub	ax, cx
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	bx, ax
		mov	word ptr [bp+var_E4], bx
		mov	word ptr [bp+var_E4+2],	dx
		mov	di, 365Ch
		mov	ax, ds
		push	ds
		lds	si, [bp+var_E4]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		push	word ptr [bp+arg_4+2]
		push	word ptr [bp+arg_4] ; char *
		lea	ax, [bp+var_2E]
		push	ss
		push	ax		; __int32
		call	sub_17D12
		or	ax, ax
		jz	short loc_25434
		mov	word ptr [bp+var_2E], 0FFh

loc_25434:				; CODE XREF: sub_25317+116j
		mov	ax, word ptr [bp+var_2E]
		cmp	ax, 6
		jz	short loc_254B2
		cmp	ax, 5Bh	; '['
		jz	short loc_2548D
		cmp	ax, 5Ch	; '\'
		jz	short loc_254A0
		cmp	ax, 0C0h ; '�'
		jz	short loc_254AD
		cmp	ax, 0C2h ; '�'
		jz	short loc_254A0
		mov	ax, 3
		mov	[bp+var_DC], ax
		push	ax
		mov	ax, 1B2Eh
		push	ds
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]

loc_25463:				; CODE XREF: sub_25317+187j
		call	sub_17C2A
		lea	ax, [bp+var_2E+2]
		push	ss
		push	ax
		lea	ax, [bp+var_DA]
		push	ss
		push	ax
		call	sub_17C9B
		cmp	[bp+var_DA], 0
		jz	short loc_254BF
		push	[bp+var_DC]
		call	sub_197B5
		mov	ax, 1
		jmp	short loc_254C2
; ---------------------------------------------------------------------------

loc_2548D:				; CODE XREF: sub_25317+128j
		mov	ax, 3
		mov	[bp+var_DC], ax
		push	ax
		mov	ax, 1B2Eh

loc_25498:				; CODE XREF: sub_25317+194j
					; sub_25317+1A6j
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		jmp	short loc_25463
; ---------------------------------------------------------------------------

loc_254A0:				; CODE XREF: sub_25317+12Dj
					; sub_25317+137j
		mov	ax, 4

loc_254A3:				; CODE XREF: sub_25317+199j
		mov	[bp+var_DC], ax
		push	ax
		mov	ax, 1B30h
		jmp	short loc_25498
; ---------------------------------------------------------------------------

loc_254AD:				; CODE XREF: sub_25317+132j
		mov	ax, 5
		jmp	short loc_254A3
; ---------------------------------------------------------------------------

loc_254B2:				; CODE XREF: sub_25317+123j
		mov	ax, 6
		mov	[bp+var_DC], ax
		push	ax
		mov	ax, 1B36h
		jmp	short loc_25498
; ---------------------------------------------------------------------------

loc_254BF:				; CODE XREF: sub_25317+166j
		mov	ax, 2

loc_254C2:				; CODE XREF: sub_25317+174j
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf	8
sub_25317	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_254CA	proc far		; CODE XREF: sub_1C5B3:loc_1C776P

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		mov	word_475A8, 4
		mov	word_475AC, 40h	; '@'
		mov	word_475A4, 0Ah
		mov	word_475A6, 56B6h
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		push	dx
		push	ax
		call	sub_1B047
		les	bx, [bp+var_C]
		assume es:nothing
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_2A762
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+2]
		sub	ah, ah
		mov	[bp+var_2], ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		call	sub_1B063
		push	[bp+var_2]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_25606
		add	sp, 6
		mov	ax, 2944h
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		jmp	short loc_25556
; ---------------------------------------------------------------------------

loc_25550:				; CODE XREF: sub_254CA+A1j
		cmp	[bp+var_4], 2
		jz	short loc_2556D

loc_25556:				; CODE XREF: sub_254CA+84j
		push	[bp+var_6]
		push	[bp+var_8]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		mov	[bp+var_4], ax
		cmp	ax, 1
		jnz	short loc_25550

loc_2556D:				; CODE XREF: sub_254CA+8Aj
		push	[bp+var_6]
		push	[bp+var_8]
		call	sub_14A8E
		cmp	[bp+var_4], 1
		jnz	short loc_25587
		push	word_475AA
		nop
		push	cs
		call	near ptr sub_2A5E2

loc_25587:				; CODE XREF: sub_254CA+B2j
		mov	sp, bp
		pop	bp
		retf
sub_254CA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2558B	proc far		; CODE XREF: sub_105D3+34P
					; sub_1A307+32P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	word_435D2, ax
		mov	word_435D4, dx
		mov	ax, 25FEh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_2], ax
		mov	sp, bp
		pop	bp
		retf	4
sub_2558B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_255BA	proc far		; CODE XREF: sub_10680+BP

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 2668h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_2], ax
		mov	sp, bp
		pop	bp
		retf
sub_255BA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_255DA	proc far		; CODE XREF: sub_2C79C+41p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 26BAh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_2], ax
		cmp	ax, 1
		jnz	short loc_255FF
		push	cs
		call	near ptr sub_25AA0

loc_255FF:				; CODE XREF: sub_255DA+1Fj
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf
sub_255DA	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25606	proc near		; CODE XREF: sub_254CA+6Ep

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		cmp	[bp+arg_4], 3Dh	; '='
		jl	short loc_2561E
		mov	[bp+arg_4], 3Ch	; '<'
		jmp	short loc_25629
; ---------------------------------------------------------------------------

loc_2561E:				; CODE XREF: sub_25606+Fj
		cmp	[bp+arg_4], 0
		jge	short loc_25629
		mov	[bp+arg_4], 0

loc_25629:				; CODE XREF: sub_25606+16j
					; sub_25606+1Cj
		mov	ax, 0Ah
		push	ax		; int
		mov	ax, 6650h
		push	ds
		push	ax		; char *
		push	[bp+arg_4]	; int
		call	_itoa
		add	sp, 8
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_25686
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 76Ah
		push	ax
		call	sub_15601
		mov	di, 6650h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 76Ah
		push	ax
		call	sub_15BD2
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 76Ah
		push	ax
		call	sub_15C06
		jmp	short loc_2569B
; ---------------------------------------------------------------------------

loc_25686:				; CODE XREF: sub_25606+3Dj
		mov	di, 6650h
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	word_43904, cx

loc_2569B:				; CODE XREF: sub_25606+7Ej
		mov	ax, [bp+arg_4]
		mov	word_475AA, ax
		pop	di
		pop	bp
		retn
sub_25606	endp


; =============== S U B	R O U T	I N E =======================================


sub_256A4	proc far		; CODE XREF: _main+11EP sub_256C0+C0p
		xor	ax, ax
		call	__chkstk
		call	sub_1B3A8
		mov	al, ah
		mov	ah, dl
		mov	dl, dh
		sub	dh, dh
		mov	word_475B0, ax
		mov	word_475B2, dx
		retf
sub_256A4	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_256C0	proc far		; CODE XREF: sub_1C5B3:loc_1C607P

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		push	di
		push	si
		call	sub_1AFB7
		mov	si, ax
		mov	di, dx
		nop
		push	cs
		call	near ptr sub_278AF
		cmp	dx, di
		jb	short loc_256EC
		ja	short loc_256E5
		cmp	ax, si
		jbe	short loc_256EC

loc_256E5:				; CODE XREF: sub_256C0+1Fj
		call	sub_1AFB7
		jmp	short loc_256F1
; ---------------------------------------------------------------------------

loc_256EC:				; CODE XREF: sub_256C0+1Dj
					; sub_256C0+23j
		nop
		push	cs
		call	near ptr sub_278AF

loc_256F1:				; CODE XREF: sub_256C0+2Aj
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, 0Ah
		push	ax		; int
		mov	ax, 6600h
		push	ds
		push	ax		; char *
		mov	ax, [bp+var_4]
		mov	cl, 0Ah
		call	__aFulshr
		push	dx
		push	ax		; __int32
		call	far ptr	_ltoa
		add	sp, 0Ah
		mov	bx, ax
		mov	word ptr [bp+var_8], bx
		mov	word ptr [bp+var_8+2], dx
		mov	di, 3666h
		mov	ax, ds
		mov	es, ax
		push	ds
		lds	si, [bp+var_8]
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		mov	bx, cx
		xchg	di, si
		push	es
		mov	es, dx
		assume es:nothing
		pop	ds
		mov	cx, 0FFFFh
		repne scasb
		dec	di
		mov	cx, bx
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		pop	ds
		mov	di, 6600h
		mov	ax, ds
		mov	es, ax
		assume es:dseg
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	word_43DCA, cx
		mov	al, 8
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	unknown_libname_5 ; MS Quick C v1.0/v2.01 & MSC	v5.1 DOS run-time & graphic
		mov	ax, word_475B0
		mov	dx, word_475B2
		cmp	[bp+var_2], dx
		jb	short loc_25783
		ja	short loc_2577F
		cmp	[bp+var_4], ax
		jbe	short loc_25783

loc_2577F:				; CODE XREF: sub_256C0+B8j
		push	cs
		call	near ptr sub_256A4

loc_25783:				; CODE XREF: sub_256C0+B6j
					; sub_256C0+BDj
		push	word_475B2
		push	word_475B0
		mov	dx, [bp+var_4]
		sub	ax, ax
		push	dx
		push	ax
		call	__aFuldiv
		mov	word_43DB2, ax
		mov	ax, word_43DEC
		add	ax, 4
		mov	word_475A2, ax
		mov	ax, word_43DEA
		add	ax, word_43DA8
		inc	ax
		mov	word_475A0, ax
		mov	ax, 2E0Ah
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A4B
		pop	si
		pop	di
		mov	sp, bp
		pop	bp
		retf
sub_256C0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __stdcall	__far sub_257C2(char *)
sub_257C2	proc far		; CODE XREF: sub_1A095+19P

var_10		= byte ptr -10h
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 10h
		call	__chkstk
		lea	ax, [bp+var_10]
		push	ss
		push	ax		; char *
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0] ; char *
		nop
		push	cs
		call	near ptr sub_231D1
		lea	ax, [bp+var_10]
		push	ss
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		push	ax
		call	sub_15B6A
		mov	ax, 2E8Ch
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A4B
		mov	[bp+var_2], ax
		cmp	ax, 897h
		jnz	short loc_2580A
		mov	ax, 1
		jmp	short loc_25818
; ---------------------------------------------------------------------------

loc_2580A:				; CODE XREF: sub_257C2+41j
		cmp	[bp+var_2], 896h
		jnz	short loc_25815
		sub	ax, ax
		jmp	short loc_25818
; ---------------------------------------------------------------------------

loc_25815:				; CODE XREF: sub_257C2+4Dj
		mov	ax, [bp+var_2]

loc_25818:				; CODE XREF: sub_257C2+46j
					; sub_257C2+51j
		mov	sp, bp
		pop	bp
		retf	4
sub_257C2	endp


; =============== S U B	R O U T	I N E =======================================


sub_2581E	proc far		; CODE XREF: sub_16480:loc_16589P
		xor	ax, ax
		call	__chkstk
		mov	ax, 2EDEh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15B48
		retf
sub_2581E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25834	proc far		; CODE XREF: sub_1C5B3:loc_1C786P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 0Ah
		call	__chkstk
		push	si
		mov	word_475A8, 4
		mov	word_475AC, 1Bh
		mov	word_475A4, 1
		mov	word_475A6, 597Dh
		mov	cx, 17h
		mov	si, 2F2Eh

loc_2585E:				; CODE XREF: sub_25834+37j
		mov	ax, word_4B3C8
		cmp	[si], ax
		jge	short loc_2586D
		sub	si, 2
		dec	cx
		or	cx, cx
		jg	short loc_2585E

loc_2586D:				; CODE XREF: sub_25834+2Fj
		mov	[bp+var_6], cx
		push	cx
		sub	ax, ax
		push	ax
		push	ax
		call	sub_258CD
		add	sp, 6
		mov	ax, 3050h
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		jmp	short loc_25893
; ---------------------------------------------------------------------------

loc_2588D:				; CODE XREF: sub_25834+74j
		cmp	[bp+var_8], 2
		jz	short loc_258AA

loc_25893:				; CODE XREF: sub_25834+57j
		push	[bp+var_2]
		push	[bp+var_4]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		mov	[bp+var_8], ax
		cmp	ax, 1
		jnz	short loc_2588D

loc_258AA:				; CODE XREF: sub_25834+5Dj
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_14A8E
		cmp	[bp+var_8], 1
		jnz	short loc_258C8
		mov	bx, word_475AA
		shl	bx, 1
		mov	ax, [bx+2F00h]
		mov	word_4B3C8, ax

loc_258C8:				; CODE XREF: sub_25834+85j
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_25834	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_258CD	proc near		; CODE XREF: sub_25834+41p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		push	di
		push	si
		cmp	[bp+arg_4], 18h
		jl	short loc_258E6
		mov	[bp+arg_4], 17h
		jmp	short loc_258F1
; ---------------------------------------------------------------------------

loc_258E6:				; CODE XREF: sub_258CD+10j
		cmp	[bp+arg_4], 0
		jge	short loc_258F1
		mov	[bp+arg_4], 0

loc_258F1:				; CODE XREF: sub_258CD+17j
					; sub_258CD+1Dj
		mov	bx, [bp+arg_4]
		shl	bx, 1
		shl	bx, 1
		mov	si, [bx+2F30h]
		mov	cx, [bx+2F32h]
		mov	bx, cx
		mov	di, si
		mov	si, 665Ch
		mov	es, bx
		assume es:nothing
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		mov	dx, ds
		push	es
		mov	es, dx
		assume es:dseg
		pop	ds
		shr	cx, 1
		repne movsw
		adc	cx, cx
		repne movsb
		mov	ds, dx
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_2596F
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 95Eh
		push	ax
		call	sub_15601
		mov	di, 665Ch
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		push	cx
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 95Eh
		push	ax
		call	sub_15BD2
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 95Eh
		push	ax
		call	sub_15C06
		jmp	short loc_25984
; ---------------------------------------------------------------------------

loc_2596F:				; CODE XREF: sub_258CD+5Fj
		mov	di, 665Ch
		mov	ax, ds
		mov	es, ax
		mov	cx, 0FFFFh
		xor	ax, ax
		repne scasb
		not	cx
		dec	cx
		mov	word_44010, cx

loc_25984:				; CODE XREF: sub_258CD+A0j
		mov	ax, [bp+arg_4]
		mov	word_475AA, ax
		pop	si
		pop	di
		pop	bp
		retn
sub_258CD	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2598E	proc far		; CODE XREF: sub_1FD8B+137P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	[bp+var_2], 0
		cmp	word_44648, 1
		jnz	short loc_259AA
		mov	ax, 1
		jmp	short loc_259AC
; ---------------------------------------------------------------------------

loc_259AA:				; CODE XREF: sub_2598E+15j
		sub	ax, ax

loc_259AC:				; CODE XREF: sub_2598E+1Aj
		mov	word_440EE, ax
		cmp	word_44648, 2
		jnz	short loc_259BB
		mov	ax, 1
		jmp	short loc_259BD
; ---------------------------------------------------------------------------

loc_259BB:				; CODE XREF: sub_2598E+26j
		sub	ax, ax

loc_259BD:				; CODE XREF: sub_2598E+2Bj
		mov	word_44106, ax
		mov	word_440BE, 0
		mov	ax, 315Eh
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx

loc_259D6:				; CODE XREF: sub_2598E+90j
		push	[bp+var_6]
		push	[bp+var_8]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		mov	[bp+var_4], ax
		cmp	ax, 9C0h
		jz	short loc_25A4D
		cmp	ax, 9C1h
		jz	short loc_25A20
		cmp	ax, 9C3h
		jnz	short loc_25A12
		cmp	[bp+var_2], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_2], ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, 9C3h
		push	ax
		call	sub_15BD2

loc_25A12:				; CODE XREF: sub_2598E+67j
					; sub_2598E+BDj ...
		cmp	[bp+var_4], 1
		jz	short loc_25A7A
		cmp	[bp+var_4], 2
		jz	short loc_25A7A
		jmp	short loc_259D6
; ---------------------------------------------------------------------------

loc_25A20:				; CODE XREF: sub_2598E+62j
		sub	ax, ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, 9C0h
		push	ax
		call	sub_15BD2
		mov	ax, 1
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, 9C1h
		push	ax
		call	sub_15BD2
		mov	word_44648, 1
		jmp	short loc_25A12
; ---------------------------------------------------------------------------

loc_25A4D:				; CODE XREF: sub_2598E+5Dj
		sub	ax, ax
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, 9C1h
		push	ax
		call	sub_15BD2
		mov	ax, 1
		push	ax
		push	[bp+var_6]
		push	[bp+var_8]
		mov	ax, 9C0h
		push	ax
		call	sub_15BD2
		mov	word_44648, 2
		jmp	short loc_25A12
; ---------------------------------------------------------------------------

loc_25A7A:				; CODE XREF: sub_2598E+88j
					; sub_2598E+8Ej
		push	[bp+var_6]
		push	[bp+var_8]
		call	sub_14A8E
		les	bx, [bp+arg_4]
		assume es:nothing
		mov	ax, [bp+var_2]
		mov	es:[bx], ax
		les	bx, [bp+arg_0]
		mov	ax, word_44648
		mov	es:[bx], ax
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf	8
sub_2598E	endp


; =============== S U B	R O U T	I N E =======================================


sub_25AA0	proc far		; CODE XREF: sub_1FD8B+161P
					; sub_255DA+22p
		xor	ax, ax
		call	__chkstk
		mov	ax, 3214h
		push	ds
		push	ax
		call	sub_15564
		mov	word_47642, ax
		mov	word_47644, dx
		retf
sub_25AA0	endp


; =============== S U B	R O U T	I N E =======================================


sub_25AB9	proc far		; CODE XREF: sub_1FD8B+184P
		xor	ax, ax
		call	__chkstk
		push	word_47644
		push	word_47642
		call	sub_14A8E
		retf
sub_25AB9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25ACE	proc far		; CODE XREF: sub_1C5B3:loc_1C60FP

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 0Eh
		call	__chkstk
		mov	ax, word_4E956
		mov	word_442E2, ax
		mov	[bp+var_E], ax
		mov	ax, word_490B6
		mov	word_442CA, ax
		mov	[bp+var_6], ax
		mov	ax, word_4DF5C
		mov	word_442B2, ax
		mov	[bp+var_4], ax
		mov	ax, word_4DF7E
		mov	word_4429A, ax
		mov	[bp+var_2], ax
		mov	ax, 3322h
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_C], ax
		mov	[bp+var_A], dx

loc_25B0D:				; CODE XREF: sub_25ACE+8Cj
		push	[bp+var_A]
		push	[bp+var_C]
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15632
		mov	[bp+var_8], ax
		cmp	ax, 0A24h
		jz	short loc_25B8A
		cmp	ax, 0A25h
		jz	short loc_25B73
		cmp	ax, 0A26h
		jz	short loc_25B5C
		cmp	ax, 0A27h
		jnz	short loc_25B4E
		cmp	[bp+var_E], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_E], ax
		push	ax
		push	[bp+var_A]
		push	[bp+var_C]
		mov	ax, 0A27h

loc_25B48:				; CODE XREF: sub_25ACE+A3j
					; sub_25ACE+BAj ...
		push	ax
		call	sub_15BD2

loc_25B4E:				; CODE XREF: sub_25ACE+63j
		cmp	[bp+var_8], 1
		jz	short loc_25BA1
		cmp	[bp+var_8], 2
		jz	short loc_25BA1
		jmp	short loc_25B0D
; ---------------------------------------------------------------------------

loc_25B5C:				; CODE XREF: sub_25ACE+5Ej
		cmp	[bp+var_6], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_A]
		push	[bp+var_C]
		mov	ax, 0A26h
		jmp	short loc_25B48
; ---------------------------------------------------------------------------

loc_25B73:				; CODE XREF: sub_25ACE+59j
		cmp	[bp+var_4], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_A]
		push	[bp+var_C]
		mov	ax, 0A25h
		jmp	short loc_25B48
; ---------------------------------------------------------------------------

loc_25B8A:				; CODE XREF: sub_25ACE+54j
		cmp	[bp+var_2], 1
		sbb	ax, ax
		neg	ax
		mov	[bp+var_2], ax
		push	ax
		push	[bp+var_A]
		push	[bp+var_C]
		mov	ax, 0A24h
		jmp	short loc_25B48
; ---------------------------------------------------------------------------

loc_25BA1:				; CODE XREF: sub_25ACE+84j
					; sub_25ACE+8Aj
		push	[bp+var_A]
		push	[bp+var_C]
		call	sub_14A8E
		cmp	[bp+var_8], 1
		jnz	short loc_25BCF
		mov	ax, [bp+var_E]
		mov	word_4E956, ax
		mov	ax, [bp+var_6]
		mov	word_490B6, ax
		mov	ax, [bp+var_4]
		mov	word_4DF5C, ax
		mov	ax, [bp+var_2]
		mov	word_4DF7E, ax
		call	sub_1A1F0

loc_25BCF:				; CODE XREF: sub_25ACE+E2j
		mov	sp, bp
		pop	bp
		retf
sub_25ACE	endp

; ---------------------------------------------------------------------------
		xor	ax, ax
		call	__chkstk
		mov	ax, 33A0h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25BE9	proc far		; CODE XREF: sub_1806F+34P

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		cmp	[bp+arg_0], 0
		jz	short loc_25BFF
		mov	ax, 3444h
		jmp	short loc_25C02
; ---------------------------------------------------------------------------

loc_25BFF:				; CODE XREF: sub_25BE9+Fj
		mov	ax, 3422h

loc_25C02:				; CODE XREF: sub_25BE9+14j
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_2], ax
		mov	sp, bp
		pop	bp
		retf	2
sub_25BE9	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25C16	proc far		; CODE XREF: sub_198ED:loc_199FFP

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 34AEh
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A4B
		mov	[bp+var_2], ax
		mov	sp, bp
		pop	bp
		retf
sub_25C16	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25C36	proc far		; CODE XREF: sub_1C5B3+B6P

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, 3518h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_14A6C
		mov	[bp+var_2], ax
		mov	sp, bp
		pop	bp
		retf
sub_25C36	endp


; =============== S U B	R O U T	I N E =======================================


sub_25C56	proc far		; CODE XREF: sub_287CF+ADp
		xor	ax, ax
		call	__chkstk
		mov	ax, 3552h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_25C56	endp


; =============== S U B	R O U T	I N E =======================================


sub_25C6C	proc far		; CODE XREF: sub_2B0C0+59p
					; sub_2BACC+59p
		xor	ax, ax
		call	__chkstk
		mov	ax, 358Ch
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_25C6C	endp


; =============== S U B	R O U T	I N E =======================================


sub_25C82	proc far		; CODE XREF: sub_1FD8B:loc_1FF2EP
		xor	ax, ax
		call	__chkstk
		mov	ax, 35C6h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_25C82	endp


; =============== S U B	R O U T	I N E =======================================


sub_25C98	proc far		; CODE XREF: sub_1FD8B+14P
		xor	ax, ax
		call	__chkstk
		mov	ax, 3600h
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_25C98	endp


; =============== S U B	R O U T	I N E =======================================


sub_25CAE	proc far		; CODE XREF: sub_1A1F0:loc_1A2F9P
		xor	ax, ax
		call	__chkstk
		mov	ax, 363Ah
		push	ds
		push	ax
		sub	ax, ax
		push	ax
		push	ax
		call	sub_15C37
		retf
sub_25CAE	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25CC4	proc far		; CODE XREF: sub_137E6:loc_13AB3P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, word_4DFA0
		inc	ax
		or	ah, 80h
		mov	word_439D6, ax
		mov	word_439D8, 0
		mov	ax, 2A2Eh
		push	ds
		push	ax
		call	sub_15564
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		call	sub_14C44

loc_25CF4:				; CODE XREF: sub_25CC4+4Ej
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 5E06h
		mov	dx, seg	seg001
		push	dx
		push	ax
		call	sub_15632
		mov	[bp+var_8], ax
		cmp	ax, 1
		jz	short loc_25D14
		cmp	ax, 2
		jnz	short loc_25CF4

loc_25D14:				; CODE XREF: sub_25CC4+49j
		call	sub_14D1E
		cmp	[bp+var_8], 1
		jnz	short loc_25D47
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, 1388h
		push	ax
		call	sub_154F5
		and	ah, 7Fh
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_25D3D
		mov	[bp+var_6], 1

loc_25D3D:				; CODE XREF: sub_25CC4+72j
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		call	sub_14185

loc_25D47:				; CODE XREF: sub_25CC4+59j
		push	[bp+var_2]
		push	[bp+var_4]
		call	sub_14A8E
		mov	sp, bp
		pop	bp
		retf
sub_25CC4	endp

; ---------------------------------------------------------------------------
		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		push	word_475AE
		push	word_475B4
		push	word_475B6
		call	sub_14C5A
		les	bx, [bp+0Ah]
		cmp	word ptr es:[bx], 3
		jnz	short loc_25DAC
		mov	al, es:[bx+2]
		sub	ah, ah
		mov	[bp-2],	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, 1388h
		push	ax
		call	sub_154F5
		mov	[bp-6],	ax
		and	ax, 8000h
		mov	[bp-4],	ax
		and	byte ptr [bp-5], 7Fh
		cmp	word ptr [bp-2], 0Dh
		jz	short loc_25DAC
		cmp	word ptr [bp-2], 1Bh
		jnz	short loc_25DB1

loc_25DAC:				; CODE XREF: seg001:5E29j seg001:5E54j ...
		sub	ax, ax
		jmp	loc_25E3E
; ---------------------------------------------------------------------------

loc_25DB1:				; CODE XREF: seg001:5E5Aj
		cmp	word ptr [bp-2], 8
		jz	short loc_25DBD
		cmp	word ptr [bp-2], 7Fh ; ''
		jnz	short loc_25DE7

loc_25DBD:				; CODE XREF: seg001:5E65j
		mov	cx, 0Ah
		mov	ax, [bp-6]
		sub	dx, dx
		div	cx
		mov	[bp-6],	ax

loc_25DCA:				; CODE XREF: seg001:5EBFj
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		mov	ax, 1388h
		push	ax
		call	sub_15BD2

loc_25DDA:				; CODE XREF: seg001:5EBDj
		les	bx, [bp+0Eh]
		mov	word ptr es:[bx], 0
		mov	ax, 1
		jmp	short loc_25E3E
; ---------------------------------------------------------------------------

loc_25DE7:				; CODE XREF: seg001:5E6Bj
		mov	bx, [bp-2]
		test	byte ptr [bx+5E27h], 4
		jz	short loc_25E11
		cmp	word ptr [bp-4], 0
		jz	short loc_25DFC
		mov	word ptr [bp-6], 0

loc_25DFC:				; CODE XREF: seg001:5EA5j
		mov	ax, 0Ah
		mul	word ptr [bp-6]
		add	ax, bx
		sub	ax, 30h	; '0'
		mov	[bp-6],	ax
		cmp	ax, 7D0h
		ja	short loc_25DDA
		jmp	short loc_25DCA
; ---------------------------------------------------------------------------

loc_25E11:				; CODE XREF: seg001:5E9Fj
		dec	word_46CA0
		js	short loc_25E2A
		mov	al, 7
		mov	bx, word_46C9C
		inc	word_46C9C
		mov	es, word_46C9E
		assume es:nothing
		mov	es:[bx], al
		jmp	short loc_25DAC
; ---------------------------------------------------------------------------

loc_25E2A:				; CODE XREF: seg001:5EC5j
		mov	ax, 5CBCh
		push	ds
		push	ax
		mov	ax, 7
		push	ax
		call	__flsbuf
		add	sp, 6
		jmp	loc_25DAC
; ---------------------------------------------------------------------------

loc_25E3E:				; CODE XREF: seg001:5E5Ej seg001:5E95j
		mov	sp, bp
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25E42	proc far		; CODE XREF: sub_25E42+88p
					; DATA XREF: dseg:off_439D2o

var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= byte ptr -20h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 24h	; '$'
		call	__chkstk
		les	bx, [bp+arg_6]
		assume es:nothing
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		les	bx, [bp+var_C]
		push	word ptr es:[bx+6]
		push	word ptr es:[bx+4]
		lea	ax, [bp+var_24]
		push	ss
		push	ax
		lea	ax, [bp+var_22]
		push	ss
		push	ax
		call	sub_1333C
		les	bx, [bp+var_C]
		mov	ax, es:[bx+8]
		add	ax, [bp+var_22]
		dec	ax
		mov	word_475B4, ax
		mov	ax, es:[bx+0Ch]
		add	ax, [bp+var_22]
		dec	ax
		mov	word_475B6, ax
		mov	ax, es:[bx+0Eh]
		add	ax, [bp+var_24]
		dec	ax
		dec	ax
		mov	word_475AE, ax
		mov	ax, [bp+arg_0]
		or	ax, ax
		jz	short loc_25EAF
		cmp	ax, 2
		jz	short loc_25F0C
		cmp	ax, 9
		jz	short loc_25F12
		jmp	short loc_25F0C
; ---------------------------------------------------------------------------

loc_25EAF:				; CODE XREF: sub_25E42+5Fj
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jnz	short loc_25EDB
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		mov	ax, 9
		push	ax
		push	cs
		call	near ptr sub_25E42
		add	sp, 0Ah
		les	bx, [bp+var_C]
		mov	ax, es:[bx+1Ch]
		mov	es:[bx+12h], ax

loc_25EDB:				; CODE XREF: sub_25E42+73j
		mov	ax, word ptr [bp+var_C]
		mov	dx, word ptr [bp+var_C+2]
		add	ax, 8
		push	dx
		push	ax
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		call	sub_321A6
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		push	[bp+var_24]
		mov	ax, [bp+var_22]
		dec	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		lea	ax, [bp+var_8]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_205C8

loc_25F0C:				; CODE XREF: sub_25E42+64j
					; sub_25E42+6Bj ...
		sub	ax, ax
		cwd
		jmp	loc_25FBF
; ---------------------------------------------------------------------------

loc_25F12:				; CODE XREF: sub_25E42+69j
		les	bx, [bp+var_C]
		test	byte ptr es:[bx+10h], 80h
		jnz	short loc_25F0C
		mov	ax, [bp+arg_2]
		mov	[bp+var_E], ax
		mov	ax, bx
		mov	dx, es
		add	ax, 8
		push	dx
		push	ax
		push	[bp+var_24]
		mov	ax, [bp+var_22]
		dec	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, word ptr [bp+var_C]
		mov	dx, word ptr [bp+var_C+2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		cmp	[bp+var_E], 0
		jz	short loc_25F9F
		mov	ax, [bp+var_E]
		and	ax, 8000h
		mov	[bp+var_10], ax
		and	byte ptr [bp+var_E+1], 7Fh
		mov	ax, 0Ah
		push	ax		; int
		lea	ax, [bp+var_20]
		push	ss
		push	ax		; char *
		push	[bp+var_E]	; int
		call	_itoa
		add	sp, 8
		nop
		push	cs
		call	near ptr sub_234BE
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_20114
		les	bx, [bp+var_C]
		mov	cx, es:[bx+0Eh]
		sub	cx, ax
		dec	cx
		dec	cx
		push	cx
		mov	ax, es:[bx+8]
		inc	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_20892
		lea	ax, [bp+var_20]
		push	ss
		push	ax
		nop
		push	cs
		call	near ptr sub_20152

loc_25F9F:				; CODE XREF: sub_25E42+10Aj
		mov	ax, word ptr [bp+var_C]
		mov	dx, word ptr [bp+var_C+2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp+var_24]
		neg	ax
		push	ax
		mov	ax, 1
		sub	ax, [bp+var_22]
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		jmp	loc_25F0C
; ---------------------------------------------------------------------------

loc_25FBF:				; CODE XREF: sub_25E42+CDj
		mov	sp, bp
		pop	bp
		retf
sub_25E42	endp

; ---------------------------------------------------------------------------

loc_25FC3:				; DATA XREF: dseg:2A22o
		push	bp
		mov	bp, sp
		mov	ax, 0Ch
		call	__chkstk
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		lea	ax, [bp-0Ch]
		push	ss
		push	ax
		lea	ax, [bp-0Ah]
		push	ss
		push	ax
		call	sub_1333C
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+0Ah]
		call	sub_15363
		mov	[bp-8],	ax
		mov	[bp-6],	dx
		or	dx, ax
		jz	short loc_26075
		push	word ptr [bp-6]
		push	ax
		call	sub_1B047
		les	bx, [bp-8]
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		add	ax, 8
		push	dx
		push	ax
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Ah]
		nop
		push	cs
		call	near ptr sub_208AA
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233D4
		mov	byte_490A6, 1
		mov	byte_490B0, 1
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr sub_233FE
		mov	ax, [bp-4]
		mov	dx, [bp-2]
		add	ax, 8
		push	dx
		push	ax
		mov	ax, [bp-0Ch]
		neg	ax
		push	ax
		mov	ax, [bp-0Ah]
		neg	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_208AA
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		call	sub_1B063

loc_26075:				; CODE XREF: seg001:60A9j
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================


sub_2607A	proc far		; CODE XREF: sub_14619:loc_146B3P
					; sub_1C5B3:loc_1C6CAP
		xor	ax, ax
		call	__chkstk
		mov	ax, word_4E940
		cmp	ax, 1
		jz	short loc_260B1
		cmp	ax, 2
		jnz	short loc_26091
		jmp	loc_26131
; ---------------------------------------------------------------------------

loc_26091:				; CODE XREF: sub_2607A+12j
		cmp	ax, 3
		jnz	short loc_26099
		jmp	loc_261A1
; ---------------------------------------------------------------------------

loc_26099:				; CODE XREF: sub_2607A+1Aj
		cmp	ax, 4
		jz	short loc_260D5
		cmp	ax, 5
		jnz	short loc_260A6
		jmp	loc_261A1
; ---------------------------------------------------------------------------

loc_260A6:				; CODE XREF: sub_2607A+27j
		cmp	ax, 6
		jnz	short loc_260AE
		jmp	loc_26131
; ---------------------------------------------------------------------------

loc_260AE:				; CODE XREF: sub_2607A+2Fj
		jmp	locret_26203
; ---------------------------------------------------------------------------

loc_260B1:				; CODE XREF: sub_2607A+Dj
		push	word_4DF90
		push	word_4DF8E	; void *
		nop
		push	cs
		call	near ptr sub_2AA92
		push	word ptr dword_4DBDA+2
		push	word ptr dword_4DBDA
		call	sub_26204
		mov	ax, 4

loc_260CC:				; CODE XREF: sub_2607A+B5j
		push	ax
		call	sub_1CDD7
		jmp	locret_26203
; ---------------------------------------------------------------------------

loc_260D5:				; CODE XREF: sub_2607A+22j
		push	word_4DF56
		push	word_4DF54
		nop
		push	cs
		call	near ptr sub_2AAF2
		push	ax		; size_t
		push	word_4DF56
		push	word_4DF54	; void *
		push	word_490A4
		push	word_490A2	; void *
		call	_memmove
		add	sp, 0Ah
		push	word ptr dword_4DF80+2
		push	word ptr dword_4DF80
		call	sub_26204
		push	word_490A4
		push	word_490A2
		nop
		push	cs
		call	near ptr sub_2AAF2
		push	ax		; size_t
		push	word_490A4
		push	word_490A2	; void *
		push	word_4DF56
		push	word_4DF54	; void *
		call	_memmove
		add	sp, 0Ah
		mov	ax, 1
		jmp	short loc_260CC
; ---------------------------------------------------------------------------

loc_26131:				; CODE XREF: sub_2607A+14j
					; sub_2607A+31j
		push	word_47646
		call	sub_14185
		call	sub_26A89
		push	word_47646
		push	word_47648
		call	sub_26624
		or	ax, ax
		jz	short loc_26150
		sub	ax, ax
		jmp	short loc_26196
; ---------------------------------------------------------------------------

loc_26150:				; CODE XREF: sub_2607A+D0j
		mov	ax, 80D8h
		push	ds
		push	ax
		mov	ax, 666Ah
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_230E6
		mov	ax, word_47646
		cmp	word_490AE, ax
		jl	short loc_26187
		mov	ax, word_47648
		sub	ax, word_47646
		inc	ax
		add	word_490AE, ax
		cmp	word_490AE, 7D0h
		jl	short loc_26187
		mov	word_490AE, 0FFFFh
		call	sub_1C919

loc_26187:				; CODE XREF: sub_2607A+ECj
					; sub_2607A+100j
		cmp	word_4E940, 2
		jnz	short loc_26193
		mov	ax, 5
		jmp	short loc_26196
; ---------------------------------------------------------------------------

loc_26193:				; CODE XREF: sub_2607A+112j
		mov	ax, 3

loc_26196:				; CODE XREF: sub_2607A+D4j
					; sub_2607A+117j ...
		push	ax
		call	sub_1CDD7
		call	sub_26AB0
		jmp	short locret_26203
; ---------------------------------------------------------------------------

loc_261A1:				; CODE XREF: sub_2607A+1Cj
					; sub_2607A+29j
		push	word_47646
		call	sub_14185
		call	sub_26A89
		push	word_47646
		push	word_47648
		call	sub_2656B
		mov	ax, 80D8h
		push	ds
		push	ax
		mov	ax, 666Ah
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_230E6
		mov	ax, word_47646
		cmp	word_490AE, ax
		jl	short loc_261F2
		mov	ax, word_47648
		cmp	word_490AE, ax
		jg	short loc_261E6
		mov	word_490AE, 0FFFFh
		call	sub_1C919
		jmp	short loc_261F2
; ---------------------------------------------------------------------------

loc_261E6:				; CODE XREF: sub_2607A+15Dj
		mov	ax, word_47648
		sub	ax, word_47646
		inc	ax
		sub	word_490AE, ax

loc_261F2:				; CODE XREF: sub_2607A+154j
					; sub_2607A+16Aj
		cmp	word_4E940, 3
		jnz	short loc_261FE
		mov	ax, 6
		jmp	short loc_26196
; ---------------------------------------------------------------------------

loc_261FE:				; CODE XREF: sub_2607A+17Dj
		mov	ax, 2
		jmp	short loc_26196
; ---------------------------------------------------------------------------

locret_26203:				; CODE XREF: sub_2607A:loc_260AEj
					; sub_2607A+58j ...
		retf
sub_2607A	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26204	proc near		; CODE XREF: sub_2607A+4Cp
					; sub_2607A+89p

arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		call	sub_1C985
		nop
		push	cs
		call	near ptr sub_232D3
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_2925A
		nop
		push	cs
		call	near ptr sub_232B2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		nop
		push	cs
		call	near ptr sub_2A9F9
		nop
		push	cs
		call	near ptr sub_2A016
		mov	ax, 1
		push	ax
		call	sub_1C985
		pop	bp
		retn	4
sub_26204	endp


; =============== S U B	R O U T	I N E =======================================


sub_2625F	proc far		; CODE XREF: sub_137E6+3EBP
					; sub_14619:loc_146C4P	...
		xor	ax, ax
		call	__chkstk
		mov	ax, word_490AE
		cmp	word_4DFA0, ax
		jnz	short loc_2627C
		mov	word_490AE, 0FFFFh
		call	sub_1C919
		jmp	short loc_26287
; ---------------------------------------------------------------------------

loc_2627C:				; CODE XREF: sub_2625F+Ej
		mov	ax, word_4DFA0
		mov	word_490AE, ax
		call	sub_1C893

loc_26287:				; CODE XREF: sub_2625F+1Bj
		call	sub_1408E
		retf
sub_2625F	endp


; =============== S U B	R O U T	I N E =======================================


sub_2628D	proc far		; CODE XREF: sub_14619:loc_146DFP
					; sub_1C5B3:loc_1C6DAP
		xor	ax, ax
		call	__chkstk
		call	sub_196F2
		nop
		push	cs
		call	near ptr sub_2329F
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jle	short loc_262AA
		mov	ax, word_490AE

loc_262AA:				; CODE XREF: sub_2628D+18j
		push	ax
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jge	short loc_262B7
		mov	ax, word_490AE

loc_262B7:				; CODE XREF: sub_2628D+25j
		push	ax
		call	sub_26818
		or	ax, ax
		jz	short loc_262D1
		cmp	word_4E940, 1
		jz	short loc_26302
		cmp	word_4E940, 4
		jz	short loc_26302
		sub	ax, ax
		jmp	short loc_262FC
; ---------------------------------------------------------------------------

loc_262D1:				; CODE XREF: sub_2628D+30j
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jle	short loc_262DD
		mov	ax, word_490AE

loc_262DD:				; CODE XREF: sub_2628D+4Bj
		mov	word_47646, ax
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jge	short loc_262EC
		mov	ax, word_490AE

loc_262EC:				; CODE XREF: sub_2628D+5Aj
		mov	word_47648, ax
		mov	ax, word_490B8
		mov	word_4764A, ax
		push	cs
		call	near ptr sub_2645E
		mov	ax, 2

loc_262FC:				; CODE XREF: sub_2628D+42j
		push	ax
		call	sub_1CDD7

loc_26302:				; CODE XREF: sub_2628D+37j
					; sub_2628D+3Ej
		nop
		push	cs
		call	near ptr sub_23285
		retf
sub_2628D	endp


; =============== S U B	R O U T	I N E =======================================


sub_26308	proc far		; CODE XREF: sub_14619:loc_146FAP
					; sub_1C5B3:loc_1C6E2P
		xor	ax, ax
		call	__chkstk
		call	sub_196F2
		nop
		push	cs
		call	near ptr sub_2329F
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jle	short loc_26325
		mov	ax, word_490AE

loc_26325:				; CODE XREF: sub_26308+18j
		push	ax
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jge	short loc_26332
		mov	ax, word_490AE

loc_26332:				; CODE XREF: sub_26308+25j
		push	ax
		call	sub_26818
		cmp	word_4E940, 1
		jz	short loc_2634C
		cmp	word_4E940, 4
		jz	short loc_2634C
		sub	ax, ax
		push	ax
		call	sub_1CDD7

loc_2634C:				; CODE XREF: sub_26308+33j
					; sub_26308+3Aj
		nop
		push	cs
		call	near ptr sub_23285
		retf
sub_26308	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26352	proc far		; CODE XREF: sub_14619:loc_14715P
					; sub_1C5B3:loc_1C6EAP

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 6
		call	__chkstk
		call	sub_196F2
		nop
		push	cs
		call	near ptr sub_2329F
		mov	ax, word_4DFA0
		add	ax, word_4B488
		cmp	ax, 7D0h
		jle	short loc_26376
		mov	ax, 7D0h

loc_26376:				; CODE XREF: sub_26352+1Fj
		dec	ax
		mov	[bp+var_2], ax
		sub	ax, word_4DFA0
		inc	ax
		mov	[bp+var_4], ax
		mov	ax, 7D0h
		sub	ax, [bp+var_4]
		mov	[bp+var_6], ax
		jmp	short loc_263B2
; ---------------------------------------------------------------------------

loc_2638D:				; CODE XREF: sub_26352+65j
					; sub_26352+95j
		call	sub_26A89
		mov	word_4B39E, 1
		push	word_4DFA0
		push	[bp+var_2]
		call	sub_26624
		or	ax, ax
		jz	short loc_263EB
		sub	ax, ax
		push	ax
		call	sub_1CDD7
		jmp	loc_26457
; ---------------------------------------------------------------------------

loc_263AF:				; CODE XREF: sub_26352+7Fj
		inc	[bp+var_6]

loc_263B2:				; CODE XREF: sub_26352+39j
		cmp	[bp+var_6], 7D0h
		jnb	short loc_2638D
		mov	bx, [bp+var_6]
		shl	bx, 1
		shl	bx, 1
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		cmp	[bx-5B54h], ax
		jnz	short loc_263D3
		cmp	[bx-5B52h], dx
		jz	short loc_263AF

loc_263D3:				; CODE XREF: sub_26352+79j
		nop
		push	cs
		call	near ptr sub_23285
		mov	ax, 7D0h
		sub	ax, [bp+var_6]
		push	ax
		nop
		push	cs
		call	near ptr sub_2528A
		cmp	ax, 2
		jnz	short loc_2638D
		jmp	short loc_2645A
; ---------------------------------------------------------------------------

loc_263EB:				; CODE XREF: sub_26352+50j
		mov	ax, word_4DFA0
		mov	word_47646, ax
		mov	ax, [bp+var_2]
		mov	word_47648, ax
		mov	ax, word_490B8
		mov	word_4764A, ax
		mov	ax, 3
		push	ax
		call	sub_1CDD7
		mov	ax, word_4DFA0
		cmp	word_490B8, ax
		jge	short loc_2641F
		cmp	word_4B396, 0
		jl	short loc_26426
		add	ax, word_4B396
		mov	word_490B8, ax
		jmp	short loc_26426
; ---------------------------------------------------------------------------

loc_2641F:				; CODE XREF: sub_26352+BBj
		mov	ax, [bp+var_4]
		add	word_490B8, ax

loc_26426:				; CODE XREF: sub_26352+C2j
					; sub_26352+CBj
		cmp	word_490B8, 7D0h
		jl	short loc_26434
		mov	word_490B8, 7CFh

loc_26434:				; CODE XREF: sub_26352+DAj
		mov	ax, word_4DFA0
		cmp	word_490AE, ax
		jl	short loc_26457
		mov	ax, [bp+var_4]
		add	word_490AE, ax
		cmp	word_490AE, 7D0h
		jl	short loc_26457
		mov	word_490AE, 0FFFFh
		call	sub_1C919

loc_26457:				; CODE XREF: sub_26352+5Aj
					; sub_26352+E9j ...
		call	sub_26AB0

loc_2645A:				; CODE XREF: sub_26352+97j
		mov	sp, bp
		pop	bp
		retf
sub_26352	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2645E	proc far		; CODE XREF: sub_1C5B3:loc_1C704P
					; sub_2628D+69p

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jle	short loc_26475
		mov	ax, word_490AE

loc_26475:				; CODE XREF: sub_2645E+12j
		mov	[bp+var_4], ax
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jge	short loc_26484
		mov	ax, word_490AE

loc_26484:				; CODE XREF: sub_2645E+21j
		mov	[bp+var_2], ax
		call	sub_196F2
		call	sub_26A89
		mov	word_4B39E, 1
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_2656B
		mov	ax, [bp+var_4]
		mov	word_4DFA0, ax
		mov	word_490AE, 0FFFFh
		call	sub_1C919
		mov	ax, word_490B8
		cmp	[bp+var_4], ax
		jg	short loc_264D0
		cmp	[bp+var_2], ax
		jl	short loc_264C5
		mov	ax, [bp+var_4]
		dec	ax
		mov	word_490B8, ax
		jmp	short loc_264D0
; ---------------------------------------------------------------------------

loc_264C5:				; CODE XREF: sub_2645E+5Cj
		mov	ax, [bp+var_2]
		sub	ax, [bp+var_4]
		inc	ax
		sub	word_490B8, ax

loc_264D0:				; CODE XREF: sub_2645E+57j
					; sub_2645E+65j
		call	sub_26AB0
		mov	sp, bp
		pop	bp
		retf
sub_2645E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_264D7	proc far		; CODE XREF: sub_1C5B3:loc_1C71EP

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 4
		call	__chkstk
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jle	short loc_264EE
		mov	ax, word_490AE

loc_264EE:				; CODE XREF: sub_264D7+12j
		mov	[bp+var_4], ax
		mov	ax, word_4DFA0
		cmp	ax, word_490AE
		jge	short loc_264FD
		mov	ax, word_490AE

loc_264FD:				; CODE XREF: sub_264D7+21j
		mov	[bp+var_2], ax
		call	sub_196F2
		call	sub_26A89
		mov	word_4B39E, 1
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr sub_265F3
		mov	ax, word_490B8
		cmp	[bp+var_4], ax
		jg	short loc_2652C
		cmp	[bp+var_2], ax
		jl	short loc_2652C
		mov	ax, [bp+var_4]
		dec	ax
		mov	word_490B8, ax

loc_2652C:				; CODE XREF: sub_264D7+47j
					; sub_264D7+4Cj
		call	sub_26AB0
		mov	sp, bp
		pop	bp
		retf
sub_264D7	endp


; =============== S U B	R O U T	I N E =======================================


sub_26533	proc far		; CODE XREF: sub_1C5B3+23CP
		xor	ax, ax
		call	__chkstk
		push	si
		sub	ax, ax
		push	ax
		call	sub_1C9A8
		mov	bx, word_4879A
		mov	si, bx
		cmp	word ptr [si+4], 1
		sbb	ax, ax
		neg	ax
		mov	[bx+4],	ax
		or	ax, ax
		jz	short loc_26560
		mov	bx, word_4879A
		mov	word ptr [bx], 1

loc_26560:				; CODE XREF: sub_26533+23j
		mov	ax, 1
		push	ax
		call	sub_1C9A8
		pop	si
		retf
sub_26533	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2656B	proc near		; CODE XREF: sub_2607A+13Bp
					; sub_2645E+3Dp ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 8
		call	__chkstk
		mov	ax, 7CFh
		sub	ax, [bp+arg_0]
		mov	[bp+var_4], ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_265F3
		mov	ax, [bp+var_4]
		shl	ax, 1
		shl	ax, 1
		push	ax		; size_t
		mov	ax, [bp+arg_0]
		shl	ax, 1
		shl	ax, 1
		add	ax, 0A4B0h
		push	ds
		push	ax		; void *
		mov	ax, [bp+arg_2]
		shl	ax, 1
		shl	ax, 1
		add	ax, 0A4ACh
		push	ds
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_4]
		mov	[bp+var_2], ax
		cmp	ax, 7D0h
		jge	short loc_265ED
		shl	ax, 1
		shl	ax, 1
		add	ax, 0A4ACh
		mov	[bp+var_6], ax
		mov	ax, 7D0h
		sub	ax, [bp+var_2]
		mov	[bp+var_8], ax
		add	[bp+var_2], ax

loc_265D5:				; CODE XREF: sub_2656B+80j
		mov	bx, [bp+var_6]
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		mov	[bx], ax
		mov	[bx+2],	dx
		add	[bp+var_6], 4
		dec	[bp+var_8]
		jnz	short loc_265D5

loc_265ED:				; CODE XREF: sub_2656B+52j
		mov	sp, bp
		pop	bp
		retn	4
sub_2656B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_265F3	proc far		; CODE XREF: sub_181DF+1BP
					; sub_264D7+3Ep ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		jmp	short loc_26611
; ---------------------------------------------------------------------------

loc_26606:				; CODE XREF: sub_265F3+24j
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr sub_2AC10
		inc	[bp+var_2]

loc_26611:				; CODE XREF: sub_265F3+11j
		mov	ax, [bp+arg_0]
		cmp	[bp+var_2], ax
		jle	short loc_26606
		call	sub_1AE92
		mov	sp, bp
		pop	bp
		retf	4
sub_265F3	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26624	proc near		; CODE XREF: sub_2607A+CBp
					; sub_26352+4Bp

var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 24h	; '$'
		call	__chkstk
		push	si
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_26D6D
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_0]
		add	ax, 7CFh
		mov	[bp+var_1A], ax
		jmp	short loc_26655
; ---------------------------------------------------------------------------

loc_2664A:				; CODE XREF: sub_26624+36j
		push	[bp+var_1A]
		nop
		push	cs
		call	near ptr sub_2AC10
		inc	[bp+var_1A]

loc_26655:				; CODE XREF: sub_26624+24j
		cmp	[bp+var_1A], 7D0h
		jb	short loc_2664A
		mov	ax, 7CFh
		sub	ax, [bp+arg_0]
		shl	ax, 1
		shl	ax, 1
		push	ax		; size_t
		mov	ax, [bp+arg_2]
		shl	ax, 1
		shl	ax, 1
		add	ax, 0A4ACh
		push	ds
		push	ax		; void *
		mov	ax, [bp+arg_0]
		shl	ax, 1
		shl	ax, 1
		add	ax, 0A4B0h
		push	ds
		push	ax		; void *
		call	_memmove
		add	sp, 0Ah
		mov	ax, [bp+arg_2]
		mov	[bp+var_1A], ax
		cmp	[bp+arg_0], ax
		jb	short loc_266C1
		shl	ax, 1
		shl	ax, 1
		add	ax, 0A4ACh
		mov	[bp+var_22], ax
		mov	ax, [bp+arg_0]
		sub	ax, [bp+var_1A]
		inc	ax
		mov	[bp+var_24], ax
		add	[bp+var_1A], ax

loc_266A9:				; CODE XREF: sub_26624+9Bj
		mov	bx, [bp+var_22]
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		mov	[bx], ax
		mov	[bx+2],	dx
		add	[bp+var_22], 4
		dec	[bp+var_24]
		jnz	short loc_266A9

loc_266C1:				; CODE XREF: sub_26624+6Cj
		mov	[bp+var_1A], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_1C], ax
		jmp	short loc_26744
; ---------------------------------------------------------------------------

loc_266CE:				; CODE XREF: sub_26624+184j
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		call	sub_1B063
		mov	bx, [bp+var_1C]
		shl	bx, 1
		shl	bx, 1
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		mov	[bx-5B54h], ax
		mov	[bx-5B52h], dx

loc_266EF:				; CODE XREF: sub_26624+FCj
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_2656B
		nop
		push	cs
		call	near ptr sub_251E6
		mov	ax, 0FFFFh
		jmp	loc_26811
; ---------------------------------------------------------------------------

loc_26703:				; CODE XREF: sub_26624+14Dj
		mov	bx, [bp+var_1C]
		shl	bx, 1
		shl	bx, 1
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		mov	[bx-5B54h], ax
		mov	[bx-5B52h], dx

loc_26719:				; CODE XREF: sub_26624+1E8j
		nop
		push	cs
		call	near ptr sub_278A3
		or	ax, ax
		jz	short loc_266EF
		push	cs
		call	near ptr sub_26AF5
		or	ax, ax
		jz	short loc_2673E
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_2656B
		nop
		push	cs
		call	near ptr sub_23285
		mov	ax, 1
		jmp	loc_26811
; ---------------------------------------------------------------------------

loc_2673E:				; CODE XREF: sub_26624+104j
		inc	[bp+var_1A]
		inc	[bp+var_1C]

loc_26744:				; CODE XREF: sub_26624+A8j
		mov	ax, [bp+var_1C]
		cmp	[bp+arg_0], ax
		jnb	short loc_2674F
		jmp	loc_2680F
; ---------------------------------------------------------------------------

loc_2674F:				; CODE XREF: sub_26624+126j
		mov	bx, [bp+var_1A]
		shl	bx, 1
		shl	bx, 1
		les	si, dword_4E93A
		mov	ax, es:[bx+si]
		mov	dx, es:[bx+si+2]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		cmp	ax, word ptr dword_4E932
		jnz	short loc_26773
		cmp	dx, word ptr dword_4E932+2
		jz	short loc_26703

loc_26773:				; CODE XREF: sub_26624+147j
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		call	sub_1B047
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_2AAF2
		mov	[bp+var_6], ax
		lea	ax, [bp+var_18]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_267AB
		jmp	loc_266CE
; ---------------------------------------------------------------------------

loc_267AB:				; CODE XREF: sub_26624+182j
		push	[bp+var_6]
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		call	sub_1B209
		mov	bx, [bp+var_1C]
		shl	bx, 1
		shl	bx, 1
		mov	[bx-5B54h], ax
		mov	[bx-5B52h], dx
		mov	word ptr [bp+var_20], ax
		mov	word ptr [bp+var_20+2],	dx
		call	sub_1B0CF
		push	[bp+var_6]	; size_t
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		les	bx, [bp+var_20]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		call	_memmove
		add	sp, 0Ah
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		call	sub_1B063
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		call	sub_1B063
		jmp	loc_26719
; ---------------------------------------------------------------------------

loc_2680F:				; CODE XREF: sub_26624+128j
		sub	ax, ax

loc_26811:				; CODE XREF: sub_26624+DCj
					; sub_26624+117j
		pop	si
		mov	sp, bp
		pop	bp
		retn	4
sub_26624	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26818	proc near		; CODE XREF: sub_2628D+2Bp
					; sub_26308+2Bp

var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 20h	; ' '
		call	__chkstk
		push	si
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_26D6D
		push	cs
		call	near ptr sub_26A01
		mov	ax, [bp+arg_0]
		sub	ax, [bp+arg_2]
		inc	ax
		mov	word_4B488, ax
		lea	ax, [bp+var_18]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_2689B
		mov	ax, word_4B488
		shl	ax, 1
		shl	ax, 1
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 0C0h ; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_483F0, ax
		mov	word ptr dword_483F0+2,	dx
		call	sub_1B0CF
		les	bx, dword_483F0
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	word ptr dword_4E93A, ax
		mov	word ptr dword_4E93A+2,	dx
		mov	ax, word_490B8
		cmp	[bp+arg_2], ax
		jle	short loc_268B5
		mov	word_4B396, 0FFFFh
		jmp	short loc_268C6
; ---------------------------------------------------------------------------

loc_2689B:				; CODE XREF: sub_26818+3Cj
		sub	ax, ax
		mov	word ptr dword_483F0+2,	ax
		mov	word ptr dword_483F0, ax

loc_268A3:				; CODE XREF: sub_26818+C9j
		mov	word_4B488, ax
		push	cs
		call	near ptr sub_26A01
		nop
		push	cs
		call	near ptr sub_251E6
		mov	ax, 0FFFFh
		jmp	loc_269FA
; ---------------------------------------------------------------------------

loc_268B5:				; CODE XREF: sub_26818+79j
		mov	ax, word_490B8
		cmp	[bp+arg_0], ax
		jge	short loc_268C0
		mov	ax, [bp+arg_0]

loc_268C0:				; CODE XREF: sub_26818+A3j
		sub	ax, [bp+arg_2]
		mov	word_4B396, ax

loc_268C6:				; CODE XREF: sub_26818+81j
		mov	ax, [bp+arg_2]
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], 0
		jmp	short loc_26928
; ---------------------------------------------------------------------------

loc_268D3:				; CODE XREF: sub_26818+171j
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		call	sub_1B063

loc_268DE:				; CODE XREF: sub_26818+EBj
		mov	ax, [bp+var_1C]
		jmp	short loc_268A3
; ---------------------------------------------------------------------------

loc_268E3:				; CODE XREF: sub_26818+13Aj
		mov	bx, [bp+var_1C]
		shl	bx, 1
		shl	bx, 1
		les	si, dword_4E93A
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		mov	es:[bx+si], ax
		mov	es:[bx+si+2], dx

loc_268FC:				; CODE XREF: sub_26818+1D8j
		nop
		push	cs
		call	near ptr sub_278A3
		or	ax, ax
		jz	short loc_268DE
		push	cs
		call	near ptr sub_26AF5
		or	ax, ax
		jz	short loc_26922
		mov	ax, [bp+var_1C]
		mov	word_4B488, ax
		push	cs
		call	near ptr sub_26A01
		nop
		push	cs
		call	near ptr sub_23285
		mov	ax, 1
		jmp	loc_269FA
; ---------------------------------------------------------------------------

loc_26922:				; CODE XREF: sub_26818+F3j
		inc	[bp+var_1A]
		inc	[bp+var_1C]

loc_26928:				; CODE XREF: sub_26818+B9j
		mov	ax, [bp+arg_0]
		cmp	[bp+var_1A], ax
		jbe	short loc_26933
		jmp	loc_269F3
; ---------------------------------------------------------------------------

loc_26933:				; CODE XREF: sub_26818+116j
		mov	bx, [bp+var_1A]
		shl	bx, 1
		shl	bx, 1
		mov	ax, [bx-5B54h]
		mov	dx, [bx-5B52h]
		mov	word ptr [bp+var_20], ax
		mov	word ptr [bp+var_20+2],	dx
		cmp	ax, word ptr dword_4E932
		jnz	short loc_26954
		cmp	dx, word ptr dword_4E932+2
		jz	short loc_268E3

loc_26954:				; CODE XREF: sub_26818+134j
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		call	sub_1B047
		les	bx, [bp+var_20]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr sub_2AAF2
		mov	[bp+var_6], ax
		lea	ax, [bp+var_18]
		push	ss
		push	ax
		call	sub_1B07F
		push	dx
		push	ax
		call	_setjmp
		add	sp, 4
		or	ax, ax
		jz	short loc_2698C
		jmp	loc_268D3
; ---------------------------------------------------------------------------

loc_2698C:				; CODE XREF: sub_26818+16Fj
		push	[bp+var_6]
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		call	sub_1B209
		mov	bx, [bp+var_1C]
		shl	bx, 1
		shl	bx, 1
		les	si, dword_4E93A
		mov	es:[bx+si], ax
		mov	es:[bx+si+2], dx
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		call	sub_1B0CF
		push	[bp+var_6]	; size_t
		les	bx, [bp+var_20]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		les	bx, [bp+var_4]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx] ; void	*
		call	_memmove
		add	sp, 0Ah
		push	word ptr [bp+var_20+2]
		push	word ptr [bp+var_20]
		call	sub_1B063
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		call	sub_1B063
		jmp	loc_268FC
; ---------------------------------------------------------------------------

loc_269F3:				; CODE XREF: sub_26818+118j
		call	sub_1C8BF
		sub	ax, ax

loc_269FA:				; CODE XREF: sub_26818+9Aj
					; sub_26818+107j
		pop	si
		mov	sp, bp
		pop	bp
		retn	4
sub_26818	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26A01	proc far		; CODE XREF: sub_1806F+5EP
					; sub_180E4+42P ...

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		push	si
		mov	[bp+var_2], 0
		jmp	short loc_26A4B
; ---------------------------------------------------------------------------

loc_26A14:				; CODE XREF: sub_26A01+50j
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		les	si, dword_4E93A
		mov	ax, word ptr dword_4E932
		mov	dx, word ptr dword_4E932+2
		cmp	es:[bx+si], ax
		jnz	short loc_26A31
		cmp	es:[bx+si+2], dx
		jz	short loc_26A48

loc_26A31:				; CODE XREF: sub_26A01+28j
		mov	bx, [bp+var_2]
		shl	bx, 1
		shl	bx, 1
		mov	si, word ptr dword_4E93A
		push	word ptr es:[bx+si+2]
		push	word ptr es:[bx+si]
		call	sub_1AEAD

loc_26A48:				; CODE XREF: sub_26A01+2Ej
		inc	[bp+var_2]

loc_26A4B:				; CODE XREF: sub_26A01+11j
		mov	ax, word_4B488
		cmp	[bp+var_2], ax
		jl	short loc_26A14
		mov	ax, word ptr dword_483F0
		or	ax, word ptr dword_483F0+2
		jz	short loc_26A69
		push	word ptr dword_483F0+2
		push	word ptr dword_483F0
		call	sub_1AEAD

loc_26A69:				; CODE XREF: sub_26A01+59j
		sub	ax, ax
		mov	word ptr dword_483F0+2,	ax
		mov	word ptr dword_483F0, ax
		mov	word_4B488, ax
		mov	word_4B396, 0FFFFh
		call	sub_1C945
		call	sub_1AE92
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_26A01	endp


; =============== S U B	R O U T	I N E =======================================


sub_26A89	proc near		; CODE XREF: sub_2607A+C0p
					; sub_2607A+130p ...
		xor	ax, ax
		call	__chkstk
		sub	ax, ax
		push	ax
		call	sub_1C985
		nop
		push	cs
		call	near ptr sub_2A28A
		nop
		push	cs
		call	near ptr sub_2329F
		push	word_490A4
		push	word_490A2	; void *
		nop
		push	cs
		call	near ptr sub_2AA92
		retn
sub_26A89	endp


; =============== S U B	R O U T	I N E =======================================


sub_26AB0	proc near		; CODE XREF: sub_2607A+122p
					; sub_26352:loc_26457p	...
		xor	ax, ax
		call	__chkstk
		nop
		push	cs
		call	near ptr sub_232D3
		push	word ptr dword_48796+2
		push	word ptr dword_48796
		mov	bx, word_4DFA0
		shl	bx, 1
		shl	bx, 1
		push	word ptr [bx-5B52h]
		push	word ptr [bx-5B54h]
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_2925A
		nop
		push	cs
		call	near ptr sub_2345E
		call	sub_1408E
		nop
		push	cs
		call	near ptr sub_2A016
		mov	ax, 1
		push	ax
		call	sub_1C985
		retn
sub_26AB0	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26AF5	proc far		; CODE XREF: sub_185CA+24EP
					; sub_26624+FFp ...

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		mov	ax, 2
		call	__chkstk
		mov	ax, word_4E946
		mov	[bp+var_2], ax
		mov	word_4E946, 0
		or	ax, ax
		jnz	short loc_26B3A
		mov	ax, 8
		push	ax
		mov	ax, 80A4h
		push	ds
		push	ax
		nop
		push	cs
		call	near ptr sub_26E7B
		or	ax, ax
		jz	short loc_26B2E
		cmp	byte_49086, 1Bh
		jnz	short loc_26B2E
		mov	ax, 1
		jmp	short loc_26B3D
; ---------------------------------------------------------------------------

loc_26B2E:				; CODE XREF: sub_26AF5+2Bj
					; sub_26AF5+32j
		mov	ax, 0FFFFh
		push	ax
		sub	ax, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_26D6D

loc_26B3A:				; CODE XREF: sub_26AF5+19j
		mov	ax, [bp+var_2]

loc_26B3D:				; CODE XREF: sub_26AF5+37j
		mov	sp, bp
		pop	bp
		retf
sub_26AF5	endp

; ---------------------------------------------------------------------------
		align 2

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26B42	proc far		; CODE XREF: sub_23E78+24p

var_16		= byte ptr -16h
var_14		= byte ptr -14h
var_12		= byte ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 1Ah
		call	__chkstk
		push	di
		cmp	word_4464A, 0
		jz	short loc_26B5E
		mov	word_490A0, 601h
		jmp	loc_26C68
; ---------------------------------------------------------------------------

loc_26B5E:				; CODE XREF: sub_26B42+11j
		mov	ax, 1E0h
		push	ax
		mov	al, byte_4DF88
		sub	ah, ah
		push	ax
		mov	ax, 80h	; '�'
		push	ax
		call	sub_1B209
		mov	word ptr dword_47650, ax
		mov	word ptr dword_47650+2,	dx
		cmp	word_490A0, 0
		jz	short loc_26B88
		mov	word_490A0, 607h
		jmp	loc_26C68
; ---------------------------------------------------------------------------

loc_26B88:				; CODE XREF: sub_26B42+3Bj
		mov	[bp+var_E], 0
		lea	ax, [bp+var_E]
		push	ss
		push	ax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		lea	ax, [bp+var_14]
		push	ss
		push	ax
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		call	sub_275F8
		cmp	[bp+var_E], 0
		jnz	short loc_26BB3
		mov	word_490A0, 6FFh
		jmp	loc_26C68
; ---------------------------------------------------------------------------

loc_26BB3:				; CODE XREF: sub_26B42+66j
		push	cs
		call	near ptr sub_27099
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_26F94
		sub	ax, ax
		cwd
		mov	word ptr dword_4765E, ax
		mov	word ptr dword_4765E+2,	dx
		mov	word ptr dword_47656, ax
		mov	word ptr dword_47656+2,	dx
		les	bx, dword_47650
		mov	ax, es:[bx]
		mov	dx, es:[bx+2]
		mov	[bp+var_8], ax
		mov	[bp+var_6], dx
		add	ax, 1C8h
		mov	word ptr [bp+var_C], ax
		mov	word ptr [bp+var_C+2], dx
		mov	ax, [bp+var_8]
		mov	word ptr dword_4765A, ax
		mov	word ptr dword_4765A+2,	dx
		les	bx, [bp+var_C]
		sub	ax, ax
		mov	es:[bx+12h], ax
		mov	es:[bx+10h], ax
		mov	ax, [bp+var_8]
		mov	dx, [bp+var_6]
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		jmp	short loc_26C2D
; ---------------------------------------------------------------------------

loc_26C17:				; CODE XREF: sub_26B42+F4j
		les	bx, [bp+var_4]
		mov	ax, bx
		mov	dx, es

		push	ds