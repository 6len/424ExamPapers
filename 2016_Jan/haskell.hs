revCount:: [a] -> [Int] -> [a]
revCount list1 list2 | (length list1) <= 0 || (length list2) <= 0 =
  []

revCount (x:xs) (y:ys) =
  (revCount xs ys) ++
  take y (repeat x)
