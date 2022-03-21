#lang Scheme

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define e
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; a: p-t procedure devides interfal by two left and right intervals and invike itself on each interval.
; (partial-tree '(1 3 5 7 9 11) 6)
; (partial-tree '(1 3 5 7 9 11) 2) (partial-tree '(7 9 11) 3)
; (partial-tree '(1 3 5 7 9 11) 0) (partial-tree '(3 5 7 9 11) 1) (partial-tree '(7 9 11) 1) (partial-tree '(11) 1)
; (partial-tree '(3 5 7 9 11) 0) (partial-tree '(5 7 9 11) 0) (partial-tree '(7 9 11) 0) (partial-tree '(9 11) 0) (partial-tree '(11) 0) (partial-tree '() 0)

; b: O(2n+1) = O(2n) = O(n)