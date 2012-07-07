;redcode-94
;name canary v0.2
;author samurai@psych0tik.net
;strategy This is a hybrid of a bomber and a scanner, that will use faux-imps as the bombs
;strategy (written in ICWS'94)
;strategy Submitted: @date@

;Version log
; v0.1 - initial version, mostly a concept of "will this work"
; v0.2 - more working parts and some optimzation. the bombing routines are at least solid. scanning is still a bit dicey 

; ideas/concepts for this bot 
; * immediately fork off to an imp placed somewhere down the line. just incase we get tanked before
; we get going, we've got a stalemate backup
; * drop bombs at intervals, using a specific value that can be checked later
; * after the first round of bombs is dropped, adjust the offset a bit and re-bomb to hit a similar pattern across new spaces
; * fork to a process to check the original set of bombs (canaries) for changes.  
; * * if a change is found, check the bombs on either side for changes
; * * once both ends have been found, fire off processes to creep towards that or bomb towards that

	org main
; config-y stuff
increment:	dat #0, #3		; right now 3 seems to be the magic number for 8000 memsize
					; the bomber will kill this after a bit if it's still running					
					; so this is a backup that will expire if we get to make a fair number of runs

; needed vars?	;; TODO: some of these counters could be reduced
reset2:		djn -2, #50		; used to reset bombcount
reset:		add #100, #500		; used to reset lastbomb 
canary:		dat #441, #223		; just something unique we can use to test if memory is modified
scancount:	dat #0, #0		; track where we want to scan, this will be init'd to reset when the scanner starts
buffer:		dat #69, #69		; just an easy way to see the end of my vars and beginning of code

; code
main:		spl planb  		; start out here, split to our immediate back up plan
bomber:		mov canary, @lastbomb 	; this is where the main bot's work begins, we copy the canary to our bomb location
lastbomb:	add #100, #500	
bombcount:	djn bomber, #50 
bomberrst:	mov reset, lastbomb	; otherwise we contine by reseting vars
		mov reset2, bombcount
addcount:	add increment, #0	; then we adjust the targetting offset to hit new spaces
		add addcount, lastbomb	; apply it
		spl scan		; split off to our scanner process
		jmp bomber		; and go back home		
					; TODO: may want to reset runcount at this point? tho it may not be needed at all
		dat #0, #0		; filler


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
planb:		mov imp, 3550		; back-up
		jmp 3549
