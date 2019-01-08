(define (foo list1 list2)
  (fooHelper list1 list2 1))

(define (fooHelper list1 list2 count)
  (if (or (> count (length list2)) (> count (length list1)))
      (append list1 list2)
      (append
          (append
              (extract list1 count)
              (extract list2 (+ count 1)))
          (fooHelper (drop list1 count) (drop list2 (+ count 1)) (+ count 2)))))
