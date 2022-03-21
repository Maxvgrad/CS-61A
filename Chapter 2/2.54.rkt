#lang Scheme

(define (equal? x y)
  (cond ((and (null? x) (null? y)) true)
        ((and (list? x) (list? y)) (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
        ((or (list? x) (list? y)) false)
        (else (eq? x y) ))
  )