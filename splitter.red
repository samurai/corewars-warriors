;redcode-94
;name splitter-basic
;author samurai@psych0tik.net
;strategy basic forat of a splitter to see how it looks
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


		org main


done:		dat #0, #5
bigcount:	dat #0, #0
counter: 	dat #0, #500

imp:		mov 0, 1

main:		mov imp, @counter
		spl @counter-1
		add #800, counter
		add #1, bigcount
		seq @done, @bigcount
		jmp main
