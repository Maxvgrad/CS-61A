#lang Scheme


(define (cont-frac-iter N D k)
  (define (cont-frac-inner i result)
    (if (< i 0) result
        (cont-frac-inner (- i 1) (/ (N i) (+ (D i) result))   )))
  (cont-frac-inner k 0)
)


(define (tan-cf x k)
  (cont-frac-iter
   (lambda (i) (if (= i 0) x (* x x -1)))
   (lambda (i) (+ (* 2 i) 1))
   k)
)

;(exact->inexact (tan-cf 2 10))