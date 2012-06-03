;redcode-94
;name canary v0.1
;author samurai@psych0tik.net
;strategy This is a hybrid of a bomber and a scanner, that will use faux-imps as the bombs
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


	org main
done:		dat #0, #50		; stores the number of bombs we should drop
reset2:		dat #0, #0		; used to 0 out bombcount
reset:		dat #0, #500		; used to reset lastbomb 
canary:		dat #441, #223		; just something unique we can use to test if memory is modified
lastbomb:	dat #0, #500		; place to store offset for bomb dropping
bombcount:	dat #0, #0		; total bombs dropped
addcount:	dat #0, #0

main:		spl planb  		; start out here, split to our immediate back up plan
bomber:		mov canary, @lastbomb 	; this is where the main bot's work begins, we copy the canary to our bomb location
		add #100, lastbomb	
		add.ab #1, bombcount
		seq bombcount, done	; we've got to stop before we hit a certain number of bombs to avoid hitting ourself 
		jmp bomber		; if we havent dropped enough bombs, keep going
		mov reset, lastbomb	; otherwise we contine by reseting vars
		mov reset2, bombcount
		add #13, addcount	; then we adjust the targetting offset to hit new spaces
		add addcount, lastbomb	; apply it
		jmp bomber		; and start over with a new set of bombs to drop

imp:		mov 0, 1		; imp?
planb:		mov reset, 150 		; just incase someone hits the core bot early on, spin a cheap backup option
		mov imp, 150	
		jmp 149
