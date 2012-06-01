;redcode-94
;name scanner-basic
;author samurai@psych0tik.net
;strategy extremely basic scanner built to have a scanner
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


	org main

blankmem:	dat #0, #0

tracker:	dat #0, #0

main:		add #15, tracker
		seq.f blankmem, @tracker
		mov blankmem, @tracker
		jmp main
