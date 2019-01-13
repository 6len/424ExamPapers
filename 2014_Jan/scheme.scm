#lang racket

(define (deep-fetch pred li)
  (if (null? li)
      null
      (if (list? (car li))
          (deep-fetch pred (flatten li))
          (if (pred (car li))
              (cons (car li) (deep-fetch pred (cdr li)))
              (deep-fetch pred (cdr li))))))

(deep-fetch number? '(the (quick 6 fox 8 9) slick 2) )
(deep-fetch symbol? '(the (quick 6 fox 8 9) slick 2))