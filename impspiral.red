;redcode-94
;name imp-spammer
;author samurai@psych0tik.net
;strategy spams imps?
;strategy (written in ICWS'94)
;strategy Submitted: @date@
;assert CORESIZE==8000


;updated this from the canary-based on to something smaller and nimbler
;this isn't particularly effective at anything other than stalemates :P


; the idea with the check portion, is to keep some buffer before the generator that detects when
; other imps are getting close and starts bombing memory as much as possible to stop their progress
; thusfar, this has been fairly unsuccessful :P

	org main
check:	dat 0		
	dat #0,#0
	dat #0,#0
	dat #0,#0
blank:	dat 0
stopit: mov goat, -3
imp:	mov 0, 1
goat:	dat #0, #0
main:	spl 0
	seq check, blank
	jmp stopit
	add #501, goat
	mov imp, @goat
	spl @goat
	
