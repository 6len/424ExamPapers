#lang racket

(define (tear p myList)
  (list
      (for/list ([i myList] #:when (p i)) i)
      (for/list ([i myList] #:when (not (p i))) i)))
