#lang Scheme
; Ackermann's function
 (define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
; (A 1 10) ;
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; 2024

; (A 2 4)
; (A 1 (A 2 (A 2 (A 2 1))))
; (A 1 (A 2 (A 2 2)))
; (A 1 (A 2 (A 1 (A 2 1))))
; (A 1 (A 2 (A 1 2)))
; (A 1 (A 2 2^2))

; (A 1    (A 1 (A 2 (A 2 (A 2 1))))      )




; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 2^2))
; (A 1 (A 1 2^2))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 0 (A 1 1))))
; (A 1 8)
; (A 0 (A 0 (A 0 (A 0 (A 1 (A 0 (A 0 (A 0 1))))))))
; 256

; (A 3 3) ;
;
; (define (f n) (A 0 n)) ; f=2n
; (define (g n) (A 1 n)) ; g=2^n
; (define (h n) (A 2 n)) ; 