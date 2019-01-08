--tried to get it working in 1 function for a while but couldn't ended up having a helper function

foo :: (Ord a) => [a]->[a]->[a]
foo l1 l2
	= fooHelper 1 l1 l2

fooHelper :: (Ord a) => Int->[a]->[a]->[a]
fooHelper n l1 l2	
	| l1 == [] && l2 /= [] = l2
	| l2 == [] && l1 /= [] = l1
	| l1 == [] && l2 == [] = []
	| otherwise = (take (n) l1) ++ fooHelper (n+1) l2 (drop (n) l1)

main = do 
	print(foo [1,2,3,4,5] [6,7,8,9,10])