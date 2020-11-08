#lang Scheme

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simpson f a b n)

  (define h (/ (- b a) n))
  (define (inc a) (+ a 1))
  (define (coef k) (cond ((or (= k 0) (= k n)) 1)
                         ((odd? k) 4)
                         (else 2)
                         
                         )
    )
  (define (term k) (* (coef k) (f (+ a (* h k)))))
  
  (exact->inexact

  (* (sum term 0 inc n) (/ h 3) )
  )
)


(define (sum-2 term a next b)  
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (sum term a next b)
  (define (iter a result)
    (if (>= a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

