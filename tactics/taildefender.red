;redcode-94
;name tail defender v0.2
;author samurai@psych0tik.net
;strategy the idea here is to built a bot to somehow protect itself from imps crawling in behind it
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000

;; NOTES
;; v0.1 - currently "carpet bombs" the memory directly before itself in decending order over and over
;; v0.2 - added a much smaller and faster bomber that simply attacks a single spot before it. 

	org main 	; variant 1
;	org main2	; variant 2


;; variant 1 
;; for this tactic.  this "carpet bombs" the memory before it repatedly
;; in testing this has been getting ~20% success against killing imp.red

mines:	dat #69, #69		;; really just a backdrop of area we don't care about
	dat #69, #69
	dat #69, #69
	dat #69, #69
	dat #69, #69
	dat #69, #69
	dat #69, #69
	dat #69, #69
	dat #69, #69
	dat #69, #69
bomb:	dat #55, #44		;; something unique to make debugging easier :P
reroll:	sub #1, #-11		;; used to check if our counter needs reseting
reset:	sub #1, #-1		;; used to reset the counter
main:	sub #1, #-1 		;; counter!
	mov bomb, @main		;; carpet bomb !
	sne reroll, main	;; check if we need to reset the counter
	jmp clear		;; apparently we do, so do it!
	jmp main		;; time to go home
clear:	mov reset, main		;; reset the counter
	jmp main		;; and back home again




;; variant 2
;; much more simple, this just repeatedly bombs a few spaces back
;; in testing, this has gotten a 100% draw rate aganst imp.red.  this probably needs more testing
main2:	mov bomb, -3
	jmp main2
