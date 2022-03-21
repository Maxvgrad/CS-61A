#lang Scheme
(define (augend s) (
   if (= (length s) 3) (caddr s) (cons '+ (cdr (cdr s))) 
                    ))


(define (multiplicand p)
  (if (= (length p) 3) (caddr p) (cons '* (cdr (cdr p))))
)