#lang Scheme

; a
(define (accumulate combiner null-value term a next b)
  (define (accumulate-inner a result)
    (if (> a b)
        result
        (accumulate-inner (next a) (exact->inexact (combiner result (term a))) )
        )
    )
  (accumulate-inner a (if (null? null-value) 1 null-value)))


(define (product f a next b)
  (define (mult a b) (* a b))
  (accumulate mult 1 f a next b)
)

;(product identity 1 (lambda (x) (+ x 1)) 3)