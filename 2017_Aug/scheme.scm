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