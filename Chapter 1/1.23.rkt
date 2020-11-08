#lang Scheme


(define (iter)
  (define primes (vector 1009 1013 1019 10007 10009 10037 100003 100019 100043 1000003 1000033 1000037))
  (define (iter-inner index)
    (
     if (= index 11) (newline)
        (begin
         (timed-prime-test (vector-ref primes index))
         (iter-inner (+ index 1))
        )                    
    )
    )
  
  (iter-inner 0)
  )


(define (timed-prime-test n)
    (newline)
  (display '\;)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (when (fast-prime? n)
      (report-prime (- (runtime) start-time))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (find-divisor-nexet n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

; 1.24
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))   


(define (divides? a b)
  (= (remainder b a) 0))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (runtime) (* 100 (current-inexact-milliseconds)))

(define (square n)
  (* n n))

(define (next n) (if (= n 2) (+ n 1) (+ n 2)))


;1009 *** 17.375
;1013 *** 0.3125
;1019 *** 0.3125
;10007 *** 0.8125
;10009 *** 0.875
;10037 *** 0.8125
;100003 *** 2.5
;100019 *** 2.59375
;100043 *** 2.53125
;1000003 *** 7.90625
;1000033 *** 8.03125

; With procedure (next):
;1009 *** 20.21875
;1013 *** 0.28125
;1019 *** 0.1875
;10007 *** 0.59375
;10009 *** 0.5625
;10037 *** 0.59375
;100003 *** 1.71875
;100019 *** 1.59375
;100043 *** 1.59375
;1000003 *** 5.09375
;1000033 *** 5.1875

; Ration Slow/Fast:
; 1.1111111111111112
; 1.5555555555555556
; 1.6274509803921569
; 1.5521472392638036

; Ration is < 2 is because I introduced extra conditional expression (extra overhead)