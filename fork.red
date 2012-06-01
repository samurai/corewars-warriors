;redcode-94
;name forker
;author samurai@psych0tik.net
;strategy like the splitter, but just 2
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


	org start

imp:		mov 0, 1

start:		mov imp, 2500
		spl 2499
		mov imp, 5000
		spl 4999

halt:		dat #0, #0

