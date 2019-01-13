#lang racket

(define (add-numbers li)
  (if (null? li)
      0
      (if (list? (car li))
          (add-numbers (flatten li))
          (if (number? (car li))
          (+ (car li) (add-numbers (cdr li)))
          (add-numbers (cdr li))))))

(add-numbers '(0 (1 2 3)))