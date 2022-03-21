#lang Scheme

; Same O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; O(1)
(define (adjoin-set x set) (cons x set))

; O(n)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())        
        (else (cons (car set1)
               (intersection-set (cdr set1) set2)))))

; O(n)
(define (union-set set1 set2)
  (if (or (null? set1) (null? set2)) set2
         (union-set (cdr set1) (adjoin-set (car set1) set2))))

; Set with duplicates is more efficient compare to non-duplicates
; In this implementation write operations become faster. Read operation might be slower, because the data is denormilized. 
; This implementation should be preferable if application is making more writes.
; Data normilization can be done after all writes.