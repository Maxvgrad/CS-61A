#lang Scheme


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


(define (rectangle segment1 segmeent2) (cons segment1 segment2))

(define (length-segment segment)
  (let (a ())
      ())
  )

