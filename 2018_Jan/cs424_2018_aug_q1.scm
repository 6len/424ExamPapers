#lang racket

(define (map-skip func li) 
  (if (null? li)
      null
      (if (null? (cdr li))
          (list (func (car li)))
          (append (cons (func(car li)) (list(car (cdr li)))) (map-skip func (cddr li))))))

;from top to bottom
;define our function
;if the list is empty return null
;if we have 1 left, that means either we're at the end of an odd list or there was only 1 entry, if so apply the function to this entry and make it a list
;otherwise, apply the function to the car of the list (first element), append the second element onto it and then call recursively with the cddr, skipping the element we appeneded.
;rinse & repeat
(map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6 7))