#lang Scheme

(define (square n) (* n n))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
; What happens when Alyssa attempts to use this to compute square roots? Explain.
; The program will run infinetally long intill the process will be stoped by ?. Intopriter is using normal order evaluation,
; so it tries to fully expand the coumpund procedures, but due to its recursion nature, interpreter could not reach the end.


