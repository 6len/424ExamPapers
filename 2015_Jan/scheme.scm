#lang racket
(require racket/trace)

(define (after-filter pred list)
  (if (null? (cdr list))
      null
      (if (pred (car list))
          (cons (cadr list) (after-filter pred (cdr list)))
          (after-filter pred (cdr list)))))

(after-filter number? '(a 2 3 b 4 c))
