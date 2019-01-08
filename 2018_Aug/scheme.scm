#lang racket

(define (map-skip function list)
  (for/list ([i (length list)] [elem list])
    (if (even? i)
        (function elem)
        elem)))
