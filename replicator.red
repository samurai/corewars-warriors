;redcode-94
;name replicator-basic
;author samurai@psych0tik.net
;strategy basic replicator for testing ideas
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000

		org copier

done:		dat #0, #8
copyfrom:	dat #0, #0
copyto:		dat #0, #55

copier:		mov copier + copyfrom, @copyto
		add #1, copyfrom
		add #1, copyto
		sne @done, @copyfrom
		jmp xferdone
		jmp copier

reset:		dat #0, #0
xferdone:	add #1, #1
		spl copyto
		add #55, copyto
		mov reset, copyfrom
		jmp copier
