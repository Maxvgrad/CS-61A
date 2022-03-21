#lang Scheme

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
    
    (if (leaf? tree)
        '()
        (let ((is-left (is-left? symbol tree)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))


(define (is-left? symbol tree)
  (let ((left-branch (left-branch tree)))
  (if ((and (leaf? left-branch) (= (symbols tree) )))