;redcode-94
;name impspiral v0.1
;author samurai@psych0tik.net
;strategy impspiral based on the canary bomber
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


	org main
done:		dat #0, #50
reset2:		dat #0, #0
reset:		dat #0, #500
imp:		mov 0, 1
canary:		dat #441, #223	; just something unique we can use to test if memory is modified
lastbomb:	dat #0, #500	; place to store offset for bomb dropping
bombcount:	dat #0, #0	; total bombs dropped
addcount:	dat #0, #0

main:		spl planb
bomber:		mov imp, @lastbomb
		spl @lastbomb-1
		add #1000, lastbomb
		add.ab #1, bombcount
		seq bombcount, done
		jmp bomber
		mov reset, lastbomb
		mov reset2, bombcount
		add #100, addcount
		add addcount, lastbomb
		jmp bomber

planb:		mov reset, 150
		mov imp, 150	; just incase someone hits the core bot early on, spin a cheap backup option
;		jmp 149
