#lang Scheme

; a

(define (product f a next b)
  (define (mult a b) (* a b))
  (accumulate-rec mult f a next b 1)
)


(define (accumulate operator term a next b acc)
  (define (accumulate-inner a result)
    (if (> a b)
        result
        (accumulate-inner (next a) (exact->inexact (operator result (term a))) )
        )
    )
  (accumulate-inner a acc))

(define (wallis-product n) (/ (* 4 n n) (- (* 4 n n) 1)))

; (product identity 1 (lambda (x) (+ x 1)) 3)
; (* (product wallis-product 1 (lambda (x) (+ x 1)) 100) 2)

; b


(define (accumulate-rec operator term a next b acc)
  (define (accumulate-inner a)
    (if (>= a b) (term a)
        (operator (term a) (accumulate-inner (next a)) )
        )
    )
  (accumulate-inner a))

