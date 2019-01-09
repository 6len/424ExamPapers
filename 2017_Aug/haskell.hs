foo:: [a] -> [a] -> [a]
foo list1 list2 =
  fooHelper list1 list2 1

fooHelper:: [a] -> [a] -> Int -> [a]
fooHelper list1 list2 count | count > (length list1) || count > (length list1) =
  list1++list2

fooHelper list1 list2 count =
  (take count list1) ++
  (take (count + 1) list2) ++
  fooHelper (drop count list1) (drop (count+1) list2) (count +2)
