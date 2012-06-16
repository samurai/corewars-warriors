;redcode-94
;name canary v0.1
;author samurai@psych0tik.net
;strategy This is a hybrid of a bomber and a scanner, that will use faux-imps as the bombs
;strategy (written in ICWS'94)
;strategy Submitted: @date@

; ideas/concepts for this bot 
; * immediately fork off to an imp placed somewhere down the line. just incase we get tanked before
; we get going, we've got a stalemate backup
; * drop bombs at intervals, using a specific value that can be checked later
; * after the first round of bombs is dropped, adjust the offset a bit and re-bomb to hit a similar pattern across new spaces
; * fork to a process to check the original set of bombs (canaries) for changes.  
; * * if a change is found, check the bombs on either side for changes
; * * once both ends have been found, fire off processes to creep towards that or bomb towards that


;assert CORESIZE==8000

	org main


; stop attacks?
;planc:		sne -1, -4
;		mov reset2, -5
;		jmp planc

; config-y stuff
increment:	dat #0, #3		; right now 3 seems to be the magic number for 8000 memsize
					; the bomber will kill this after a bit if it's still running					
					; so this is a backup that will expire if we get to make a fair number of runs

; needed vars?
done:		dat #0, #50		; stores the number of bombs we should drop
reset2:		dat #0, #0		; used to 0 out bombcount
reset:		dat #0, #500		; used to reset lastbomb 
canary:		dat #441, #223		; just something unique we can use to test if memory is modified
lastbomb:	dat #0, #500		; place to store offset for bomb dropping
bombcount:	dat #0, #0		; total bombs dropped
addcount:	dat #0, #0
runcount:	dat #0, #0		; count the times we've looped to the adjust phase in the bomber run
scancount:	dat #0, #0		; track where we want to scan, this will be init'd to reset when the scanner starts
buffer:		dat #69, #69		; just an easy way to see the end of my vars and beginning of code
; code
main:		spl planb  		; start out here, split to our immediate back up plan
;		spl planc
bomber:		mov canary, @lastbomb 	; this is where the main bot's work begins, we copy the canary to our bomb location
		add #100, lastbomb	
		add.ab #1, bombcount
		seq bombcount, done	; we've got to stop before we hit a certain number of bombs to avoid hitting ourself 
		jmp bomber		; if we havent dropped enough bombs, keep going
		mov reset, lastbomb	; otherwise we contine by reseting vars
		mov reset2, bombcount
		add increment, addcount	; then we adjust the targetting offset to hit new spaces
		add addcount, lastbomb	; apply it
		seq runcount, reset2	; check if we've made a full successful run yet
		jmp bomber		; if so, start over with a new set of bombs to drop
		add #1, @runcount	; if not, mark it done
		spl scan		; split off to our scanner process
		jmp bomber		; and go back home		
		dat #0, #0
scan:		mov reset, scancount
		sub #4, scancount 	;; this value is the delta between lastbomb and scancount, might be good to re-org that chunk
scanner:	seq canary, @scancount
		jmp foundit
		add #100, scancount
		jmp scanner
		dat #0, #0
foundit:	mov imp, @scancount
		sub #2, @scancount
		spl @scancount
		add #2, @scancount
		jmp scanner
; in thinking about this, this pretty much ensures that in (memsize * processes)-start postition, we will overwrite ourself..
; see note on increment declaration
imp:		mov 0, 1		; imp?
planb:		mov reset, 150 		; just incase someone hits the core bot early on, spin a cheap backup option
		mov imp, 150	
		jmp 149


;		add #16, #16  		;; fwiw, this actually works stashing the value in .B, which would be mroe space effective 
;						coutner than above

