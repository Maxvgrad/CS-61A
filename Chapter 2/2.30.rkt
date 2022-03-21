#lang Scheme


(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (list? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))


(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))