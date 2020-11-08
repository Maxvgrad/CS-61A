#lang Scheme

(define (cont-frac N D k)
  (define (cont-frac-inner i)
    (if (= i k) 0
        (/ (N i) (+ (D i) (cont-frac-inner (+ i 1))))))
  (cont-frac-inner 0)
  )


(define (cont-frac-iter N D k)
  (define (cont-frac-inner i result)
    (if (= i 0) result
        (cont-frac-inner (- i 1) (/ (N i) (+ (D i) result))   )))
  (cont-frac-inner k 1)
)

(define (de-fractionibus-continuis k)
  (cont-frac-iter
   (lambda (i) (1.0))
   (lambda (i) (1.0))
   k)
  )