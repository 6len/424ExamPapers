#lang racket

(define (tear pred li)
  (append (list(filter pred li)) (list(filter-not pred li))))


(tear number? '(a b c 1 2 3 d e f))

(tear (lambda (x) (> x 5)) '(1 10 2 12 3 13))