#lang racket

(define (tr lists)
    ;create list of first elements from list of lists
    (let ([li (list (for/list ([i lists]) (car i)))])
        (if (= (length (car lists)) 1)
            li
            (append
              li
              (tr (for/list ([i lists]) (cdr i)) )))))
