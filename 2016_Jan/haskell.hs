revCount :: String->[Int]->String
revCount x y | length x /= 0 && length y /= 0 && (last y) /= 0 = (last x) : revCount x (take ((length y)-1) y ++ [((last y)-1)] ++ drop (length y) y)
revCount x y | length x == 0 && length y == 0 = []
revCount x y = revCount (init x) (init y)
revCount [] [] = []

revCountHelper :: Char->Int->Char
revCountHelper x y = x

main = do
    print(revCount ['a','b','c'] [1,2,3])