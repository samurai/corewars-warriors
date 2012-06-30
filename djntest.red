;redcode-94
;name djntest
;author samurai@psych0tik.net
;strategy testing djn's
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


; just need a place to do a bit of testing with this

	org main


imp:	mov 0,1
blast:	mov imp, @main
	spl @main
	jmp main
main	djn blast, #3
	mov 0, 1
