weaveHunks :: (Ord a) => Int->[a]->[a]->[a]
weaveHunks hunk l1 l2 
	| l1 == [] && l2 == [] = []
	| otherwise = (take hunk l1) ++ weaveHunks hunk l2 (drop hunk l1)

main = do 
	print(weaveHunks 2 [1..10] [11..20])
	print(weaveHunks 3 "abcdefghijklmno" "ABCDEFGHIJKLMNO")