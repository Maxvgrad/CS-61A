#lang Scheme


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y) (cons x y))

(define (make-segment start end)
  (cons start end)
  )

(define (start-segment segment)
  (car segment)
  )

(define (end-segment segment)
  (cdr segment)
  )

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment s)
  (let (
        (xavr (average (x-point (start-segment s)) (x-point (end-segment s)) ))
        (yavr (average (y-point (start-segment s)) (y-point (end-segment s)) ))
        )

  (make-point xavr yavr)
    )
  )

(define (average a b) (/ (+ a b) 2))


; > (define start (make-point 0 0))
;>  (define end (make-point 10 5))
;> (define segment (make-segment start end))
;> (print-point (midpoint-segment segment))
