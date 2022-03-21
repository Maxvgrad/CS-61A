#lang Scheme

(define (make-interval a b) (cons a b))

(define (lower-bound i) (min (car i) (cdr i)))
(define (upper-bound i) (max (car i) (cdr i)))

(define (interval-operation operator x y)
  (make-interval (operator (lower-bound x) (lower-bound y))
                 (operator (upper-bound x) (upper-bound y))))

(define (add-interval x y)
  (interval-operation (lambda (x y) (+ x y)) x y)
  )

(define (sub-interval x y)
  (interval-operation (lambda (x y) (abs (- x y))) x y)
  )