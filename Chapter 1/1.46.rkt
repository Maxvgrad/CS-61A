#lang Scheme


(define (iterative-improve good? improve)
  (lambda (guess) (if (good? guess) guess
                      ((iterative-improve good? improve) (improve guess))
                      )
    )
)

(define (root x n)
  (define (average a b)
    (/ (+ a b) 2))

  (define (f y) (/ x (expt y (- n 1))))
  
  (fixed-point (repeated (lambda (y) (average y (f y)))  (round (/ (log n) (log 2))))
               1.0)
  )

(define (fixed-point f first-guess)
  (define (close-enough? v1)
    (let ((tolerance 0.00001)
          (v2 (f v1))
          )
    (< (abs (- v1 v2)) tolerance)))
  ((iterative-improve close-enough? (lambda (y) (f y))) first-guess)
  )

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
    (if (= n 1) f
       (compose f (repeated f (- n 1)))
       )
)