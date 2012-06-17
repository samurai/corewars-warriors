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

	org main	;; variant 1
;	org main2	;; variant 2 - untested/unvetted at this stage
imp:	mov 0, 1	; all of these use this, so we'll toss it outside of their blocks

;; variant 1
;; this one starts with a split to itself as an infinite generator
;; each thread adds to a counter and starts an imp at that location
;; this doesnt take much code and the body dieing off helps keep thread count down
;; but inherently, this spawns a lot

main:	spl 0		; spawn processes forever
goat	add #501, #0	; in-place counter
	mov imp, @goat	; mov an imp
	spl @goat	; run an imp


;; variant 2
;; brought in from fork.red
;; this is a much less thread intense version of the above, it dies off on it's own pretty quickly
;; but not until it spawns 3 imps across memory (not very thoroughly)
;; this is almost entirely untested
main2:	mov imp, 2500	; move an imp
	spl 2499	; start an imp
	mov imp, 5000	; move an imp somewhere else
	spl 4999	; start that one too
	jmp 2500	; jump somewhere in the path of the first one

