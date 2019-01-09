tr:: [[a]] -> [[a]]
tr lists | length (head lists) == 1 =
  [head x | x <- lists]:[]

tr lists =
  [head x | x <- lists]:
  tr [tail x | x <- lists]
