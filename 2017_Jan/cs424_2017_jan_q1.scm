#lang racket

(define (foo pred li)
  (filter pred (flatten li)))

;filter filters the list to the given argument e.g number it will return the list filtered for numbers
;flatten flattens a list of lists into a single list i.e (a (2 (c 3) 4)) will become a 2 c 3 4

(foo number? '(a (2 (c 3) 4)))
(foo symbol? '(a (2 (c 3) 4)))