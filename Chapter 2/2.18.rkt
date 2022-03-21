#lang Scheme

(define (last-pair l)
  (if (null? (cdr l)) l (last-pair (cdr l)))
  )

(define (reverse l)
  (if (null? (cdr l)) l (append (reverse (cdr l)) (list (car l))))
  )


;(reverse (list 1 4 9 16 25))