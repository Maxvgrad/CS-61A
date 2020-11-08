#lang Scheme

(define (accumulate operator term a next b acc)
  (define (accumulate-inner a result)
    (if (> a b)
        result
        (accumulate-inner (next a) (operator result (term a)))
        )
    )
  (accumulate-inner a acc))

(define (product f a b)
  (define (mult a b) (* a b))
  (define (next a) (+ a 1))

  (accumulate mult f a next b 1)
)

(define (ident a) (a))