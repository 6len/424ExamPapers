weaveHunks:: Int -> [a] -> [a] -> [a]
weaveHunks hunkSize list1 list2 | hunkSize > (length list1) || hunkSize > (length list1) =
  list1++list2

weaveHunks hunkSize list1 list2 =
  (take hunkSize list1) ++
  (take hunkSize list2) ++
  weaveHunks hunkSize (drop hunkSize list1) (drop hunkSize list2)
