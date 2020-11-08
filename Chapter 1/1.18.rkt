#lang Scheme
(define (double x) (+ x x))

(define (mult-expt a b)
  (cond
    ((= b 0) 0)
    ((even? b) (double (mult-expt a (/ b 2))))
    (else (+ a (mult-expt a (- b 1))))
  )
)

(define (mult-expt-iter a b acc)
  (cond
    ((= b 0) acc)
    ((and (even? b) (not (= acc 0))) (mult-expt-iter (double a) (/ b 2) acc))
    (else (mult-expt-iter a (- b 1) (+ acc a)))
  )
)