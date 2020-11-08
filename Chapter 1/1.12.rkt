#lang Scheme

(define (pascals-triangle rows)
   (define (next-row row)
     (define (compute-row-inner up-row down-row)
       (if (= (length up-row) 1) down-row
           (compute-row-inner (rest up-row) (append down-row (list (+ (first up-row) (list-ref up-row 1)))))
           )
       )


      (append (cons 1 (compute-row-inner row (list))) (list 1))
     )


  (define (pascals-triangle-inner up-row down-row cur n)
    (if (= cur n) up-row
         (pascals-triangle-inner down-row (next-row down-row) (+ cur 1) n)
        )
    )

   (pascals-triangle-inner (list 1) (list 1 1) 1 rows)
  )