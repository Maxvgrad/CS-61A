#lang Scheme


(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (except-first-denomination l) (cdr l))
(define (first-denomination l) (car l))
(define (no-more? l) (= (length l) 0))


(define us-coins (list 25 1 50 10 5))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

;  Does the order of the list coin-values affect the answer produced by cc? Why or why not?
; Order doesn't matter. That's a recursive process which expands in each possible coin combination, no matter what coin's order is.