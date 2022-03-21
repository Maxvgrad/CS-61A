#lang Scheme

(define (adjoin-set x set)
      (let ((elem (car set)))
        (cond ((= x elem) (set))
              ((< x elem) (cons x set))
              ((> x elem) (cons elem (adjoin-set x (cdr set)))))
)
  )