#lang Scheme

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((= given-key (key (entry set-of-records))) (car set-of-records)
        ((< given-key (key (entry set-or-records)))
         (lookup given-key (left-branch set-of-records)))
        ((> given-key (key (entry set-or-records)))
         (lookup given-key (right-branch set-of-records))))))