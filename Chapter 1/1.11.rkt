#lang Scheme

(define (f n)
  (if (< n 3) n
      (+
        (* 1 (f (- n 1)))
        (* 2 (f (- n 2)))
        (* 3 (f (- n 3)))
      )
  )
)

(define (fi n) (f-iter 2 1 0 n))

(define (f-iter a b c counter)

  (if (= 0 counter) c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- counter 1))
  )
)
