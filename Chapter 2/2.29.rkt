#lang Scheme

(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

; a

(define (left-branch m)
  (car m)
)

(define (right-branch m)
  (cdr m)
)

(define (branch-length br)
  (car br)
)

(define (branch-structure br)
  (cdr br)
)

(define (mobile? m) (pair? m))

; b

(define (traverse-tree t acc-operator br-operator leaf?)
  (define (traverse-branch b)
    (let ((s (branch-structure b)))
    (if (leaf? s) (br-operator b) (traverse-tree s)))
  )
  (let ((lb (left-branch t)) (rb (right-branch t)))
    (acc-operator (traverse-branch lb) (traverse-branch rb)))
)

(define (total-weight m)
  (if (mobile? m) (traverse-tree m (lambda (l r) (+ l r)) (lambda (b) (branch-structure b)) (lambda (s) (not (mobile? s)))) m)
  )



; (define b1 (make-branch 2 10))
; (define b2 (make-branch 2 20))
; (define m1 (make-mobile b1 b2))
; (total-weight m1)


; c

(define (balanced? mobile)
  (newline)
  (print mobile)
  (define (calculate b)
    (* (branch-length b) (total-weight (branch-structure b)))
  )
  (define (balanced-inner? m)  
    (let ((lb (left-branch m)) (rb (right-branch m)))
      (and (= (calculate lb) (calculate rb)) (balanced? (branch-structure lb)) (balanced? (branch-structure rb)))
      )
   )
  (if (mobile? mobile) (balanced-inner? mobile) true)
)

#|
(define b2 (make-branch 2 20))
(define b3 (make-branch 3 5))
(define b4 (make-branch 1 15))
(define m2 (make-mobile b3 b4))
(define b1 (make-branch 2 m2))
(define m1 (make-mobile b1 b2))
(balanced? m1)
|#



