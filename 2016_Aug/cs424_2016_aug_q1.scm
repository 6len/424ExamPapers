#lang racket
;Define a function tr which takes a list of lists, all of the same
;length, and returns their "transpose", meaning a list of lists of
;the first elements, the second elements, etc. (All lists in test
;cases can be assumed to be non-empty.)

;found on stack overflow
(define (tr ls) 
  (if (empty? (car ls))
      empty ;if there's nothing left we stop
      (if (null? ls)
          empty ;if the list is empty we stop
          (cons (map car ls) (tr (map cdr ls)))))) ;otherwise construct a new list which starts with (map car ls)

;map applies the following procedure to EVERY list in the list of lists
;so map car ls applies car list to each list
;recursively call tr map cdr ls so (tr (cdr list1, cdr list2.. etc)

(tr '((f o x e s) (s o c k s) (r o c k s)))