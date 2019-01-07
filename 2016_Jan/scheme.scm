#lang scheme
(require srfi/13) 
(require racket/trace)

(define (reverse-with-count l1 l2)
	(if (null? l2) ; if null we do nothing as we have reached the end of the reverse
            null
		(if (= 0 (car l2)) ;if we hit a 0 we move on to the next value
			(reverse-with-count (cdr l1) (cdr l2)) ;moving on to the next value on 0
			(append (reverse-with-count l1 (list-set l2 0 (- (car l2) 1))) (list (car l1)))))) ;calls left recursively so in the case (a b c) (1 2 3) below

;reverse-with-count (a b c) (1 2 3)
;starts up
;>(reverse-with-count (a b c) (1 2 3))
;> (reverse-with-count (a b c) (0 2 3))
;> (reverse-with-count (b c) (2 3))
;> >(reverse-with-count (b c) (1 3))
;> > (reverse-with-count (b c) (0 3))
;> > (reverse-with-count (c) (3))
;> > >(reverse-with-count (c) (2))
;> > > (reverse-with-count (c) (1))
;> > > >(reverse-with-count (c) (0))
;> > > >(reverse-with-count () ())
;< < < <()
;< < < (c)
;< < <(c c)
;< < (c c c)
;< <(c c c b)
;< (c c c b b)
;<(c c c b b a)

(trace reverse-with-count)
(reverse-with-count '(a b c) '(1 2 3))
(reverse-with-count '(d c b a) '(3 0 0 1)) 