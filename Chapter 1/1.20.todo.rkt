#lang Scheme
;This method for computing the GCD is known as Euclid's Algorithm.

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?
; Normal order:
;
; TODO
; 
; Aplicative order:
; (gcd 206 40)
; (gcd 40 6) -> 1
; (gcd 6 4) -> 2
; (gcd 4 2) -> 3
; (gcd 2 0) -> 4