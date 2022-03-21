#lang Scheme

(define (deep-reverse l)
  (cond
    ((null? l) l)
    ((list? (car l)) (append (deep-reverse (cdr l)) (list (deep-reverse (car l)))))
    (else (append (deep-reverse (cdr l)) (list (car l))))
  )
)

; (define x (list (list 1 2) (list 3 4)))
; (deep-reverse (list (list 1 2) (list 3 4)))