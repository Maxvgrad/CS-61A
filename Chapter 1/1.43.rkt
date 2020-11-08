#lang Scheme

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-inner i acc)
    (if (= i n) acc
        (repeated-inner (+ i 1) (compose f acc))
    ))
  (repeated-inner 1 f)
  )

; ((repeated (lambda (x) (* x x)) 2) 5)
; 625