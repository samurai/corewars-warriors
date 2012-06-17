;redcode-94
;name tail defender v0.1
;author samurai@psych0tik.net
;strategy the idea here is to built a bot to somehow protect itself from imps crawling in behind it
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000

;; NOTES
;; v0.1 - currently "carpet bombs" the memory directly before itself in decending order over and over


	org main

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
