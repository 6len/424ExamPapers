#424 Exam Paper Solutions + Cheat Sheet

##Scheme Solutions
### 2014 Jan

Define a higher-order function deep-fetch which takes a
predicate and an s-expression, and returns a list of all atoms
inside the given s-expression which pass the given predicate.

Examples:

(deep-fetch number? '(the (quick 6 fox 8 9) slick 2))
 -> (6 8 9 2)

(deep-fetch symbol? '(the (quick 6 fox 8 9) slick 2))
 -> (the quick fox slick) 
 
 #### Code
```Scheme
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
```
#### Output

```Scheme
'(6 8 9 2)
'(the quick fox slick)
```
---
###2014 August
Define a function add-numbers which takes an s-expression
and returns the sum of all the numbers contained therein.

 (add-numbers 17) => 17
 
 (add-numbers '(a (1 (2) 3) 4)) => 10
 
 (add-numbers '(the quick fox)) => 0 
 
 ####Code
 ```Scheme
 (define (add-numbers li)
   (if (null? li)
       0
       (if (list? (car li))
           (add-numbers (flatten li))
           (if (number? (car li))
           (+ (car li) (add-numbers (cdr li)))
           (add-numbers (cdr li))))))
 
 (add-numbers '(0 (1 2 3)))
 ```
 
 ####Output
 
 ```Scheme
 6
 ```
 ---
 ###2015 Jan
 Define a function after-filter which takes in a predicate p and a list xs and returns a list of those elements of xs which immediately follow an element that passes predicate p
 
 ####Code
 
 ```Scheme
 (define (after-filter pred list)
   (if (null? (cdr list))
       null
       (if (pred (car list))
           (cons (cadr list) (after-filter pred (cdr list)))
           (after-filter pred (cdr list)))))
 
 (after-filter number? '(a 2 3 b 4 c))
 ```
 
 ####Output
 
 ```Scheme
 '(3 b c)
 ``` 
 ---
 ###2015 Aug & 2016 Jan
Define a Scheme function reverse-with-count which takes two
lists, the second of which is a list of non-negative integers the
same length as the first list, and returns a list of elements from
the first list, in reverse order, each repeated a number of times
as specified by the corresponding element of the second list.

(reverse-with-count '(a b c) '(1 2 3)) => (c c c b b a)

(reverse-with-count '(d c b a) '(3 0 0 1)) => (a d d d)
 
 ####Code
 
 ```Scheme
revCount :: String->[Int]->String
revCount x y | length x /= 0 && length y /= 0 && (last y) /= 0 = (last x) : revCount x (take ((length y)-1) y ++ [((last y)-1)] ++ drop (length y) y)
revCount x y | length x == 0 && length y == 0 = []
revCount x y = revCount (init x) (init y)
revCount [] [] = []

revCountHelper :: Char->Int->Char
revCountHelper x y = x

main = do
    print(revCount ['a','b','c'] [1,2,3])
 ```
 
 ####Output
 
 ```Scheme
 '(c c c b b a)
 ``` 
 ---
 ###2016 Aug
Define a function tr which takes a list of lists, all of the same
length, and returns their "transpose", meaning a list of lists of
the first elements, the second elements, etc. (All lists in test
cases can be assumed to be non-empty.)

Examples:

 (tr '((1 2 3) (4 5 6)))
 => ((1 4) (2 5) (3 6))
 
 (tr '((f o x e s) (s o c k s) (r o c k s)))
 => ((f s r) (o o o) (x c c) (e k k) (s s s))
 
 ####Code
```Scheme
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
```
 ####Output
 
 ```Scheme
 '((f s r) (o o o) (x c c) (e k k) (s s s))
 ``` 
 ---
 ###2017 Jan
Define a Scheme function foo which finds all atoms inside an sexpression which pass a given predicate.

Examples:

 (foo number? '(a (2 (c 3) 4)))
 => (2 3 4)
 
 (foo symbol? '(a (2 (c 3) 4)))
 => (a c)
 
 (foo symbol? 'a)
 => (a)
 
 (foo number? 'a)
 => ()
 ####Code
```Scheme
(define (foo pred li)
  (filter pred (flatten li)))

;filter filters the list to the given argument e.g number it will return the list filtered for numbers
;flatten flattens a list of lists into a single list i.e (a (2 (c 3) 4)) will become a 2 c 3 4

(foo number? '(a (2 (c 3) 4)))
(foo symbol? '(a (2 (c 3) 4)))
```
 ####Output
 
 ```Scheme
 '(2 3 4)
 '(a c)
 ``` 
 ---
 ###2017 Aug
Define a Scheme function foo that takes two lists and yields a list combining all the
elements in the two input lists, taking 1 from the first list, 2 from the second list, 3 from
the first list, 4 from the second list, etc, until both are exhausted.

Examples:

(foo '(a b c d e f g) '(aa bb cc dd ee ff gg))
 => (a aa bb b c d cc dd ee ff e f g gg)
 
(foo '(a b c d e f g) '())
 => (a b c d e f g)
 
(foo '() '(aa bb cc dd ee ff gg))
 => (aa bb cc dd ee ff gg)
 ####Code
```Scheme
(define (foo l1 l2)
	(foo-calc l1 l2 0 1))

(define (foo-calc l1 l2 a b)
	(if(null? l1)
		l2
		(if (null? l2)
			l1
			(if(= a b)
				(foo-calc l2 l1 0 (+ b 1))
				(cons (car l1) (foo-calc (cdr l1) l2 (+ a 1) b))))))


(foo '(a b c d e f g) '(aa bb cc dd ee ff gg))
```
 ####Output
 
 ```Scheme
 '(a aa bb b c d cc dd ee ff e f g gg)
 ```
 --- 
 ###2018 Jan
Define a Scheme function tear which takes two arguments, a
 predicate p? and a list xs, and returns a list of two lists, the
 first of which is the elements of xs that pass p?, and the second
 of which is the elements of xs that fail it, both in order.
 
 Examples:
 
 (tear number? '(a b c 1 2 3 d e f))
 => ((1 2 3) (a b c d e f))
 
 (tear (lambda (x) (> x 5)) '(1 10 2 12 3 13))
 => ((10 12 13) (1 2 3))
 ####Code
```Scheme
(define (tear pred li)
  (append (list(filter pred li)) (list(filter-not pred li))))


(tear number? '(a b c 1 2 3 d e f))

(tear (lambda (x) (> x 5)) '(1 10 2 12 3 13))
```
 ####Output
 
 ```Scheme
 '((1 2 3) (a b c d e f))
 '((10 12 13) (1 2 3))
 ```
 --- 
 ###2018 Aug
 Define a Scheme function map-skip which takes a function and a
 list and returns the result of applying the given function to
 every other element of the given list, starting with the first
 element.
 
 Example:
 
 (map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6))
 => (1001 2 1003 4 1005 6)
 ####Code
```Scheme
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
(map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6))

```
 ####Output
 
 ```Scheme
 '(1001 2 1003 4 1005 6)
 ```
 ---
 ##Scheme Cheat Sheet
 ###>List functions that may be important
 ```Scheme
 (length li) ; returns the length of the list li
 (append (l1) (l2)) ; returns l2 appended onto l1
 (filter (pred? l1)) ; returns members of l1 in which the predicate returns true
 (filter-not (pred? l1)) ; returns members of l1 in which the predicate returns false
 (shuffle li) ;shuffles a list
 (combinations li) ; returns the amount of different combinations a list can be have
 (cons (l1) (l2)) ; constructs a new list with first entry l1 and second entry l2
 (index-of li 3) ; returns the index of the first 3 in li
 (indexes-of li 3) ; returns the index of all the 3's in li as a list
 (first li) ; first element in the list, second, third ... tenth also exist
 (car li) ; current element / first element
 (cdr li) ; rest of list
 (rest li) ; rest of list
 (cadr li) ; next element in list
 (drop li 2) ; drops/deletes the element and index 2
 (take li 2) ; returns new list of first 2 elements in li
 (drop-right li 1) ; drops/deletes elements off of the end
 (take right 1) ; returns new list of last x elements
 (remove 2 li) ; removes the first 2 from list
 (remove* 2 li) ; removes all 2's from the list
 (null? li) ; checks if list is null
 (list? li) ; checks if list is a list
 (list arg) ; creates a list out of the arguments
 (flatten li) ; flattens a list e.g '(0 (1 2) 0) becomes '(0 1 2 0)
 (check-duplicates li) ; checks if there are any duplicates in the list if there are returns true, otherwise returns the duplicate value
 (remove-duplicates li) ;removes duplicates from list
 (map li (+100)) ; performs function for each element in this case +100 for each element, !GOOD EXAMPLE FOR TRANSPOSE
 (map car ls) ; would create new list with first element of each list in ls << for 2d lists
 ```