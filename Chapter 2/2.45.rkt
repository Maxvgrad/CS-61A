#lang Scheme


(define right-split (split beside below))
(define up-split (split below beside))


(define (split org sm)
  (if (= n 0)
      painter
      (let ((smaller (split painter (- n 1))))
        (org painter (sm smaller smaller)))))