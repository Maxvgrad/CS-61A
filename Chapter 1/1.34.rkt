#lang Scheme

(define (f g)
  (g 2))

; (f f)
; (f 2)
; (2 2)
; application: not a procedure

; Intorpriter unable to find a procedure for character '2' 