#lang Scheme

(define (same-parity first . l)
  
  (define (same-parity-inner good? l result)
    (cond
      ((empty? l) result)
      ((good? (car l)) (same-parity-inner good? (cdr l) (append result (list (car l)))))
      (else (same-parity-inner good? (cdr l) result ))
          )
    )
  (same-parity-inner (if (even? first) even? odd?) l (list first))
  ) 