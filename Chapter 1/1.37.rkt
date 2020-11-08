#lang Scheme

; a

(define (cont-frac N D k)
  (define (cont-frac-inner i)
    (if (= i k) 0
        (/ (N i) (+ (D i) (cont-frac-inner (+ i 1))))))
  (cont-frac-inner 0)
  )

; (real->decimal-string (cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           10) 4)
; "0.6182"
; k = 10 is enough to get accurate 4 decimal places approximation

; b: rewrite procedure to iterrative process

(define (cont-frac-iter-deprecated N D k)
  (define (cont-frac-inner i result)
    (let
        ((fraction (/ (N i) (D i)))
        (Nprev (N (- i 1))))
    (if (= i k) result
        (cont-frac-inner (+ i 1) (expt (+ result (/ fraction Nprev)) -1)   ))))
  (cont-frac-inner 0 0)
  )


(define (cont-frac-iter N D k)
  (define (cont-frac-inner i result)
    (if (= i 0) result
        (cont-frac-inner (- i 1) (/ (N i) (+ (D i) result))   )))
  (cont-frac-inner k 0)
)