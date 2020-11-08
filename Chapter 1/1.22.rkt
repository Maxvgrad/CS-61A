#lang Scheme

(define (search-for-primes from to)


  
  
  (define (search-for-primes-internal from)
    (when (<= from to) (timed-prime-test from))
    (when (<= from to) (search-for-primes-internal (+ from 2)))
   )
  
  (search-for-primes-internal (if (even? from) (+ 1 from) from))
)

  (define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

  (define (start-prime-test n start-time)
    (when (prime? n)
      (report-prime (- (runtime) start-time))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (runtime) (* 100 (current-inexact-milliseconds)))

(define (square n)
  (* n n))


;1009 *** 0.3125
;1013 *** 0.34375
;1019 *** 0.3125

;10007 *** 0.90625
;10009 *** 0.78125
;10037 *** 0.71875

;100003 *** 2.59375
;100019 *** 2.5
;100043 *** 2.59375

;1000003 *** 7.1875
;1000033 *** 7.09375
;1000037 *** 7.0625
