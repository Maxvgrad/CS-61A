#lang Scheme

(define (double x) (+ x x))

(define (mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))

(define (mult-expt a b)
  (cond
    ((= b 0) 0)
    ((even? b) (double (mult-expt a (/ b 2))))
    (else (+ a (mult-expt a (- b 1))))
  )
)