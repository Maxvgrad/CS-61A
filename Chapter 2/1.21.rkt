#lang Scheme


(define (square-list items)
  (if (null? items)
      null
      (cons (expt (car items) 2) (square-list (cdr items)))))
(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))