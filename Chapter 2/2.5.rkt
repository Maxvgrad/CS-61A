#lang Scheme


(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (cdr z) (extract 3 z))

(define (car z) (extract 2 z))


(define (extract divider z)
  (define (extract-inner z result)
    (if (= (remainder z divider) 0)
        (extract-inner (/ z divider) (+ result 1))
        result
        )
    ) 
  (extract-inner z 0)
)
