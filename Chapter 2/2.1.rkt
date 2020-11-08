#lang Scheme

(define (make-rat n d) (if (> (* n d) 0) (cons n d) (cons (* -1 (abs n)) (abs d))))
