#lang Scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))



(define (map p sequence)
  (accumulate (lambda (x y) (append (list (p x)) y)) null sequence))
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

#|

(define l (list 1 -2 3 -4 5 -6))
(map abs l)

(define l1 (list 1 2 3))
(define l2 (list 4 5 6))
(append l1 l2)

(length l)

|#