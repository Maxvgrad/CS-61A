; Recursion procedure:
;(define (+ a b)
;  (if (= a 0)
;      b
;      (inc (+ (dec a) b))))
; Recursion process:
; (+ 4 5)
; (inc (inc (inc (inc 5))))
;
; Recursion procedure:
; (define (+ a b)
;  (if (= a 0)
;      b
;      (+ (dec a) (inc b))))
; Iteration process:
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)

