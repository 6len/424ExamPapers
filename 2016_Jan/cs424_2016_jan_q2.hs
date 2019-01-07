revCount :: [Char]->[Int]->[Char]
revCount (x:xs) (y:ys) = y : revCount xs ys
revCount [] [] = []

main = do
    print(revCount ['a','b','c'] [1,2,3])