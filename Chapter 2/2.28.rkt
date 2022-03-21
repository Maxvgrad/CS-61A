#lang Scheme

(define (fringe l)
  (cond
    ((null? l) l)
    ((list? (car l)) (append (fringe (car l)) (fringe (cdr l))))
    (else (append (list (car l)) (fringe (cdr l))))
  ))