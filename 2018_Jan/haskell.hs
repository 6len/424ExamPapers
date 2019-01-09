tear:: (a->Bool) -> [a] -> [[a]]
tear p li =
  [x | x <- li, p x]:
  [x | x <- li, not (p x)]:[]
