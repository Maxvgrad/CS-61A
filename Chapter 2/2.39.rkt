#lang Scheme


(define (reverse-fr sequence)
  (fold-right (lambda (x y) (if (null? y) (list x) (append y (list x)))) null sequence))
(define (reverse-fl sequence)
  (fold-left (lambda (x y) (if (null? x) (list y) (append (list y) x))) null sequence))


(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

  (accumulate op initial sequence))


; (reverse-fr (list 1 2 3 4))
; (reverse-fl (list 1 2 3 4))