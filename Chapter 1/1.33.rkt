#lang Scheme

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (accumulate-inner a result)
    (if (> a b)
        result
        (accumulate-inner (next a) (exact->inexact (if (filter a) (if (null? result) (term a) (combiner result (term a))) result )))
        )
    )
  (accumulate-inner a (if (null? null-value) 1 null-value))
)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (square n) (* n n))

; (filtered-accumulate (lambda (a b) (+ a b)) 1 square 1 (lambda (x) (+ x 1)) 4 prime?)


