#lang Scheme


(define (count-leaves t)
  (accumulate (lambda + 0 (map (lambda (elem) (if (list? elem) (count-leaves elem) 1)) t)))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))


#|

> (define l1 (list 1 2 3 4))
> (count-leaves l1)
4
> (define l2 (list 1 2 l1 3))
> (count-leaves l2)
7

|#